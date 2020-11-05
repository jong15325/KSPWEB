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
import service.UpdateBoardService;

@Controller
public class UpdateBoardController {

	private UpdateBoardService service;
	private int currentPage;
	private BoardPageDTO pdto;

	public void setService(UpdateBoardService service) {
		this.service = service;
	}

	public UpdateBoardController() {

	}

	@RequestMapping(value = "/updateBoardInsert.do", method = RequestMethod.GET)
	public ModelAndView updateBoardInsert() {
		System.out.println("게시판 등록 페이지 접근.");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/updateboard/updateBoardInsert");
		return mav;
	}

	@RequestMapping(value = "/updateBoardInsertProcess.do", method = RequestMethod.POST)
	public String updateBoardInsertProcess(BoardDTO updateBoardDto, HttpServletRequest request) {
		System.out.println("게시판 등록 프로세스 접근.");
		/*
		 * TEST for (int i = 1; i <= 500; i++) { updateboardDto.setArticle_title("타이틀 " +
		 * i + "번째"); updateboardDto.setArticle_writer("작성자 " + i + "번째");
		 * updateboardDto.setArticle_content("내용 " + i + "번째");
		 * service.updateBoardInsertService(updateboardDto); }
		 */
		String uuid = UUID.randomUUID().toString().replace("-","");
		System.out.println("글 UUID 생성 : "+ uuid);
		service.updateBoardInsertService(updateBoardDto, uuid);
		int boardNumUUID = service.updateBoardUUIDService(uuid);
		System.out.println("등록된 글 넘버 : "+boardNumUUID);
		/*
		 * mav.setViewName("redirect:/updateBoardContentRead.do?currentPage=1&article_no="
		 * +boardNumUUID); "redirect:/combineAll.do";
		 */
		return "redirect:/updateBoardContentRead.do?currentPage=1&article_no="+boardNumUUID;
	}

	@RequestMapping(value = "/updateBoardMain.do")
	public ModelAndView updateBoardList(BoardDTO updateBoardDto, BoardPageDTO updateBoardPageDto) {
		System.out.println("게시판 리스트 접근.");
		ModelAndView mav = new ModelAndView();
		int totalRecord = service.updateBoardTotalCountService();
		if (totalRecord >= 1) {
			if (updateBoardPageDto.getCurrentPage() == 0)
				currentPage = 1;
			else {
				currentPage = updateBoardPageDto.getCurrentPage();
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
			mav.addObject("updateBoardPageDto", pdto);
			mav.addObject("aList", service.updateBoardList(pdto));
		}

		mav.setViewName("/board/updateboard/updateBoardMain");
		return mav;
	}

	@RequestMapping(value = "/updateBoardContentRead.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateBoardContentRead(int article_no, HttpServletRequest request, HttpSession session) {
		System.out.println("게시판 글뷰 접근.");
		ModelAndView mav = new ModelAndView();
		UserDTO userDto = (UserDTO) session.getAttribute("userInfoSession");
		mav.addObject("contentView", service.updateBoardContentRead(article_no));
		mav.addObject("contentViewReply", service.updateBoardReplyListProcess(article_no));
		mav.addObject("currentPage", currentPage);
		mav.addObject("replyCount", service.updateBoardReplyCountProcess(article_no));
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		//System.out.println("콘텐트 이름 : "+ userDto.getUsr_name());
		map.put("article_no", article_no);
		map.put("usr_name", userDto.getUsr_name());
		int viewCheck = service.updateBoardViewCountCheckService(map);
		if (viewCheck == 0) {
			String getUserIp = GetUserIPUtil.getRemoteAddr(request);
			map.put("view_usr_ip", getUserIp);
			service.updateBoardViewCountUpdateService(article_no);
			service.updateBoardViewCountInsertService(map);
		}
		mav.setViewName("/board/updateboard/updateBoardContentRead");
		return mav;
	}

	@RequestMapping(value = "/updateBoardUpdate.do", method = RequestMethod.GET)
	public ModelAndView updateBoardUpdate(int article_no) {
		System.out.println("게시판 업데이트 접근.");
		ModelAndView mav = new ModelAndView();
		mav.addObject("contentUpdate", service.updateBoardSelectNumService(article_no));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/board/updateboard/updateBoardUpdate");
		return mav;
	}

	@RequestMapping(value = "/updateBoardUpdateProcess.do", method = RequestMethod.POST)
	public ModelAndView updateBoardUpdateProcess(BoardDTO updateBoardDto) {
		ModelAndView mav = new ModelAndView();
		System.out.println("게시판 업데이트 프로세스 접근.");
		System.out.println("getArticle_title : " + updateBoardDto.getArticle_title());
		System.out.println("getArticle_writer : " + updateBoardDto.getArticle_writer());
		System.out.println("getArticle_content : " + updateBoardDto.getArticle_content());
		service.updateBoardUpdateService(updateBoardDto);
		mav.addObject("article_no", updateBoardDto.getArticle_no());
		mav.addObject("currentPage", currentPage);
		mav.setViewName("redirect:/updateBoardContentRead.do");
		return mav;
	}

	@RequestMapping(value = "/updateBoardDeleteProcess.do")
	public String updateBoardDeleteProcess(int article_no) {
		System.out.println("게시판 삭제 프로세스 접근.");
		service.updateBoardDeleteService(article_no);
		return "redirect:/updateBoardMain.do";
	}

	@RequestMapping(value = "/updateBoardSearch.do")
	public ModelAndView updateBoardSearch(String option, String keyword, BoardPageDTO updateBoardPageDto) throws IOException {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("option", option);
		map.put("keyword", keyword);
		int totalRecord = service.updateBoardSearchCountMapProcess(map);
		if (totalRecord >= 1) {
			if (updateBoardPageDto.getCurrentPage() == 0)
				currentPage = 1;
			else {
				currentPage = updateBoardPageDto.getCurrentPage();
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
			mav.addObject("updateBoardPageDto", pdto);
			mav.addObject("map", map);
			mav.addObject("aList", service.updateBoardSearchLMapProcess(map));
		}
		mav.setViewName("/board/updateboard/updateBoardSearch");
		return mav;
	}
	
	
	@RequestMapping(value = "/updateReplyInsertProcess.do", method = RequestMethod.POST)
	public @ResponseBody List<ReplyDTO> updateReplyInsertProcess(ReplyDTO rdto){
		System.out.println("댓글 등록 프로세스 접근");
		String uuid = UUID.randomUUID().toString().replace("-","");
		return service.updateBoardReplyInsertProcess(rdto, uuid);
	}
	
	@RequestMapping(value = "/updateReplyDeleteProcess.do", method = RequestMethod.POST)
	public @ResponseBody List<ReplyDTO> updateReplyDeleteProcess(ReplyDTO rdto){
		System.out.println("댓글 삭제 프로세스 접근");
		return service.updateBoardReplyDeleteProcess(rdto);
	}
	
	@RequestMapping(value = "/updateReplyUpdateProcess.do", method = RequestMethod.POST)
	public @ResponseBody List<ReplyDTO> updateReplyUpdateProcess(ReplyDTO rdto){
		System.out.println("댓글 수정 프로세스 접근");
		return service.updateBoardReplyUpdateProcess(rdto);
	}
	
	@RequestMapping(value = "/updateReplyUpdateContentView.do", method = RequestMethod.POST, produces = "application/text;charset=utf8")
	public @ResponseBody String updateReplyContentView(int reply_no){
		System.out.println("댓글 수정 프로세스 접근");
		System.out.println("내용 : "+service.updateBoardReplyContentView(reply_no));
		return service.updateBoardReplyContentView(reply_no);
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateBoardCheckDelete.do")
	public int updateBoardCheckDelete(String article_no) {
		System.out.println("게시판 선택 삭제 프로세스 접근.");
		System.out.println("article_no : "+ article_no);
		int successFlag = 0;
		String[] checkDeleteNo = article_no.split(",");
		for(int i =0; i<checkDeleteNo.length; i++) {
			service.updateBoardDeleteService(Integer.parseInt(checkDeleteNo[i]));
		}
		return successFlag;
	}
	
}
