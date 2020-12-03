package controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import api.GuildManager;
import api.LoginManager;
import api.UserImgManager;
import dto.BoardDTO;
import dto.GuildRankDTO;
import dto.UserDTO;
import dto.UserRankDTO;
import service.MainService;

//http://localhost:8070/sp/mainPage.do

@Controller
public class MainController {

	private MainService service;

	LoginManager loginManager = LoginManager.getInstance();
	GuildManager guildManager = GuildManager.getInstance();
	
	public void setService(MainService service) {
		this.service = service;
	}

	public MainController() {

	}
	
	//메인 페이지 접근
	@RequestMapping(value ="/index.do")
	public ModelAndView mainPage(HttpSession session) {
		System.out.println("메인 페이지 접근.");
		ModelAndView mav = new ModelAndView();
		//게시판글 담기
		BoardDTO noticeDto = new BoardDTO();
		BoardDTO eventDto = new BoardDTO();
		BoardDTO updateDto = new BoardDTO();
		//길드 랭킹 담기
		GuildRankDTO guildRankDto = new GuildRankDTO();
		//유저 랭킹 담기
		UserRankDTO userRankDto = new UserRankDTO();
		UserImgManager UIM  = new UserImgManager();
		//로그인한 유저 세션 담기
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		if(udto != null) {
			UserDTO reUdto = service.mainUserInfoService(udto.getUsr_name());
			session.setAttribute("userInfoSession", reUdto);
		}
		if(session.getAttribute("userInfoSession") != null) {
			Object loginFlag = session.getAttribute("userLoginFlag");
			if((Integer)loginFlag == 1) {
				session.setAttribute("loginWellcome", 1);
				session.setAttribute("userLoginFlag", 0);
			}else {
				session.setAttribute("loginWellcome", 0);
			}
		}else {
			session.setAttribute("loginWellcome", 0);
		}
		
		//유저 랭킹 리스트를 DB 조회 후 DTO에 담는다
		List<UserRankDTO> aList = service.mainUserTopRankList(userRankDto);
		for(UserRankDTO dto : aList) {
			dto.setLevel_img_path(UIM.userLevelImg(dto.getUsr_level()));
		}
		
		//길드 랭킹 뿌리기
		mav.addObject("guildRank", service.mainGuildTopRankList(guildRankDto));
		//유저 랭킹 뿌리기
		mav.addObject("userRank", aList);
		//게시판 뿌리기
		mav.addObject("notice", service.mainNoticeBoardListService(noticeDto));
		mav.addObject("event", service.mainEventBoardListService(eventDto));
		mav.addObject("update", service.mainUpdateBoardListService(updateDto));
		mav.setViewName("/main/mainPage");
		return mav;
	}
	
	//이미 접속중인지 세션 체크
	@ResponseBody
	@RequestMapping(value ="/alreadySessionCheckProcess.do" , method = RequestMethod.POST)
	public int alreadySessionCheckProcess(String userSessionid, HttpSession session) {
		int flag = 0;
		//해쉬테이블에 담겨 있는 세션정보에서 접속한 아이디를 소문자로 변경하여 조회한다
		boolean userIsLoginCheck = loginManager.loginIsUsing(userSessionid.toLowerCase());//이미 사용중인지 체크
		if(userIsLoginCheck == true) {
			flag = 1; // 이미 접속중
		}else {
			flag = 0; // 접속 가능
		}
		System.out.println("alreadySessionCheckProcess : " + flag);
		return flag;
	}
	
	@RequestMapping(value ="/template.do")
	public String templatePage() {
		System.out.println("템플릿 페이지 접근.");
		//ModelAndView mav = new ModelAndView();
		//mav.setViewName("/views/template/mainPage");
		return "/template2/index";
	}
}
