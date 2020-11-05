package service;

import java.util.HashMap;
import java.util.List;

import dto.BoardDTO;
import dto.BoardPageDTO;
import dto.ReplyDTO;

public interface FreeBoardService {

	public void freeBoardInsertService(BoardDTO freeBoardDto, String uuid);

	public BoardDTO freeBoardContentRead(Integer article_no);

	public void freeBoardUpdateService(BoardDTO freeBoardDto);

	public void freeBoardDeleteService(Integer article_no);

	public BoardDTO freeBoardSelectNumService(Integer article_no);

	public List<BoardDTO> freeBoardList(BoardPageDTO freeBoardPageDto);

	public int freeBoardTotalCountService();

	public void freeBoardViewCountUpdateService(Integer article_no);

	public void freeBoardViewCountInsertService(HashMap<String, Object> map);

	public List<BoardDTO> freeBoardSearchLMapProcess(HashMap<String, Object> map);

	public int freeBoardSearchCountMapProcess(HashMap<String, Object> map);

	public int freeBoardViewCountCheckService(HashMap<String, Object> map);

	public int freeBoardUUIDService(String article_uuid);

	public int freeBoardReplyCountProcess(int article_no);

	public List<ReplyDTO> freeBoardReplyListProcess(int article_no);

	public List<ReplyDTO> freeBoardReplyInsertProcess(ReplyDTO rdto, String uuid);
	
	public List<ReplyDTO> freeBoardReplyDeleteProcess(ReplyDTO rdto);
	
	public List<ReplyDTO> freeBoardReplyUpdateProcess(ReplyDTO rdto);
	
	public String freeBoardReplyContentView(int reply_no);
}
