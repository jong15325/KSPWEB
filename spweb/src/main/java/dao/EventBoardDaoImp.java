package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BoardDTO;
import dto.BoardPageDTO;
import dto.ReplyDTO;

public class EventBoardDaoImp implements EventBoardDAO {

	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public EventBoardDaoImp() {

	}

	@Override
	public void eventBoardInsert(BoardDTO eventBoardDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("event.boardInsert", eventBoardDto);
	}

	@Override
	public BoardDTO eventBoardContentRead(Integer article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("event.boardContentRead", article_no);
	}

	@Override
	public void eventBoardUpdate(BoardDTO eventBoardDto) {
		// TODO Auto-generated method stub
		sqlSession.update("event.boardUpdate", eventBoardDto);
	}

	@Override
	public void eventBoardDelete(Integer article_no) {
		// TODO Auto-generated method stub
		sqlSession.update("event.boardDelete", article_no);
	}

	@Override
	public List<BoardDTO> eventBoardList(BoardPageDTO eventBoardPageDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("event.boardList", eventBoardPageDto);
	}

	@Override
	public BoardDTO eventBoardSelectNum(Integer article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("event.boardSelectNum", article_no);
	}

	@Override
	public int eventBoardTotalCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("event.boardTotalcount");
	}

	/*
	 * @Override public List<EventBoardDTO> eventBoardSearchList(EventBoardPageDTO
	 * eventBoardPageDto) { // TODO Auto-generated method stub return
	 * sqlSession.selectList("event.boardSearch", eventBoardPageDto); }
	 */

	@Override
	public List<BoardDTO> eventBoardSearchMap(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("event.boardSearch", map);
	}

	@Override
	public int eventBoardSearchCountMap(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("event.boardSearchCount", map);
	}

	@Override
	public void eventBoardViewCountUpdate(Integer article_no) {
		// TODO Auto-generated method stub
		sqlSession.update("event.boardViewCountUpdate", article_no);
	}

	@Override
	public int eventBoardViewCount(Integer article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("event.boardViewCount", article_no);
	}

	@Override
	public void eventBoardViewCountInsert(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert("event.boardViewCountInsert", map);
	}

	@Override
	public int eventBoardViewCountCheck(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("event.boardViewCheck", map);
	}

	@Override
	public int eventBoardUUID(String article_uuid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("event.boardNumUUID", article_uuid);
	}

	@Override
	public int eventBoardReplyCount(int article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("event.boardReplyCount", article_no);
	}
	
	@Override
	public List<ReplyDTO> eventBoardReplyList(int article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("event.boardReplyList", article_no);
	}

	@Override
	public void eventBoardReplyInsert(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		sqlSession.insert("event.boardReplyInsert", rdto);
	}


	@Override
	public void eventBoardReplyUpdate(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		sqlSession.update("event.boardReplyUpdate", rdto);
	}

	@Override
	public void eventBoardReplyDelete(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		sqlSession.delete("event.boardReplyDelete",rdto);
	}

	@Override
	public String eventBoardReplyContentView(int reply_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("event.boardReplyContentView", reply_no);
	}

}
