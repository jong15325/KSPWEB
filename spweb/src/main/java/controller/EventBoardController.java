package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import api.GetUserIPUtil;
import dto.BoardDTO;
import dto.BoardPageDTO;
import dto.ReplyDTO;
import dto.UserDTO;
import service.EventBoardService;

@Controller
public class EventBoardController {

	private EventBoardService service;
	private int currentPage;
	private BoardPageDTO pdto;

	public void setService(EventBoardService service) {
		this.service = service;
	}

	public EventBoardController() {

	}

	@RequestMapping(value = "/eventBoardInsert.do", method = RequestMethod.GET)
	public ModelAndView eventBoardInsert() {
		System.out.println("게시판 등록 페이지 접근.");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/eventboard/eventBoardInsert");
		return mav;
	}

	@RequestMapping(value = "/eventBoardInsertProcess.do", method = RequestMethod.POST)
	public String eventBoardInsertProcess(BoardDTO eventBoardDto, HttpServletRequest request) {
		System.out.println("게시판 등록 프로세스 접근.");
		/*
		 * TEST for (int i = 1; i <= 500; i++) { eventboardDto.setArticle_title("타이틀 " +
		 * i + "번째"); eventboardDto.setArticle_writer("작성자 " + i + "번째");
		 * eventboardDto.setArticle_content("내용 " + i + "번째");
		 * service.eventBoardInsertService(eventboardDto); }
		 */
		String uuid = UUID.randomUUID().toString().replace("-","");
		System.out.println("글 UUID 생성 : "+ uuid);
		service.eventBoardInsertService(eventBoardDto, uuid);
		int boardNumUUID = service.eventBoardUUIDService(uuid);
		System.out.println("등록된 글 넘버 : "+boardNumUUID);
		/*
		 * mav.setViewName("redirect:/eventBoardContentRead.do?currentPage=1&article_no="
		 * +boardNumUUID); "redirect:/combineAll.do";
		 */
		return "redirect:/eventBoardContentRead.do?currentPage=1&article_no="+boardNumUUID;
	}

	@RequestMapping(value = "/eventBoardMain.do")
	public ModelAndView eventBoardList(BoardDTO eventBoardDto, BoardPageDTO eventBoardPageDto) {
		System.out.println("게시판 리스트 접근.");
		ModelAndView mav = new ModelAndView();
		int totalRecord = service.eventBoardTotalCountService();
		if (totalRecord >= 1) {
			if (eventBoardPageDto.getCurrentPage() == 0)
				currentPage = 1;
			else {
				currentPage = eventBoardPageDto.getCurrentPage();
				if (currentPage < 0) {
					currentPage = -(currentPage);
					System.out.println("currentPage : " + currentPage);
				}

			}
			System.out.println("currentPage : " + currentPage);
			pdto = new BoardPageDTO(currentPage, totalRecord);
			System.out.println("총 페이지 수 : " + pdto.getTotalPage());
			System.out.println("총 레코드 수 : " + pdto.getTotalCount());
			System.out.println("시작 레코드 번호 : " + pdto.getStartRow());
			System.out.println("끝 레코드 번호 : " + pdto.getEndRow());
			System.out.println("시작 페이지 번호 : " + pdto.getStartPage());
			System.out.println("끝 페이지 번호 : " + pdto.getEndPage());
			mav.addObject("eventBoardPageDto", pdto);
			mav.addObject("aList", service.eventBoardList(pdto));
		}

		mav.setViewName("/board/eventboard/eventBoardMain");
		return mav;
	}

	@RequestMapping(value = "/eventBoardContentRead.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView eventBoardContentRead(int article_no, HttpServletRequest request, HttpSession session) {
		System.out.println("게시판 글뷰 접근.");
		ModelAndView mav = new ModelAndView();
		UserDTO userDto = (UserDTO) session.getAttribute("userInfoSession");
		mav.addObject("contentView", service.eventBoardContentRead(article_no));
		mav.addObject("contentViewReply", service.eventBoardReplyListProcess(article_no));
		mav.addObject("currentPage", currentPage);
		mav.addObject("replyCount", service.eventBoardReplyCountProcess(article_no));
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//System.out.println("콘텐트 이름 : "+ userDto.getUsr_name());
		map.put("article_no", article_no);
		map.put("usr_name", userDto.getUsr_name());
		int viewCheck = service.eventBoardViewCountCheckService(map);
		if (viewCheck == 0) {
			String getUserIp = GetUserIPUtil.getRemoteAddr(request);
			map.put("view_usr_ip", getUserIp);
			service.eventBoardViewCountUpdateService(article_no);
			service.eventBoardViewCountInsertService(map);
		}
		mav.setViewName("/board/eventboard/eventBoardContentRead");
		return mav;
	}

	@RequestMapping(value = "/eventBoardUpdate.do", method = RequestMethod.GET)
	public ModelAndView eventBoardUpdate(int article_no) {
		System.out.println("게시판 업데이트 접근.");
		ModelAndView mav = new ModelAndView();
		mav.addObject("contentUpdate", service.eventBoardSelectNumService(article_no));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/board/eventboard/eventBoardUpdate");
		return mav;
	}

	@RequestMapping(value = "/eventBoardUpdateProcess.do", method = RequestMethod.POST)
	public ModelAndView eventBoardUpdateProcess(BoardDTO eventBoardDto) {
		ModelAndView mav = new ModelAndView();
		System.out.println("게시판 업데이트 프로세스 접근.");
		System.out.println("getArticle_title : " + eventBoardDto.getArticle_title());
		System.out.println("getArticle_writer : " + eventBoardDto.getArticle_writer());
		System.out.println("getArticle_content : " + eventBoardDto.getArticle_content());
		service.eventBoardUpdateService(eventBoardDto);
		mav.addObject("article_no", eventBoardDto.getArticle_no());
		mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/eventBoardContentRead.do");
		return mav;
	}

	@RequestMapping(value = "/eventBoardDeleteProcess.do")
	public String eventBoardDeleteProcess(int article_no) {
		System.out.println("게시판 삭제 프로세스 접근.");
		service.eventBoardDeleteService(article_no);
		return "redirect:/eventBoardMain.do";
	}

	@RequestMapping(value = "/eventBoardSearch.do")
	public ModelAndView eventBoardSearch(String option, String keyword, BoardPageDTO eventBoardPageDto) throws IOException {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("option", option);
		map.put("keyword", keyword);
		int totalRecord = service.eventBoardSearchCountMapProcess(map);
		if (totalRecord >= 1) {
			if (eventBoardPageDto.getCurrentPage() == 0)
				currentPage = 1;
			else {
				currentPage = eventBoardPageDto.getCurrentPage();
				if (currentPage < 0) {
					currentPage = -(currentPage);
					System.out.println("currentPage : " + currentPage);
				}

			}
			System.out.println("currentPage : " + currentPage);
			pdto = new BoardPageDTO(currentPage, totalRecord);
			System.out.println("총 페이지 수 : " + pdto.getTotalPage());
			System.out.println("총 레코드 수 : " + pdto.getTotalCount());
			System.out.println("시작 레코드 번호 : " + pdto.getStartRow());
			System.out.println("끝 레코드 번호 : " + pdto.getEndRow());
			System.out.println("시작 페이지 번호 : " + pdto.getStartPage());
			System.out.println("끝 페이지 번호 : " + pdto.getEndPage());
			map.put("startRow", pdto.getStartRow());
			map.put("blockCount", pdto.getBlockCount());
			mav.addObject("eventBoardPageDto", pdto);
			mav.addObject("map", map);
			mav.addObject("aList", service.eventBoardSearchLMapProcess(map));
		}
		mav.setViewName("/board/eventboard/eventBoardSearch");
		return mav;
	}
	
	
	@RequestMapping(value = "/eventReplyInsertProcess.do", method = RequestMethod.POST)
	public @ResponseBody List<ReplyDTO> eventReplyInsertProcess(ReplyDTO rdto){
		System.out.println("댓글 등록 프로세스 접근");
		String uuid = UUID.randomUUID().toString().replace("-","");
		return service.eventBoardReplyInsertProcess(rdto, uuid);
	}
	
	@RequestMapping(value = "/eventReplyDeleteProcess.do", method = RequestMethod.POST)
	public @ResponseBody List<ReplyDTO> eventReplyDeleteProcess(ReplyDTO rdto){
		System.out.println("댓글 삭제 프로세스 접근");
		return service.eventBoardReplyDeleteProcess(rdto);
	}
	
	@RequestMapping(value = "/eventReplyUpdateProcess.do", method = RequestMethod.POST)
	public @ResponseBody List<ReplyDTO> eventReplyUpdateProcess(ReplyDTO rdto){
		System.out.println("댓글 수정 프로세스 접근");
		return service.eventBoardReplyUpdateProcess(rdto);
	}
	
	@RequestMapping(value = "/eventReplyUpdateContentView.do", method = RequestMethod.POST, produces = "application/text;charset=utf8")
	public @ResponseBody String eventReplyContentView(int reply_no){
		System.out.println("댓글 수정 프로세스 접근");
		System.out.println("내용 : "+service.eventBoardReplyContentView(reply_no));
		return service.eventBoardReplyContentView(reply_no);
	}
	
	@ResponseBody
	@RequestMapping(value = "/eventBoardCheckDelete.do")
	public int eventBoardCheckDelete(String article_no) {
		System.out.println("게시판 선택 삭제 프로세스 접근.");
		System.out.println("article_no : "+ article_no);
		int successFlag = 0;
		String[] checkDeleteNo = article_no.split(",");
		for(int i =0; i<checkDeleteNo.length; i++) {
			service.eventBoardDeleteService(Integer.parseInt(checkDeleteNo[i]));
		}
		return successFlag;
	}
	
}
