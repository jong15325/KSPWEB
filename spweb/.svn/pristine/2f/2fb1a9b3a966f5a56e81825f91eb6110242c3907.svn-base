package dao;

import java.util.HashMap;
import java.util.List;

import dto.BoardDTO;
import dto.BoardPageDTO;
import dto.ReplyDTO;

public interface NoticeBoardDAO {

	public void noticeBoardInsert(BoardDTO noticeBoardDto);

	public BoardDTO noticeBoardContentRead(Integer article_no);

	public void noticeBoardUpdate(BoardDTO noticeBoardDto);

	public void noticeBoardDelete(Integer article_no);

	public List<BoardDTO> noticeBoardList(BoardPageDTO noticeBoardPageDto);

	public BoardDTO noticeBoardSelectNum(Integer article_no);

	public int noticeBoardTotalCount();

	public void noticeBoardViewCountUpdate(Integer article_no);
	
	public int noticeBoardViewCount(Integer article_no);
	
	public List<BoardDTO> noticeBoardSearchMap(HashMap<String, Object> map);

	public int noticeBoardSearchCountMap(HashMap<String, Object> map);
	
	public void noticeBoardViewCountInsert(HashMap<String, Object> map);
	
	public int noticeBoardViewCountCheck(HashMap<String, Object> map);
	
	public int noticeBoardUUID(String article_uuid);
	
	public List<ReplyDTO> noticeBoardReplyList(int article_no);
	
	public void noticeBoardReplyInsert(ReplyDTO rdto);
	
	public void noticeBoardReplyUpdate(ReplyDTO rdto);
	
	public void noticeBoardReplyDelete(ReplyDTO rdto);
	
	public int noticeBoardReplyCount(int article_no);
	
	public String noticeBoardReplyContentView(int reply_no);
	
}
