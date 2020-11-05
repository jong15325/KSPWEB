package service;

import java.util.HashMap;
import java.util.List;

import dao.UpdateBoardDAO;
import dto.BoardDTO;
import dto.BoardPageDTO;
import dto.ReplyDTO;

public class UpdateBoardServiceImp implements UpdateBoardService {

	private UpdateBoardDAO dao;

	public void setDao(UpdateBoardDAO dao) {
		this.dao = dao;
	}

	public UpdateBoardServiceImp() {

	}

	@Override
	public void updateBoardInsertService(BoardDTO updateBoardDto, String uuid) {
		updateBoardDto.setArticle_uuid(uuid);
		dao.updateBoardInsert(updateBoardDto);

	}

	@Override
	public BoardDTO updateBoardContentRead(Integer article_no) {
		// TODO Auto-generated method stub
		return dao.updateBoardContentRead(article_no);
	}

	@Override
	public void updateBoardUpdateService(BoardDTO updateBoardDto) {
		// TODO Auto-generated method stub
		dao.updateBoardUpdate(updateBoardDto);
	}

	@Override
	public void updateBoardDeleteService(Integer article_no) {
		// TODO Auto-generated method stub
		dao.updateBoardDelete(article_no);
	}

	@Override
	public List<BoardDTO> updateBoardList(BoardPageDTO updateBoardPageDto) {
		// TODO Auto-generated method stub
		
		List<BoardDTO> aList = dao.updateBoardList(updateBoardPageDto);
		for (BoardDTO dto : aList) {
			dto.setReply_count(dao.updateBoardReplyCount(dto.getArticle_no()));
		}
		return aList;
	}

	@Override
	public BoardDTO updateBoardSelectNumService(Integer article_no) {
		// TODO Auto-generated method stub
		return dao.updateBoardSelectNum(article_no);
	}

	@Override
	public int updateBoardTotalCountService() {
		// TODO Auto-generated method stub
		return dao.updateBoardTotalCount();
	}

	@Override
	public List<BoardDTO> updateBoardSearchLMapProcess(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<BoardDTO> aList = dao.updateBoardSearchMap(map);
		for (BoardDTO dto : aList) {
			dto.setReply_count(dao.updateBoardReplyCount(dto.getArticle_no()));
		}
		return aList;
	}

	@Override
	public int updateBoardSearchCountMapProcess(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.updateBoardSearchCountMap(map);
	}

	@Override
	public void updateBoardViewCountUpdateService(Integer article_no) {
		// TODO Auto-generated method stub
		dao.updateBoardViewCountUpdate(article_no);
	}

	@Override
	public void updateBoardViewCountInsertService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.updateBoardViewCountInsert(map);
	}

	@Override
	public int updateBoardViewCountCheckService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.updateBoardViewCountCheck(map);
	}

	@Override
	public int updateBoardUUIDService(String article_uuid) {
		// TODO Auto-generated method stub
		return dao.updateBoardUUID(article_uuid);
	}

	@Override
	public List<ReplyDTO> updateBoardReplyListProcess(int article_no) {
		// TODO Auto-generated method stub
		return dao.updateBoardReplyList(article_no);
	}

	@Override
	public List<ReplyDTO> updateBoardReplyInsertProcess(ReplyDTO rdto, String uuid) {
		// TODO Auto-generated method stub
		rdto.setReply_uuid(uuid);
		dao.updateBoardReplyInsert(rdto);
		return dao.updateBoardReplyList(rdto.getArticle_no());
	}

	@Override
	public int updateBoardReplyCountProcess(int article_no) {
		// TODO Auto-generated method stub
		return dao.updateBoardReplyCount(article_no);
	}

	@Override
	public List<ReplyDTO> updateBoardReplyDeleteProcess(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		dao.updateBoardReplyDelete(rdto);
		return dao.updateBoardReplyList(rdto.getArticle_no());
	}

	@Override
	public List<ReplyDTO> updateBoardReplyUpdateProcess(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		dao.updateBoardReplyUpdate(rdto);
		return dao.updateBoardReplyList(rdto.getArticle_no());
	}

	@Override
	public String updateBoardReplyContentView(int reply_no) {
		// TODO Auto-generated method stub
		return dao.updateBoardReplyContentView(reply_no);
	}

}
