package dao;

import java.util.HashMap;
import java.util.List;

import dto.BoardDTO;
import dto.BoardPageDTO;
import dto.ReplyDTO;

public interface UpdateBoardDAO {

	public void updateBoardInsert(BoardDTO updateBoardDto);

	public BoardDTO updateBoardContentRead(Integer article_no);

	public void updateBoardUpdate(BoardDTO updateBoardDto);

	public void updateBoardDelete(Integer article_no);

	public List<BoardDTO> updateBoardList(BoardPageDTO updateBoardPageDto);

	public BoardDTO updateBoardSelectNum(Integer article_no);

	public int updateBoardTotalCount();

	public void updateBoardViewCountUpdate(Integer article_no);
	
	public int updateBoardViewCount(Integer article_no);
	
	public List<BoardDTO> updateBoardSearchMap(HashMap<String, Object> map);

	public int updateBoardSearchCountMap(HashMap<String, Object> map);
	
	public void updateBoardViewCountInsert(HashMap<String, Object> map);
	
	public int updateBoardViewCountCheck(HashMap<String, Object> map);
	
	public int updateBoardUUID(String article_uuid);
	
	public List<ReplyDTO> updateBoardReplyList(int article_no);
	
	public void updateBoardReplyInsert(ReplyDTO rdto);
	
	public void updateBoardReplyUpdate(ReplyDTO rdto);
	
	public void updateBoardReplyDelete(ReplyDTO rdto);
	
	public int updateBoardReplyCount(int article_no);
	
	public String updateBoardReplyContentView(int reply_no);
	
}
