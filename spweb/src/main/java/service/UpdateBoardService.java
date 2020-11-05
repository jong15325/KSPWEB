package service;

import java.util.HashMap;
import java.util.List;

import dto.BoardDTO;
import dto.BoardPageDTO;
import dto.ReplyDTO;

public interface UpdateBoardService {

	public void updateBoardInsertService(BoardDTO updateBoardDto, String uuid);

	public BoardDTO updateBoardContentRead(Integer article_no);

	public void updateBoardUpdateService(BoardDTO updateBoardDto);

	public void updateBoardDeleteService(Integer article_no);

	public BoardDTO updateBoardSelectNumService(Integer article_no);

	public List<BoardDTO> updateBoardList(BoardPageDTO updateBoardPageDto);

	public int updateBoardTotalCountService();

	public void updateBoardViewCountUpdateService(Integer article_no);

	public void updateBoardViewCountInsertService(HashMap<String, Object> map);

	public List<BoardDTO> updateBoardSearchLMapProcess(HashMap<String, Object> map);

	public int updateBoardSearchCountMapProcess(HashMap<String, Object> map);

	public int updateBoardViewCountCheckService(HashMap<String, Object> map);

	public int updateBoardUUIDService(String article_uuid);

	public int updateBoardReplyCountProcess(int article_no);

	public List<ReplyDTO> updateBoardReplyListProcess(int article_no);

	public List<ReplyDTO> updateBoardReplyInsertProcess(ReplyDTO rdto, String uuid);
	
	public List<ReplyDTO> updateBoardReplyDeleteProcess(ReplyDTO rdto);
	
	public List<ReplyDTO> updateBoardReplyUpdateProcess(ReplyDTO rdto);
	
	public String updateBoardReplyContentView(int reply_no);
}
