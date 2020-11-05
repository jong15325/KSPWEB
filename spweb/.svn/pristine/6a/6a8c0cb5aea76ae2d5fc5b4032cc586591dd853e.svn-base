package service;

import java.util.HashMap;
import java.util.List;

import dao.NoticeBoardDAO;
import dto.BoardDTO;
import dto.BoardPageDTO;
import dto.ReplyDTO;

public class NoticeBoardServiceImp implements NoticeBoardService {

	private NoticeBoardDAO dao;

	public void setDao(NoticeBoardDAO dao) {
		this.dao = dao;
	}

	public NoticeBoardServiceImp() {

	}

	@Override
	public void noticeBoardInsertService(BoardDTO noticeBoardDto, String uuid) {
		noticeBoardDto.setArticle_uuid(uuid);
		dao.noticeBoardInsert(noticeBoardDto);

	}

	@Override
	public BoardDTO noticeBoardContentRead(Integer article_no) {
		// TODO Auto-generated method stub
		return dao.noticeBoardContentRead(article_no);
	}

	@Override
	public void noticeBoardUpdateService(BoardDTO noticeBoardDto) {
		// TODO Auto-generated method stub
		dao.noticeBoardUpdate(noticeBoardDto);
	}

	@Override
	public void noticeBoardDeleteService(Integer article_no) {
		// TODO Auto-generated method stub
		dao.noticeBoardDelete(article_no);
	}

	@Override
	public List<BoardDTO> noticeBoardList(BoardPageDTO noticeBoardPageDto) {
		// TODO Auto-generated method stub
		
		List<BoardDTO> aList = dao.noticeBoardList(noticeBoardPageDto);
		for (BoardDTO dto : aList) {
			dto.setReply_count(dao.noticeBoardReplyCount(dto.getArticle_no()));
		}
		return aList;
	}

	@Override
	public BoardDTO noticeBoardSelectNumService(Integer article_no) {
		// TODO Auto-generated method stub
		return dao.noticeBoardSelectNum(article_no);
	}

	@Override
	public int noticeBoardTotalCountService() {
		// TODO Auto-generated method stub
		return dao.noticeBoardTotalCount();
	}

	@Override
	public List<BoardDTO> noticeBoardSearchLMapProcess(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<BoardDTO> aList = dao.noticeBoardSearchMap(map);
		for (BoardDTO dto : aList) {
			dto.setReply_count(dao.noticeBoardReplyCount(dto.getArticle_no()));
		}
		return aList;
	}

	@Override
	public int noticeBoardSearchCountMapProcess(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.noticeBoardSearchCountMap(map);
	}

	@Override
	public void noticeBoardViewCountUpdateService(Integer article_no) {
		// TODO Auto-generated method stub
		dao.noticeBoardViewCountUpdate(article_no);
	}

	@Override
	public void noticeBoardViewCountInsertService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.noticeBoardViewCountInsert(map);
	}

	@Override
	public int noticeBoardViewCountCheckService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.noticeBoardViewCountCheck(map);
	}

	@Override
	public int noticeBoardUUIDService(String article_uuid) {
		// TODO Auto-generated method stub
		return dao.noticeBoardUUID(article_uuid);
	}

	@Override
	public List<ReplyDTO> noticeBoardReplyListProcess(int article_no) {
		// TODO Auto-generated method stub
		return dao.noticeBoardReplyList(article_no);
	}

	@Override
	public List<ReplyDTO> noticeBoardReplyInsertProcess(ReplyDTO rdto, String uuid) {
		// TODO Auto-generated method stub
		rdto.setReply_uuid(uuid);
		dao.noticeBoardReplyInsert(rdto);
		return dao.noticeBoardReplyList(rdto.getArticle_no());
	}

	@Override
	public int noticeBoardReplyCountProcess(int article_no) {
		// TODO Auto-generated method stub
		return dao.noticeBoardReplyCount(article_no);
	}

	@Override
	public List<ReplyDTO> noticeBoardReplyDeleteProcess(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		dao.noticeBoardReplyDelete(rdto);
		return dao.noticeBoardReplyList(rdto.getArticle_no());
	}

	@Override
	public List<ReplyDTO> noticeBoardReplyUpdateProcess(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		dao.noticeBoardReplyUpdate(rdto);
		return dao.noticeBoardReplyList(rdto.getArticle_no());
	}

	@Override
	public String noticeBoardReplyContentView(int reply_no) {
		// TODO Auto-generated method stub
		return dao.noticeBoardReplyContentView(reply_no);
	}

}
