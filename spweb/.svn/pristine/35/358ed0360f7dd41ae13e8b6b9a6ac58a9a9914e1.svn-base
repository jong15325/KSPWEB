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
import service.NoticeBoardService;

@Controller
public class NoticeBoardController {

	private NoticeBoardService service;
	private int currentPage;
	private BoardPageDTO pdto;

	public void setService(NoticeBoardService service) {
		this.service = service;
	}

	public NoticeBoardController() {

	}

	@RequestMapping(value = "/noticeBoardInsert.do", method = RequestMethod.GET)
	public ModelAndView noticeBoardInsert() {
		System.out.println("게시판 등록 페이지 접근.");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/noticeboard/noticeBoardInsert");
		return mav;
	}

	@RequestMapping(value = "/noticeBoardInsertProcess.do", method = RequestMethod.POST)
	public String noticeBoardInsertProcess(BoardDTO noticeBoardDto, HttpServletRequest request) {
		System.out.println("게시판 등록 프로세스 접근.");
		/*
		 * TEST for (int i = 1; i <= 500; i++) { noticeboardDto.setArticle_title("타이틀 " +
		 * i + "번째"); noticeboardDto.setArticle_writer("작성자 " + i + "번째");
		 * noticeboardDto.setArticle_content("내용 " + i + "번째");
		 * service.noticeBoardInsertService(noticeboardDto); }
		 */
		String uuid = UUID.randomUUID().toString().replace("-","");
		System.out.println("글 UUID 생성 : "+ uuid);
		service.noticeBoardInsertService(noticeBoardDto, uuid);
		int boardNumUUID = service.noticeBoardUUIDService(uuid);
		System.out.println("등록된 글 넘버 : "+boardNumUUID);
		/*
		 * mav.setViewName("redirect:/noticeBoardContentRead.do?currentPage=1&article_no="
		 * +boardNumUUID); "redirect:/combineAll.do";
		 */
		return "redirect:/noticeBoardContentRead.do?currentPage=1&article_no="+boardNumUUID;
	}

	@RequestMapping(value = "/noticeBoardMain.do")
	public ModelAndView noticeBoardList(BoardDTO noticeBoardDto, BoardPageDTO noticeBoardPageDto) {
		System.out.println("게시판 리스트 접근.");
		ModelAndView mav = new ModelAndView();
		int totalRecord = service.noticeBoardTotalCountService();
		if (totalRecord >= 1) {
			if (noticeBoardPageDto.getCurrentPage() == 0)
				currentPage = 1;
			else {
				currentPage = noticeBoardPageDto.getCurrentPage();
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
			mav.addObject("noticeBoardPageDto", pdto);
			mav.addObject("aList", service.noticeBoardList(pdto));
		}

		mav.setViewName("/board/noticeboard/noticeBoardMain");
		return mav;
	}

	@RequestMapping(value = "/noticeBoardContentRead.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView noticeBoardContentRead(int article_no, HttpServletRequest request, HttpSession session) {
		System.out.println("게시판 글뷰 접근.");
		ModelAndView mav = new ModelAndView();
		UserDTO userDto = (UserDTO) session.getAttribute("userInfoSession");
		mav.addObject("contentView", service.noticeBoardContentRead(article_no));
		mav.addObject("contentViewReply", service.noticeBoardReplyListProcess(article_no));
		mav.addObject("currentPage", currentPage);
		mav.addObject("replyCount", service.noticeBoardReplyCountProcess(article_no));
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//System.out.println("콘텐트 이름 : "+ userDto.getUsr_name());
		map.put("article_no", article_no);
		map.put("usr_name", userDto.getUsr_name());
		int viewCheck = service.noticeBoardViewCountCheckService(map);
		if (viewCheck == 0) {
			String getUserIp = GetUserIPUtil.getRemoteAddr(request);
			map.put("view_usr_ip", getUserIp);
			service.noticeBoardViewCountUpdateService(article_no);
			service.noticeBoardViewCountInsertService(map);
		}
		mav.setViewName("/board/noticeboard/noticeBoardContentRead");
		return mav;
	}

	@RequestMapping(value = "/noticeBoardUpdate.do", method = RequestMethod.GET)
	public ModelAndView noticeBoardUpdate(int article_no) {
		System.out.println("게시판 업데이트 접근.");
		ModelAndView mav = new ModelAndView();
		mav.addObject("contentUpdate", service.noticeBoardSelectNumService(article_no));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/board/noticeboard/noticeBoardUpdate");
		return mav;
	}

	@RequestMapping(value = "/noticeBoardUpdateProcess.do", method = RequestMethod.POST)
	public ModelAndView noticeBoardUpdateProcess(BoardDTO noticeBoardDto) {
		ModelAndView mav = new ModelAndView();
		System.out.println("게시판 업데이트 프로세스 접근.");
		System.out.println("getArticle_title : " + noticeBoardDto.getArticle_title());
		System.out.println("getArticle_writer : " + noticeBoardDto.getArticle_writer());
		System.out.println("getArticle_content : " + noticeBoardDto.getArticle_content());
		service.noticeBoardUpdateService(noticeBoardDto);
		mav.addObject("article_no", noticeBoardDto.getArticle_no());
		mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/noticeBoardContentRead.do");
		return mav;
	}

	@RequestMapping(value = "/noticeBoardDeleteProcess.do")
	public String noticeBoardDeleteProcess(int article_no) {
		System.out.println("게시판 삭제 프로세스 접근.");
		service.noticeBoardDeleteService(article_no);
		return "redirect:/noticeBoardMain.do";
	}

	@RequestMapping(value = "/noticeBoardSearch.do")
	public ModelAndView noticeBoardSearch(String option, String keyword, BoardPageDTO noticeBoardPageDto) throws IOException {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("option", option);
		map.put("keyword", keyword);
		int totalRecord = service.noticeBoardSearchCountMapProcess(map);
		if (totalRecord >= 1) {
			if (noticeBoardPageDto.getCurrentPage() == 0)
				currentPage = 1;
			else {
				currentPage = noticeBoardPageDto.getCurrentPage();
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
			mav.addObject("noticeBoardPageDto", pdto);
			mav.addObject("map", map);
			mav.addObject("aList", service.noticeBoardSearchLMapProcess(map));
		}
		mav.setViewName("/board/noticeboard/noticeBoardSearch");
		return mav;
	}
	
	
	@RequestMapping(value = "/noticeReplyInsertProcess.do", method = RequestMethod.POST)
	public @ResponseBody List<ReplyDTO> noticeReplyInsertProcess(ReplyDTO rdto){
		System.out.println("댓글 등록 프로세스 접근");
		String uuid = UUID.randomUUID().toString().replace("-","");
		return service.noticeBoardReplyInsertProcess(rdto, uuid);
	}
	
	@RequestMapping(value = "/noticeReplyDeleteProcess.do", method = RequestMethod.POST)
	public @ResponseBody List<ReplyDTO> noticeReplyDeleteProcess(ReplyDTO rdto){
		System.out.println("댓글 삭제 프로세스 접근");
		return service.noticeBoardReplyDeleteProcess(rdto);
	}
	
	@RequestMapping(value = "/noticeReplyUpdateProcess.do", method = RequestMethod.POST)
	public @ResponseBody List<ReplyDTO> noticeReplyUpdateProcess(ReplyDTO rdto){
		System.out.println("댓글 수정 프로세스 접근");
		return service.noticeBoardReplyUpdateProcess(rdto);
	}
	
	@RequestMapping(value = "/noticeReplyUpdateContentView.do", method = RequestMethod.POST, produces = "application/text;charset=utf8")
	public @ResponseBody String noticeReplyContentView(int reply_no){
		System.out.println("댓글 수정 프로세스 접근");
		System.out.println("내용 : "+service.noticeBoardReplyContentView(reply_no));
		return service.noticeBoardReplyContentView(reply_no);
	}
	
	@ResponseBody
	@RequestMapping(value = "/noticeBoardCheckDelete.do")
	public int noticeBoardCheckDelete(String article_no) {
		System.out.println("게시판 선택 삭제 프로세스 접근.");
		System.out.println("article_no : "+ article_no);
		int successFlag = 0;
		String[] checkDeleteNo = article_no.split(",");
		for(int i =0; i<checkDeleteNo.length; i++) {
			service.noticeBoardDeleteService(Integer.parseInt(checkDeleteNo[i]));
		}
		return successFlag;
	}
	
}
