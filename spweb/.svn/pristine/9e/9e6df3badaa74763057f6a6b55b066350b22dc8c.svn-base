package service;

import java.util.HashMap;
import java.util.List;

import dto.BoardDTO;
import dto.BoardPageDTO;
import dto.ReplyDTO;

public interface NoticeBoardService {

	public void noticeBoardInsertService(BoardDTO noticeBoardDto, String uuid);

	public BoardDTO noticeBoardContentRead(Integer article_no);

	public void noticeBoardUpdateService(BoardDTO noticeBoardDto);

	public void noticeBoardDeleteService(Integer article_no);

	public BoardDTO noticeBoardSelectNumService(Integer article_no);

	public List<BoardDTO> noticeBoardList(BoardPageDTO noticeBoardPageDto);

	public int noticeBoardTotalCountService();

	public void noticeBoardViewCountUpdateService(Integer article_no);

	public void noticeBoardViewCountInsertService(HashMap<String, Object> map);

	public List<BoardDTO> noticeBoardSearchLMapProcess(HashMap<String, Object> map);

	public int noticeBoardSearchCountMapProcess(HashMap<String, Object> map);

	public int noticeBoardViewCountCheckService(HashMap<String, Object> map);

	public int noticeBoardUUIDService(String article_uuid);

	public int noticeBoardReplyCountProcess(int article_no);

	public List<ReplyDTO> noticeBoardReplyListProcess(int article_no);

	public List<ReplyDTO> noticeBoardReplyInsertProcess(ReplyDTO rdto, String uuid);
	
	public List<ReplyDTO> noticeBoardReplyDeleteProcess(ReplyDTO rdto);
	
	public List<ReplyDTO> noticeBoardReplyUpdateProcess(ReplyDTO rdto);
	
	public String noticeBoardReplyContentView(int reply_no);
}
