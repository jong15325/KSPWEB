package service;

import java.util.HashMap;
import java.util.List;

import dao.EventBoardDAO;
import dto.BoardDTO;
import dto.BoardPageDTO;
import dto.ReplyDTO;

public class EventBoardServiceImp implements EventBoardService {

	private EventBoardDAO dao;

	public void setDao(EventBoardDAO dao) {
		this.dao = dao;
	}

	public EventBoardServiceImp() {

	}

	@Override
	public void eventBoardInsertService(BoardDTO eventBoardDto, String uuid) {
		eventBoardDto.setArticle_uuid(uuid);
		dao.eventBoardInsert(eventBoardDto);

	}

	@Override
	public BoardDTO eventBoardContentRead(Integer article_no) {
		// TODO Auto-generated method stub
		return dao.eventBoardContentRead(article_no);
	}

	@Override
	public void eventBoardUpdateService(BoardDTO eventBoardDto) {
		// TODO Auto-generated method stub
		dao.eventBoardUpdate(eventBoardDto);
	}

	@Override
	public void eventBoardDeleteService(Integer article_no) {
		// TODO Auto-generated method stub
		dao.eventBoardDelete(article_no);
	}

	@Override
	public List<BoardDTO> eventBoardList(BoardPageDTO eventBoardPageDto) {
		// TODO Auto-generated method stub
		
		List<BoardDTO> aList = dao.eventBoardList(eventBoardPageDto);
		for (BoardDTO dto : aList) {
			dto.setReply_count(dao.eventBoardReplyCount(dto.getArticle_no()));
		}
		return aList;
	}

	@Override
	public BoardDTO eventBoardSelectNumService(Integer article_no) {
		// TODO Auto-generated method stub
		return dao.eventBoardSelectNum(article_no);
	}

	@Override
	public int eventBoardTotalCountService() {
		// TODO Auto-generated method stub
		return dao.eventBoardTotalCount();
	}

	@Override
	public List<BoardDTO> eventBoardSearchLMapProcess(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<BoardDTO> aList = dao.eventBoardSearchMap(map);
		for (BoardDTO dto : aList) {
			dto.setReply_count(dao.eventBoardReplyCount(dto.getArticle_no()));
		}
		return aList;
	}

	@Override
	public int eventBoardSearchCountMapProcess(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.eventBoardSearchCountMap(map);
	}

	@Override
	public void eventBoardViewCountUpdateService(Integer article_no) {
		// TODO Auto-generated method stub
		dao.eventBoardViewCountUpdate(article_no);
	}

	@Override
	public void eventBoardViewCountInsertService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.eventBoardViewCountInsert(map);
	}

	@Override
	public int eventBoardViewCountCheckService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.eventBoardViewCountCheck(map);
	}

	@Override
	public int eventBoardUUIDService(String article_uuid) {
		// TODO Auto-generated method stub
		return dao.eventBoardUUID(article_uuid);
	}

	@Override
	public List<ReplyDTO> eventBoardReplyListProcess(int article_no) {
		// TODO Auto-generated method stub
		return dao.eventBoardReplyList(article_no);
	}

	@Override
	public List<ReplyDTO> eventBoardReplyInsertProcess(ReplyDTO rdto, String uuid) {
		// TODO Auto-generated method stub
		rdto.setReply_uuid(uuid);
		dao.eventBoardReplyInsert(rdto);
		return dao.eventBoardReplyList(rdto.getArticle_no());
	}

	@Override
	public int eventBoardReplyCountProcess(int article_no) {
		// TODO Auto-generated method stub
		return dao.eventBoardReplyCount(article_no);
	}

	@Override
	public List<ReplyDTO> eventBoardReplyDeleteProcess(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		dao.eventBoardReplyDelete(rdto);
		return dao.eventBoardReplyList(rdto.getArticle_no());
	}

	@Override
	public List<ReplyDTO> eventBoardReplyUpdateProcess(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		dao.eventBoardReplyUpdate(rdto);
		return dao.eventBoardReplyList(rdto.getArticle_no());
	}

	@Override
	public String eventBoardReplyContentView(int reply_no) {
		// TODO Auto-generated method stub
		return dao.eventBoardReplyContentView(reply_no);
	}

}
