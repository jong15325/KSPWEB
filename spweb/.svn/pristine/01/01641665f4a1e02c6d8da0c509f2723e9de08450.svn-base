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
import service.FreeBoardService;

@Controller
public class FreeBoardController {

	private FreeBoardService service;
	private int currentPage;
	private BoardPageDTO pdto;

	public void setService(FreeBoardService service) {
		this.service = service;
	}

	public FreeBoardController() {

	}

	@RequestMapping(value = "/freeBoardInsert.do", method = RequestMethod.GET)
	public ModelAndView freeBoardInsert() {
		System.out.println("게시판 등록 페이지 접근.");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/freeboard/freeBoardInsert");
		return mav;
	}

	@RequestMapping(value = "/freeBoardInsertProcess.do", method = RequestMethod.POST)
	public String freeBoardInsertProcess(BoardDTO freeboardDto, HttpServletRequest request) {
		System.out.println("게시판 등록 프로세스 접근.");
		/*
		 * TEST for (int i = 1; i <= 500; i++) { freeboardDto.setArticle_title("타이틀 " +
		 * i + "번째"); freeboardDto.setArticle_writer("작성자 " + i + "번째");
		 * freeboardDto.setArticle_content("내용 " + i + "번째");
		 * service.freeBoardInsertService(freeboardDto); }
		 */
		String uuid = UUID.randomUUID().toString().replace("-","");
		System.out.println("글 UUID 생성 : "+ uuid);
		service.freeBoardInsertService(freeboardDto, uuid);
		int boardNumUUID = service.freeBoardUUIDService(uuid);
		System.out.println("등록된 글 넘버 : "+boardNumUUID);
		/*
		 * mav.setViewName("redirect:/freeBoardContentRead.do?currentPage=1&article_no="
		 * +boardNumUUID); "redirect:/combineAll.do";
		 */
		return "redirect:/freeBoardContentRead.do?currentPage=1&article_no="+boardNumUUID;
	}

	@RequestMapping(value = "/freeBoardMain.do")
	public ModelAndView freeBoardList(BoardDTO freeboardDto, BoardPageDTO freeBoardPageDto) {
		System.out.println("게시판 리스트 접근.");
		ModelAndView mav = new ModelAndView();
		int totalRecord = service.freeBoardTotalCountService();
		if (totalRecord >= 1) {
			if (freeBoardPageDto.getCurrentPage() == 0)
				currentPage = 1;
			else {
				currentPage = freeBoardPageDto.getCurrentPage();
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
			mav.addObject("freeBoardPageDto", pdto);
			mav.addObject("aList", service.freeBoardList(pdto));
		}

		mav.setViewName("/board/freeboard/freeBoardMain");
		return mav;
	}

	@RequestMapping(value = "/freeBoardContentRead.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView freeBoardContentRead(int article_no, HttpServletRequest request, HttpSession session) {
		System.out.println("게시판 글뷰 접근.");
		ModelAndView mav = new ModelAndView();
		UserDTO userDto = (UserDTO) session.getAttribute("userInfoSession");
		mav.addObject("contentView", service.freeBoardContentRead(article_no));
		mav.addObject("contentViewReply", service.freeBoardReplyListProcess(article_no));
		mav.addObject("currentPage", currentPage);
		mav.addObject("replyCount", service.freeBoardReplyCountProcess(article_no));
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//System.out.println("콘텐트 이름 : "+ userDto.getUsr_name());
		map.put("article_no", article_no);
		map.put("usr_name", userDto.getUsr_name());
		int viewCheck = service.freeBoardViewCountCheckService(map);
		if (viewCheck == 0) {
			String getUserIp = GetUserIPUtil.getRemoteAddr(request);
			map.put("view_usr_ip", getUserIp);
			service.freeBoardViewCountUpdateService(article_no);
			service.freeBoardViewCountInsertService(map);
		}
		mav.setViewName("/board/freeboard/freeBoardContentRead");
		return mav;
	}

	@RequestMapping(value = "/freeBoardUpdate.do", method = RequestMethod.GET)
	public ModelAndView freeBoardUpdate(int article_no) {
		System.out.println("게시판 업데이트 접근.");
		ModelAndView mav = new ModelAndView();
		mav.addObject("contentUpdate", service.freeBoardSelectNumService(article_no));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/board/freeboard/freeBoardUpdate");
		return mav;
	}

	@RequestMapping(value = "/freeBoardUpdateProcess.do", method = RequestMethod.POST)
	public ModelAndView freeBoardUpdateProcess(BoardDTO freeboardDto) {
		ModelAndView mav = new ModelAndView();
		System.out.println("게시판 업데이트 프로세스 접근.");
		System.out.println("getArticle_title : " + freeboardDto.getArticle_title());
		System.out.println("getArticle_writer : " + freeboardDto.getArticle_writer());
		System.out.println("getArticle_content : " + freeboardDto.getArticle_content());
		service.freeBoardUpdateService(freeboardDto);
		mav.addObject("article_no", freeboardDto.getArticle_no());
		mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/freeBoardContentRead.do");
		return mav;
	}

	@RequestMapping(value = "/freeBoardDeleteProcess.do")
	public String freeBoardDeleteProcess(int article_no) {
		System.out.println("게시판 삭제 프로세스 접근.");
		service.freeBoardDeleteService(article_no);
		return "redirect:/freeBoardMain.do";
	}

	@RequestMapping(value = "/freeBoardSearch.do")
	public ModelAndView freeBoardSearch(String option, String keyword, BoardPageDTO freeBoardPageDto) throws IOException {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("option", option);
		map.put("keyword", keyword);
		int totalRecord = service.freeBoardSearchCountMapProcess(map);
		if (totalRecord >= 1) {
			if (freeBoardPageDto.getCurrentPage() == 0)
				currentPage = 1;
			else {
				currentPage = freeBoardPageDto.getCurrentPage();
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
			mav.addObject("freeBoardPageDto", pdto);
			mav.addObject("map", map);
			mav.addObject("aList", service.freeBoardSearchLMapProcess(map));
		}
		mav.setViewName("/board/freeboard/freeBoardSearch");
		return mav;
	}
	
	
	@RequestMapping(value = "/freeReplyInsertProcess.do", method = RequestMethod.POST)
	public @ResponseBody List<ReplyDTO> freeReplyInsertProcess(ReplyDTO rdto){
		System.out.println("댓글 등록 프로세스 접근");
		String uuid = UUID.randomUUID().toString().replace("-","");
		return service.freeBoardReplyInsertProcess(rdto, uuid);
	}
	
	@RequestMapping(value = "/freeReplyDeleteProcess.do", method = RequestMethod.POST)
	public @ResponseBody List<ReplyDTO> freeReplyDeleteProcess(ReplyDTO rdto){
		System.out.println("댓글 삭제 프로세스 접근");
		return service.freeBoardReplyDeleteProcess(rdto);
	}
	
	@RequestMapping(value = "/freeReplyUpdateProcess.do", method = RequestMethod.POST)
	public @ResponseBody List<ReplyDTO> freeReplyUpdateProcess(ReplyDTO rdto){
		System.out.println("댓글 수정 프로세스 접근");
		return service.freeBoardReplyUpdateProcess(rdto);
	}
	
	@RequestMapping(value = "/freeReplyUpdateContentView.do", method = RequestMethod.POST, produces = "application/text;charset=utf8")
	public @ResponseBody String freeReplyContentView(int reply_no){
		System.out.println("댓글 수정 프로세스 접근");
		System.out.println("내용 : "+service.freeBoardReplyContentView(reply_no));
		return service.freeBoardReplyContentView(reply_no);
	}
	
	@ResponseBody
	@RequestMapping(value = "/freeBoardCheckDelete.do")
	public int freeBoardCheckDelete(String article_no) {
		System.out.println("게시판 선택 삭제 프로세스 접근.");
		System.out.println("article_no : "+ article_no);
		int successFlag = 0;
		String[] checkDeleteNo = article_no.split(",");
		for(int i =0; i<checkDeleteNo.length; i++) {
			service.freeBoardDeleteService(Integer.parseInt(checkDeleteNo[i]));
		}
		return successFlag;
	}
	
}
