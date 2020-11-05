package service;

import java.util.HashMap;
import java.util.List;

import dto.BoardDTO;
import dto.BoardPageDTO;
import dto.ReplyDTO;

public interface EventBoardService {

	public void eventBoardInsertService(BoardDTO eventBoardDto, String uuid);

	public BoardDTO eventBoardContentRead(Integer article_no);

	public void eventBoardUpdateService(BoardDTO eventBoardDto);

	public void eventBoardDeleteService(Integer article_no);

	public BoardDTO eventBoardSelectNumService(Integer article_no);

	public List<BoardDTO> eventBoardList(BoardPageDTO eventBoardPageDto);

	public int eventBoardTotalCountService();

	public void eventBoardViewCountUpdateService(Integer article_no);

	public void eventBoardViewCountInsertService(HashMap<String, Object> map);

	public List<BoardDTO> eventBoardSearchLMapProcess(HashMap<String, Object> map);

	public int eventBoardSearchCountMapProcess(HashMap<String, Object> map);

	public int eventBoardViewCountCheckService(HashMap<String, Object> map);

	public int eventBoardUUIDService(String article_uuid);

	public int eventBoardReplyCountProcess(int article_no);

	public List<ReplyDTO> eventBoardReplyListProcess(int article_no);

	public List<ReplyDTO> eventBoardReplyInsertProcess(ReplyDTO rdto, String uuid);
	
	public List<ReplyDTO> eventBoardReplyDeleteProcess(ReplyDTO rdto);
	
	public List<ReplyDTO> eventBoardReplyUpdateProcess(ReplyDTO rdto);
	
	public String eventBoardReplyContentView(int reply_no);
}
