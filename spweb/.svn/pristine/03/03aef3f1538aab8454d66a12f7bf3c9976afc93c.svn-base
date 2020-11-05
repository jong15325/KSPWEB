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
	
	@RequestMapping(value ="/index.do")
	public ModelAndView mainPage(HttpSession session) {
		System.out.println("메인 페이지 접근.");
		ModelAndView mav = new ModelAndView();
		BoardDTO noticeDto = new BoardDTO();
		BoardDTO eventDto = new BoardDTO();
		BoardDTO updateDto = new BoardDTO();
		GuildRankDTO guildRankDto = new GuildRankDTO();
		UserRankDTO userRankDto = new UserRankDTO();
		UserImgManager UIM  = new UserImgManager();
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
		
		List<UserRankDTO> aList = service.mainUserTopRankList(userRankDto);
		for(UserRankDTO dto : aList) {
			dto.setLevel_img_path(UIM.userLevelImg(dto.getUsr_level()));
		}
		mav.addObject("guildRank", service.mainGuildTopRankList(guildRankDto));
		mav.addObject("userRank", aList);
		mav.addObject("notice", service.mainNoticeBoardListService(noticeDto));
		mav.addObject("event", service.mainEventBoardListService(eventDto));
		mav.addObject("update", service.mainUpdateBoardListService(updateDto));
		mav.setViewName("/main/mainPage");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value ="/alreadySessionCheckProcess.do" , method = RequestMethod.POST)
	public int alreadySessionCheckProcess(String userSessionid, HttpSession session) {
		int flag = 0;
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
