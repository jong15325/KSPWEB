package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import api.GetStringByteManager;
import api.UserImgManager;
import dto.MessageDTO;
import dto.MessagePageDTO;
import dto.UserDTO;
import service.MyMessageService;

@Controller
public class MyMessageController {

	private MyMessageService service;
	private int currentPage;
	private MessagePageDTO pdto;
	
	public void setService(MyMessageService service) {
		this.service = service;
	}

	public MyMessageController() {

	}
	
	@RequestMapping(value = "/mySendMessageBox.do")
	public ModelAndView mySendMessageBox(MessagePageDTO messagePageDto, HttpSession session) {
		System.out.println("내 보낸 메세지 박스 접근.");
		ModelAndView mav = new ModelAndView();
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		int totalRecord = service.myMessageSendCountService(udto.getUsr_name());
		if (totalRecord >= 1) {
			if (messagePageDto.getCurrentPage() == 0)
				currentPage = 1;
			else {
				currentPage = messagePageDto.getCurrentPage();
				if (currentPage < 0) {
					currentPage = -(currentPage);
					System.out.println("currentPage : " + currentPage);
				}

			}
			System.out.println("currentPage : " + currentPage);
			pdto = new MessagePageDTO(currentPage, totalRecord);
			System.out.println("총 페이지 수 : " + pdto.getTotalPage());
			System.out.println("총 레코드 수 : " + pdto.getTotalCount());
			System.out.println("시작 레코드 번호 : " + pdto.getStartRow());
			System.out.println("끝 레코드 번호 : " + pdto.getEndRow());
			System.out.println("시작 페이지 번호 : " + pdto.getStartPage());
			System.out.println("끝 페이지 번호 : " + pdto.getEndPage());
			mav.addObject("messagePageDto", pdto);
			mav.addObject("aList", service.mySendMessageBoxListService(pdto, udto.getUsr_name()));
		}
		mav.addObject("inboxUnreadCount", service.myMessageUnreadCountService(udto.getUsr_name()));
		mav.addObject("inboxDeleteCount", service.myMessageDeleteCountService(udto.getUsr_name()));
		mav.addObject("inboxSendCount", service.myMessageSendCountService(udto.getUsr_name()));
		mav.setViewName("/message/mySendMessageBox");
		return mav;
	}
	
	@RequestMapping(value = "/myMessageBox.do")
	public ModelAndView myMessageBox(MessagePageDTO messagePageDto, HttpSession session) {
		System.out.println("내 메세지 박스 접근.");
		ModelAndView mav = new ModelAndView();
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		int totalRecord = service.myMessageBoxCountService(udto.getUsr_name());
		if (totalRecord >= 1) {
			if (messagePageDto.getCurrentPage() == 0)
				currentPage = 1;
			else {
				currentPage = messagePageDto.getCurrentPage();
				if (currentPage < 0) {
					currentPage = -(currentPage);
					System.out.println("currentPage : " + currentPage);
				}

			}
			System.out.println("currentPage : " + currentPage);
			pdto = new MessagePageDTO(currentPage, totalRecord);
			System.out.println("총 페이지 수 : " + pdto.getTotalPage());
			System.out.println("총 레코드 수 : " + pdto.getTotalCount());
			System.out.println("시작 레코드 번호 : " + pdto.getStartRow());
			System.out.println("끝 레코드 번호 : " + pdto.getEndRow());
			System.out.println("시작 페이지 번호 : " + pdto.getStartPage());
			System.out.println("끝 페이지 번호 : " + pdto.getEndPage());
			mav.addObject("messagePageDto", pdto);
			mav.addObject("aList", service.myMessageBoxListService(pdto, udto.getUsr_name()));
		}
		mav.addObject("inboxUnreadCount", service.myMessageUnreadCountService(udto.getUsr_name()));
		mav.addObject("inboxDeleteCount", service.myMessageDeleteCountService(udto.getUsr_name()));
		mav.addObject("inboxSendCount", service.myMessageSendCountService(udto.getUsr_name()));
		mav.setViewName("/message/myMessageBox");
		return mav;
	}
	
	@RequestMapping(value = "/myMessageView.do")
	public ModelAndView myMessageBox(HttpSession session, Integer messageValue) {
		System.out.println("내 메세지 뷰 접근.");
		ModelAndView mav = new ModelAndView();
		if(messageValue != null) {
			UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
			MessageDTO mdto = new MessageDTO();
			UserImgManager UIM  = new UserImgManager();
			System.out.println("messageId : "+ messageValue);
			mdto = service.myMessageBoxViewService(messageValue);
			mav.addObject("messageBoxDto", mdto);
			mav.addObject("myInfoLevelImg", UIM.userLevelImg(udto.getUsr_level()));
			mav.addObject("inboxUnreadCount", service.myMessageUnreadCountService(udto.getUsr_name()));
			mav.addObject("inboxDeleteCount", service.myMessageDeleteCountService(udto.getUsr_name()));
			mav.addObject("inboxSendCount", service.myMessageSendCountService(udto.getUsr_name()));
			System.out.println("센트 : "+mdto.getSent());
			if(mdto.getSent() == 0) {
				System.out.println("업데이트 센트 : ");
				service.myReadMessageUpdateService(messageValue);
			}
			mav.setViewName("/message/myMessageView");
		}else {
			mav.setViewName("redirect:/myMessageBox.do");
		}
		return mav;
	}
	
	@RequestMapping(value = "/mySendMessageView.do")
	public ModelAndView mySendMessageBox(HttpSession session, Integer messageValue) {
		System.out.println("내 메세지 뷰 접근.");
		ModelAndView mav = new ModelAndView();
		if(messageValue != null) {
			UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
			MessageDTO mdto = new MessageDTO();
			UserImgManager UIM  = new UserImgManager();
			System.out.println("messageId : "+ messageValue);
			mdto = service.myMessageBoxViewService(messageValue);
			mav.addObject("messageBoxDto", mdto);
			mav.addObject("myInfoLevelImg", UIM.userLevelImg(udto.getUsr_level()));
			mav.addObject("inboxUnreadCount", service.myMessageUnreadCountService(udto.getUsr_name()));
			mav.addObject("inboxDeleteCount", service.myMessageDeleteCountService(udto.getUsr_name()));
			mav.addObject("inboxSendCount", service.myMessageSendCountService(udto.getUsr_name()));
			mav.setViewName("/message/mySendMessageView");
		}else {
			mav.setViewName("redirect:/mySendMessageBox.do");
		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/myMessageBoxCheckDelete.do")
	public int myMessageBoxCheckDelete(String num) {
		System.out.println("쪽지 선택 삭제 프로세스 접근.");
		System.out.println("delete num : "+ num);
		int successFlag = 0;
		String[] checkDeleteNo = num.split(",");
		for(int i =0; i<checkDeleteNo.length; i++) {
			service.myMessageBoxDeleteService(Integer.parseInt(checkDeleteNo[i]));
		}
		return successFlag;
	}
	
	@RequestMapping(value = "/myMessageSearch.do")
	public ModelAndView myMessageSearch(HttpSession session, String option, String keyword, MessagePageDTO messagePageDto) throws IOException {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		map.put("option", option);
		map.put("keyword", keyword);
		map.put("username", udto.getUsr_name());
		int totalRecord = service.myMessageSearchCountMapProcess(map);
		if (totalRecord >= 1) {
			if (messagePageDto.getCurrentPage() == 0)
				currentPage = 1;
			else {
				currentPage = messagePageDto.getCurrentPage();
				if (currentPage < 0) {
					currentPage = -(currentPage);
					System.out.println("currentPage : " + currentPage);
				}

			}
			System.out.println("currentPage : " + currentPage);
			pdto = new MessagePageDTO(currentPage, totalRecord);
			System.out.println("총 페이지 수 : " + pdto.getTotalPage());
			System.out.println("총 레코드 수 : " + pdto.getTotalCount());
			System.out.println("시작 레코드 번호 : " + pdto.getStartRow());
			System.out.println("끝 레코드 번호 : " + pdto.getEndRow());
			System.out.println("시작 페이지 번호 : " + pdto.getStartPage());
			System.out.println("끝 페이지 번호 : " + pdto.getEndPage());
			map.put("startRow", pdto.getStartRow());
			map.put("blockCount", pdto.getBlockCount());
			mav.addObject("messagePageDto", pdto);
			mav.addObject("map", map);
			mav.addObject("aList", service.myMessageSearchLMapProcess(pdto, map));
		}
		mav.addObject("inboxUnreadCount", service.myMessageUnreadCountService(udto.getUsr_name()));
		mav.addObject("inboxDeleteCount", service.myMessageDeleteCountService(udto.getUsr_name()));
		mav.addObject("inboxSendCount", service.myMessageSendCountService(udto.getUsr_name()));
		mav.setViewName("/message/myMessageBoxSearch");
		return mav;
	}
	
	@RequestMapping(value = "/mySendMessageSearch.do")
	public ModelAndView mySendMessageSearch(HttpSession session, String option, String keyword, MessagePageDTO messagePageDto) throws IOException {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		map.put("option", option);
		map.put("keyword", keyword);
		map.put("sender", udto.getUsr_name());
		int totalRecord = service.mySendMessageSearchCountMapProcess(map);
		if (totalRecord >= 1) {
			if (messagePageDto.getCurrentPage() == 0)
				currentPage = 1;
			else {
				currentPage = messagePageDto.getCurrentPage();
				if (currentPage < 0) {
					currentPage = -(currentPage);
					System.out.println("currentPage : " + currentPage);
				}

			}
			System.out.println("currentPage : " + currentPage);
			pdto = new MessagePageDTO(currentPage, totalRecord);
			System.out.println("총 페이지 수 : " + pdto.getTotalPage());
			System.out.println("총 레코드 수 : " + pdto.getTotalCount());
			System.out.println("시작 레코드 번호 : " + pdto.getStartRow());
			System.out.println("끝 레코드 번호 : " + pdto.getEndRow());
			System.out.println("시작 페이지 번호 : " + pdto.getStartPage());
			System.out.println("끝 페이지 번호 : " + pdto.getEndPage());
			map.put("startRow", pdto.getStartRow());
			map.put("blockCount", pdto.getBlockCount());
			mav.addObject("messagePageDto", pdto);
			mav.addObject("map", map);
			mav.addObject("aList", service.mySendMessageSearchLMapProcess(pdto, map));
		}
		mav.addObject("inboxUnreadCount", service.myMessageUnreadCountService(udto.getUsr_name()));
		mav.addObject("inboxDeleteCount", service.myMessageDeleteCountService(udto.getUsr_name()));
		mav.addObject("inboxSendCount", service.myMessageSendCountService(udto.getUsr_name()));
		mav.setViewName("/message/mySendMessageBoxSearch");
		return mav;
	}
	
	@RequestMapping(value = "/sendMessage.do")
	public ModelAndView sendMessage(HttpSession session) {
		System.out.println("내 메세지 뷰 접근.");
		ModelAndView mav = new ModelAndView();
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		mav.addObject("inboxUnreadCount", service.myMessageUnreadCountService(udto.getUsr_name()));
		mav.addObject("inboxDeleteCount", service.myMessageDeleteCountService(udto.getUsr_name()));
		mav.addObject("inboxSendCount", service.myMessageSendCountService(udto.getUsr_name()));
		mav.setViewName("/message/sendMessage");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/userNameCheck.do", method = RequestMethod.POST)
	public int userNameCheck(String usr_name, HttpSession session) {
		System.out.println("유저네임 체크 접근.");
		int checkUserName = service.userNameCountService(usr_name);
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		int checkFlag = 0;
		if(checkUserName <= 0) {
			System.out.println("아이디 없음");
			checkFlag = 0;
		} else {
			System.out.println("아이디 있음");
			if(usr_name.equals(udto.getUsr_name())) {
				checkFlag = 2;
			} else {
				checkFlag = 1;
			}
		}
		return checkFlag;
	}
	
	@ResponseBody
	@RequestMapping(value = "/sendMessageProcess.do")
	public int sendMessageProcess(HttpSession session, String usr_name, int messageType, String send1, String send2, String send3, String send4) {
		System.out.println("내 메세지 보내기 접근.");
		int successFlag = 0;
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sender", udto.getUsr_name());
		map.put("username", usr_name);
		//MessageDTO mdto = service.myPreviousMessageService(map);
				
		/*if(mdto != null) {
			if(mdto.getSend_date() == ){ //3분전 이력이 있을 때
				successFlag = 1;
			}else {
				successFlag = 0;
			}
		}*/
		
		if(successFlag == 0) {
			successFlag = 0;
			int levelAndGender = 0;
			int userGender = 0;
			if(udto.getUsr_gender() == 1) {
				userGender = 1;
			}
			int byteSub1 = 28-GetStringByteManager.getStringByte(send1);
			int byteSub2 = 28-GetStringByteManager.getStringByte(send2);
			int byteSub3 = 28-GetStringByteManager.getStringByte(send3);
			
			String space1 = " ";
			String space2 = " ";
			String space3 = " ";
			
			for(int i = 0; i<byteSub1-1; i++) {
				space1 = space1+" ";
			}
			for(int i = 0; i<byteSub2-1; i++) {
				space2 = space2+" ";
			}
			for(int i = 0; i<byteSub3-1; i++) {
				space3 = space3+" ";
			}

			String sendMessage = send1+space1+send2+space2+send3+space3+send4;
			levelAndGender = (udto.getUsr_level() * 100) + userGender;
			map.put("messageType", messageType);
			map.put("levelAndGender", levelAndGender);
			map.put("msg", sendMessage);
			service.mySendMessageInsertService(map);
		}
		return successFlag;
	}
	
	@RequestMapping(value = "/sendReplyMessage.do")
	public ModelAndView sendReplyMessage(HttpSession session, String messageSender) {
		System.out.println("내 메세지 뷰 접근.");
		ModelAndView mav = new ModelAndView();
		System.out.println("messageSender : "+messageSender);
		if(messageSender != null) {
			UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
			mav.addObject("reply_usr_name", messageSender);
			mav.addObject("inboxUnreadCount", service.myMessageUnreadCountService(udto.getUsr_name()));
			mav.addObject("inboxDeleteCount", service.myMessageDeleteCountService(udto.getUsr_name()));
			mav.addObject("inboxSendCount", service.myMessageSendCountService(udto.getUsr_name()));
			mav.setViewName("/message/sendReplyMessage");	
		}else {
			mav.setViewName("redirect:/myMessageBox.do");
		}
		return mav;
	}

}
