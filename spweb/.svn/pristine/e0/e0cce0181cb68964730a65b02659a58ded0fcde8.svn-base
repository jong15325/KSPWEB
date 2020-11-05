package service;

import java.util.HashMap;
import java.util.List;

import dao.FreeBoardDAO;
import dto.BoardDTO;
import dto.BoardPageDTO;
import dto.ReplyDTO;

public class FreeBoardServiceImp implements FreeBoardService {

	private FreeBoardDAO dao;

	public void setDao(FreeBoardDAO dao) {
		this.dao = dao;
	}

	public FreeBoardServiceImp() {

	}

	@Override
	public void freeBoardInsertService(BoardDTO freeBoardDto, String uuid) {
		freeBoardDto.setArticle_uuid(uuid);
		dao.freeBoardInsert(freeBoardDto);

	}

	@Override
	public BoardDTO freeBoardContentRead(Integer article_no) {
		// TODO Auto-generated method stub
		return dao.freeBoardContentRead(article_no);
	}

	@Override
	public void freeBoardUpdateService(BoardDTO freeBoardDto) {
		// TODO Auto-generated method stub
		dao.freeBoardUpdate(freeBoardDto);
	}

	@Override
	public void freeBoardDeleteService(Integer article_no) {
		// TODO Auto-generated method stub
		dao.freeBoardDelete(article_no);
	}

	@Override
	public List<BoardDTO> freeBoardList(BoardPageDTO freeBoardPageDto) {
		// TODO Auto-generated method stub
		
		List<BoardDTO> aList = dao.freeBoardList(freeBoardPageDto);
		for (BoardDTO dto : aList) {
			dto.setReply_count(dao.freeBoardReplyCount(dto.getArticle_no()));
		}
		return aList;
	}

	@Override
	public BoardDTO freeBoardSelectNumService(Integer article_no) {
		// TODO Auto-generated method stub
		return dao.freeBoardSelectNum(article_no);
	}

	@Override
	public int freeBoardTotalCountService() {
		// TODO Auto-generated method stub
		return dao.freeBoardTotalCount();
	}

	@Override
	public List<BoardDTO> freeBoardSearchLMapProcess(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		//return dao.freeBoardSearchMap(map);
		List<BoardDTO> aList = dao.freeBoardSearchMap(map);
		for (BoardDTO dto : aList) {
			dto.setReply_count(dao.freeBoardReplyCount(dto.getArticle_no()));
		}
		return aList;
	}

	@Override
	public int freeBoardSearchCountMapProcess(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.freeBoardSearchCountMap(map);
	}

	@Override
	public void freeBoardViewCountUpdateService(Integer article_no) {
		// TODO Auto-generated method stub
		dao.freeBoardViewCountUpdate(article_no);
	}

	@Override
	public void freeBoardViewCountInsertService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.freeBoardViewCountInsert(map);
	}

	@Override
	public int freeBoardViewCountCheckService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.freeBoardViewCountCheck(map);
	}

	@Override
	public int freeBoardUUIDService(String article_uuid) {
		// TODO Auto-generated method stub
		return dao.freeBoardUUID(article_uuid);
	}

	@Override
	public List<ReplyDTO> freeBoardReplyListProcess(int article_no) {
		// TODO Auto-generated method stub
		return dao.freeBoardReplyList(article_no);
	}

	@Override
	public List<ReplyDTO> freeBoardReplyInsertProcess(ReplyDTO rdto, String uuid) {
		// TODO Auto-generated method stub
		rdto.setReply_uuid(uuid);
		dao.freeBoardReplyInsert(rdto);
		return dao.freeBoardReplyList(rdto.getArticle_no());
	}

	@Override
	public int freeBoardReplyCountProcess(int article_no) {
		// TODO Auto-generated method stub
		return dao.freeBoardReplyCount(article_no);
	}

	@Override
	public List<ReplyDTO> freeBoardReplyDeleteProcess(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		dao.freeBoardReplyDelete(rdto);
		return dao.freeBoardReplyList(rdto.getArticle_no());
	}

	@Override
	public List<ReplyDTO> freeBoardReplyUpdateProcess(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		dao.freeBoardReplyUpdate(rdto);
		return dao.freeBoardReplyList(rdto.getArticle_no());
	}

	@Override
	public String freeBoardReplyContentView(int reply_no) {
		// TODO Auto-generated method stub
		return dao.freeBoardReplyContentView(reply_no);
	}

}
