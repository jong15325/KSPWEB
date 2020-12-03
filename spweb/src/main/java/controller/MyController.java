package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import api.CardInfoManager;
import api.UserCardImgManager;
import api.UserImgManager;
import dto.GuestBookDTO;
import dto.UserDTO;
import dto.UserNowEquipDTO;
import dto.UserPageDTO;
import service.MyService;

@Controller
public class MyController {
	
	private MyService service;
	private int currentPage;
	private UserPageDTO pdto;
	
	public void setService(MyService service) {
		this.service = service;
	}

	public MyController() {

	}
	
	@RequestMapping(value = "/myPage.do")
	public ModelAndView MyPage(HttpSession session) {
		System.out.println("내 정보 페이지 접근.");
		ModelAndView mav = new ModelAndView();
		UserImgManager UIM  = new UserImgManager();
		UserNowEquipDTO emdto = new UserNowEquipDTO();
		UserNowEquipDTO ewdto = new UserNowEquipDTO();
		UserNowEquipDTO eadto = new UserNowEquipDTO();
		UserNowEquipDTO epdto = new UserNowEquipDTO();
		CardInfoManager cim = new CardInfoManager();
		UserCardImgManager UCIM = new UserCardImgManager();
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		udto = service.myPageService(udto.getUsr_name());
		mav.addObject("UserDTO", udto);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usr_id", udto.getUsr_id());
		map.put("like_usr_id", udto.getUsr_id());
		map.put("itm_usr_id", udto.getUsr_id());
		emdto = service.myInfoNowEquipMagicService(map);
		ewdto = service.myInfoNowEquipWeaponService(map);
		eadto = service.myInfoNowEquipArmService(map);
		epdto = service.myInfoNowEquipPetService(map);
		if(emdto != null) {
			emdto.setItm_img_path(UCIM.userSPCardImg(emdto.getItm_type(), emdto.getItm_level(), false));
			emdto.setCard_date(cim.card_date(emdto.getItm_type(), emdto.getItm_gf(), emdto.getItm_level(), false));
			mav.addObject("UserNowEquipMagic", emdto);
		}
		if(ewdto != null) {
			ewdto.setCard_date(cim.card_date(ewdto.getItm_type(), ewdto.getItm_gf(), ewdto.getItm_level(), false));
			ewdto.setItm_img_path(UCIM.userSPCardImg(ewdto.getItm_type(), ewdto.getItm_level(), false));
			mav.addObject("UserNowEquipWeapon", ewdto);
		}
		if(eadto != null) {
			eadto.setCard_date(cim.card_date(eadto.getItm_type(), eadto.getItm_gf(), eadto.getItm_level(), false));
			eadto.setItm_img_path(UCIM.userSPCardImg(eadto.getItm_type(), eadto.getItm_level(), false));
			mav.addObject("UserNowEquipArm", eadto);
		}
		if(epdto != null) {
			epdto.setItm_img_path(UCIM.userPetCardImg(epdto.getItm_type()));
			mav.addObject("UserNowEquipPet", epdto);
		}
		mav.addObject("myHomeLike", service.myHomeLikeCheckService(map));
		mav.addObject("myInfoLevelImg", UIM.userLevelImg(udto.getUsr_level()));
		mav.addObject("myInfoCharImg", UIM.userMainCharacterImg(udto.getUsr_char()));
		mav.addObject("myInfoRank", service.myInfoRankService(udto.getUsr_name()));
		//mav.addObject("myHomeGuestBook", service.myHomeGuestBookListProcess(udto.getUsr_id()));
		mav.setViewName("/my/myPage");
		return mav;
	}
	
	@RequestMapping(value = "/userMyPage.do")
	public ModelAndView userMyPage(String you_usr_name, HttpSession session) {
		System.out.println("유저 정보 페이지 접근.");
		ModelAndView mav = new ModelAndView();
		UserImgManager UIM  = new UserImgManager();
		UserNowEquipDTO emdto = new UserNowEquipDTO();
		UserNowEquipDTO ewdto = new UserNowEquipDTO();
		UserNowEquipDTO eadto = new UserNowEquipDTO();
		UserNowEquipDTO epdto = new UserNowEquipDTO();
		UserCardImgManager UCIM = new UserCardImgManager();
		CardInfoManager cim = new CardInfoManager();
		//유저 정보 및 추천 수 설정
		UserDTO udto = service.myPageService(you_usr_name);
		UserDTO like_udto = (UserDTO) session.getAttribute("userInfoSession");
		mav.addObject("UserDTO", udto);
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map.put("usr_id", like_udto.getUsr_id());
		map.put("like_usr_id", udto.getUsr_id());
		map2.put("usr_id", udto.getUsr_id());
		map2.put("itm_usr_id", udto.getUsr_id());
		
		//장착현황
		emdto = service.myInfoNowEquipMagicService(map2);
		ewdto = service.myInfoNowEquipWeaponService(map2);
		eadto = service.myInfoNowEquipArmService(map2);
		epdto = service.myInfoNowEquipPetService(map2);
		if(emdto != null) {
			emdto.setItm_img_path(UCIM.userSPCardImg(emdto.getItm_type(), emdto.getItm_level(), false));
			emdto.setCard_date(cim.card_date(emdto.getItm_type(), emdto.getItm_gf(), emdto.getItm_level(), false));
			mav.addObject("UserNowEquipMagic", emdto);
		}
		if(ewdto != null) {
			ewdto.setItm_img_path(UCIM.userSPCardImg(ewdto.getItm_type(), ewdto.getItm_level(), false));
			ewdto.setCard_date(cim.card_date(ewdto.getItm_type(), ewdto.getItm_gf(), ewdto.getItm_level(), false));
			mav.addObject("UserNowEquipWeapon", ewdto);
		}
		if(eadto != null) {
			eadto.setItm_img_path(UCIM.userSPCardImg(eadto.getItm_type(), eadto.getItm_level(), false));
			eadto.setCard_date(cim.card_date(eadto.getItm_type(), eadto.getItm_gf(), eadto.getItm_level(), false));
			mav.addObject("UserNowEquipArm", eadto);
		}
		if(epdto != null) {
			epdto.setItm_img_path(UCIM.userPetCardImg(epdto.getItm_type()));
			mav.addObject("UserNowEquipPet", epdto);
		}
		
		//결과 뿌리기
		mav.addObject("myHomeLike", service.myHomeLikeCheckService(map));
		mav.addObject("myInfoLevelImg", UIM.userLevelImg(udto.getUsr_level()));
		mav.addObject("myInfoCharImg", UIM.userMainCharacterImg(udto.getUsr_char()));
		mav.addObject("myInfoRank", service.myInfoRankService(udto.getUsr_name()));
		//mav.addObject("myHomeGuestBook", service.myHomeGuestBookListProcess(udto.getUsr_id()));
		mav.setViewName("/my/userMyPage");
		return mav;
	}
	
	@RequestMapping(value = "/userList.do")
	public ModelAndView userList(UserPageDTO userPageDto) {
		System.out.println("유저 리스트 페이지 접근.");
		ModelAndView mav = new ModelAndView();
		int totalRecord = service.userMyListTotalCountService();
		if (totalRecord >= 1) {
			if (userPageDto.getCurrentPage() == 0)
				currentPage = 1;
			else {
				currentPage = userPageDto.getCurrentPage();
				if (currentPage < 0) {
					currentPage = -(currentPage);
					System.out.println("currentPage : " + currentPage);
				}
			}
			System.out.println("currentPage : " + currentPage);
			pdto = new UserPageDTO(currentPage, totalRecord);
			System.out.println("총 페이지 수 : " + pdto.getTotalPage());
			System.out.println("총 레코드 수 : " + pdto.getTotalCount());
			System.out.println("시작 레코드 번호 : " + pdto.getStartRow());
			System.out.println("끝 레코드 번호 : " + pdto.getEndRow());
			System.out.println("시작 페이지 번호 : " + pdto.getStartPage());
			System.out.println("끝 페이지 번호 : " + pdto.getEndPage());
			mav.addObject("userPageDto", pdto);
			mav.addObject("aList", service.userMyListService(pdto));
		}
		mav.setViewName("/my/userList");
		return mav;
	}
	
	@RequestMapping(value = "/userSearch.do")
	public ModelAndView userSearch(String option, String keyword, UserPageDTO userPageDto) {
		System.out.println("유저 검색 페이지 접근.");
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("option", option);
		map.put("keyword", keyword);
		int totalRecord = service.userSearchCountMapProcess(map);
		if (totalRecord >= 1) {
			if (userPageDto.getCurrentPage() == 0)
				currentPage = 1;
			else {
				currentPage = userPageDto.getCurrentPage();
				if (currentPage < 0) {
					currentPage = -(currentPage);
					System.out.println("currentPage : " + currentPage);
				}
			}
			System.out.println("currentPage : " + currentPage);
			pdto = new UserPageDTO(currentPage, totalRecord);
			System.out.println("총 페이지 수 : " + pdto.getTotalPage());
			System.out.println("총 레코드 수 : " + pdto.getTotalCount());
			System.out.println("시작 레코드 번호 : " + pdto.getStartRow());
			System.out.println("끝 레코드 번호 : " + pdto.getEndRow());
			System.out.println("시작 페이지 번호 : " + pdto.getStartPage());
			System.out.println("끝 페이지 번호 : " + pdto.getEndPage());
			mav.addObject("userPageDto", pdto);
			map.put("startRow", pdto.getStartRow());
			map.put("blockCount", pdto.getBlockCount());
			mav.addObject("map", map);
			mav.addObject("aList", service.userSearchLMapProcess(map));
		}
		mav.setViewName("/my/userSearch");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/myHomeLike.do")
	public int guildLike(int usr_id, String usr_name, int like_usr_id, String like_usr_name, int like_type) {
		System.out.println("내 정보 좋아요 접근.");
		System.out.println("usr_id : "+ usr_id);
		System.out.println("usr_name : "+ usr_name);
		System.out.println("like_usr_id : "+ like_usr_id);
		System.out.println("like_usr_name : "+ like_usr_name);
		System.out.println("like_type : "+ like_type);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usr_id", usr_id);
		map.put("like_usr_id", like_usr_id);
		int checkFlag = service.myHomeLikeCheckService(map);
		int successFlag = 0;
		if(checkFlag == 0) {
			map.put("usr_name", usr_name);
			map.put("like_usr_name", like_usr_name);
			map.put("like_type", like_type);
			service.myHomeLikeInsertService(map);
			successFlag = 1;
		}else if(checkFlag == 1) {
			service.myHomeLikeDeleteService(map);
			successFlag = 2;
		}
		return successFlag;
	}
	
	@RequestMapping(value = "/myHomeGuestBookListProcess.do", method = RequestMethod.POST)
	public @ResponseBody List<GuestBookDTO> myHomeGuestBookList(GuestBookDTO gdto, int type_id, int viewLastNum, int viewLimitNum){
		System.out.println("방명록 리스트 프로세스 접근");
		HashMap<String, Object> map = new HashMap<String, Object>();
		//현재까지 보여진 댓글 마지막 번호
		map.put("startRow", viewLastNum);
		//어떤 페이지의 방명록인지
		map.put("type_id", type_id);
		//방명록 갯수 확인
		viewLimitNum = service.myHomeGuestBookCountService(map); // 전체가져오기
		map.put("lastRow", viewLimitNum);
		return service.myHomeGuestBookList2Service(map);
	}
	
	@RequestMapping(value = "/myHomeGuestBookInsertProcess.do", method = RequestMethod.POST)
	public @ResponseBody List<GuestBookDTO> myHomeGuestBookInsertProcess(GuestBookDTO gdto){
		System.out.println("방명록 등록 프로세스 접근");
		return service.myHomeGuestBookInsertProcess(gdto);
	}
	
	@RequestMapping(value = "/myHomeGuestBookDeleteProcess.do", method = RequestMethod.POST)
	public @ResponseBody List<GuestBookDTO> myHomeGuestBookDeleteProcess(GuestBookDTO gdto){
		System.out.println("방명록 삭제 프로세스 접근");
		return service.myHomeGuestBookDeleteProcess(gdto);
	}
	
	@RequestMapping(value = "/myInformationChangeCheck.do")
	public ModelAndView myInformationChangeCheck(HttpSession session) {
		System.out.println("내 정보 변경 체크 페이지 접근.");
		ModelAndView mav = new ModelAndView();
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		if(udto != null) {
			UserImgManager UIM  = new UserImgManager();
			mav.addObject("userDTO", udto);
			mav.addObject("myInfoCharImg", UIM.userMainCharacterImg(udto.getUsr_char()));
			mav.setViewName("/my/myInfoChangeCheck");
		}else {
			mav.setViewName("/user/userLogin");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/myInformationChange.do")
	public ModelAndView myInformationChange(HttpSession session) {
		System.out.println("내 정보 변경 페이지 접근.");
		ModelAndView mav = new ModelAndView();
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		if(udto != null) {
			UserImgManager UIM  = new UserImgManager();
			mav.addObject("userDTO", udto);
			mav.addObject("myInfoCharImg", UIM.userMainCharacterImg(udto.getUsr_char()));
			mav.setViewName("/my/myInfoChange");
		}else {
			mav.setViewName("/user/userLogin");
		}
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/myInfoPasswordCheck.do")
	public int myInfoPasswordCheck(HttpSession session, String changeusr_name, String changePassword) {
		System.out.println("내 정보 변경 체크 프로세스 접근.");
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int successFlag = 0;
		if(udto != null) {
			if(changePassword != "") {
				map.put("usr_name", changeusr_name);
				map.put("usr_pw", changePassword);
				int checkFlag = service.myInformationChangeCheckService(map);
				if(checkFlag == 1) {
					successFlag = 1; //일치O
				}else {
					successFlag = 2; // 일치X
				}
			}else {
				successFlag = 3; // 입력X
			}
		}else {
			successFlag = 0;
		}
		
		return successFlag;
	}
	
}
