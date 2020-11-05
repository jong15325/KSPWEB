package dao;

import java.util.HashMap;
import java.util.List;

import dto.BoardDTO;
import dto.BoardPageDTO;
import dto.ReplyDTO;

public interface EventBoardDAO {

	public void eventBoardInsert(BoardDTO eventBoardDto);

	public BoardDTO eventBoardContentRead(Integer article_no);

	public void eventBoardUpdate(BoardDTO eventBoardDto);

	public void eventBoardDelete(Integer article_no);

	public List<BoardDTO> eventBoardList(BoardPageDTO eventBoardPageDto);

	public BoardDTO eventBoardSelectNum(Integer article_no);

	public int eventBoardTotalCount();

	public void eventBoardViewCountUpdate(Integer article_no);
	
	public int eventBoardViewCount(Integer article_no);
	
	public List<BoardDTO> eventBoardSearchMap(HashMap<String, Object> map);

	public int eventBoardSearchCountMap(HashMap<String, Object> map);
	
	public void eventBoardViewCountInsert(HashMap<String, Object> map);
	
	public int eventBoardViewCountCheck(HashMap<String, Object> map);
	
	public int eventBoardUUID(String article_uuid);
	
	public List<ReplyDTO> eventBoardReplyList(int article_no);
	
	public void eventBoardReplyInsert(ReplyDTO rdto);
	
	public void eventBoardReplyUpdate(ReplyDTO rdto);
	
	public void eventBoardReplyDelete(ReplyDTO rdto);
	
	public int eventBoardReplyCount(int article_no);
	
	public String eventBoardReplyContentView(int reply_no);
	
}
