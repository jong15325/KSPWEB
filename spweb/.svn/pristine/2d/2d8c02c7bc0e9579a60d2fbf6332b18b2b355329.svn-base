package dao;

import java.util.HashMap;
import java.util.List;

import dto.BoardDTO;
import dto.BoardPageDTO;
import dto.ReplyDTO;

public interface FreeBoardDAO {

	public void freeBoardInsert(BoardDTO freeBoardDto);

	public BoardDTO freeBoardContentRead(Integer article_no);

	public void freeBoardUpdate(BoardDTO freeBoardDto);

	public void freeBoardDelete(Integer article_no);

	public List<BoardDTO> freeBoardList(BoardPageDTO freeBoardPageDto);

	public BoardDTO freeBoardSelectNum(Integer article_no);

	public int freeBoardTotalCount();

	public void freeBoardViewCountUpdate(Integer article_no);
	
	public int freeBoardViewCount(Integer article_no);
	
	public List<BoardDTO> freeBoardSearchMap(HashMap<String, Object> map);

	public int freeBoardSearchCountMap(HashMap<String, Object> map);
	
	public void freeBoardViewCountInsert(HashMap<String, Object> map);
	
	public int freeBoardViewCountCheck(HashMap<String, Object> map);
	
	public int freeBoardUUID(String article_uuid);
	
	public List<ReplyDTO> freeBoardReplyList(int article_no);
	
	public void freeBoardReplyInsert(ReplyDTO rdto);
	
	public void freeBoardReplyUpdate(ReplyDTO rdto);
	
	public void freeBoardReplyDelete(ReplyDTO rdto);
	
	public int freeBoardReplyCount(int article_no);
	
	public String freeBoardReplyContentView(int reply_no);
	
}
