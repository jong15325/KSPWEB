package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BoardDTO;
import dto.BoardPageDTO;
import dto.ReplyDTO;

public class FreeBoardDaoImp implements FreeBoardDAO {

	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public FreeBoardDaoImp() {

	}

	@Override
	public void freeBoardInsert(BoardDTO freeBoardDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("free.boardInsert", freeBoardDto);
	}

	@Override
	public BoardDTO freeBoardContentRead(Integer article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("free.boardContentRead", article_no);
	}

	@Override
	public void freeBoardUpdate(BoardDTO freeBoardDto) {
		// TODO Auto-generated method stub
		sqlSession.update("free.boardUpdate", freeBoardDto);
	}

	@Override
	public void freeBoardDelete(Integer article_no) {
		// TODO Auto-generated method stub
		sqlSession.update("free.boardDelete", article_no);
	}

	@Override
	public List<BoardDTO> freeBoardList(BoardPageDTO freeBoardPageDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("free.boardList", freeBoardPageDto);
	}

	@Override
	public BoardDTO freeBoardSelectNum(Integer article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("free.boardSelectNum", article_no);
	}

	@Override
	public int freeBoardTotalCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("free.boardTotalcount");
	}

	/*
	 * @Override public List<FreeBoardDTO> freeBoardSearchList(FreeBoardPageDTO
	 * freeBoardPageDto) { // TODO Auto-generated method stub return
	 * sqlSession.selectList("free.boardSearch", freeBoardPageDto); }
	 */

	@Override
	public List<BoardDTO> freeBoardSearchMap(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("free.boardSearch", map);
	}

	@Override
	public int freeBoardSearchCountMap(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("free.boardSearchCount", map);
	}

	@Override
	public void freeBoardViewCountUpdate(Integer article_no) {
		// TODO Auto-generated method stub
		sqlSession.update("free.boardViewCountUpdate", article_no);
	}

	@Override
	public int freeBoardViewCount(Integer article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("free.boardViewCount", article_no);
	}

	@Override
	public void freeBoardViewCountInsert(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert("free.boardViewCountInsert", map);
	}

	@Override
	public int freeBoardViewCountCheck(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("free.boardViewCheck", map);
	}

	@Override
	public int freeBoardUUID(String article_uuid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("free.boardNumUUID", article_uuid);
	}

	@Override
	public int freeBoardReplyCount(int article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("free.boardReplyCount", article_no);
	}
	
	@Override
	public List<ReplyDTO> freeBoardReplyList(int article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("free.boardReplyList", article_no);
	}

	@Override
	public void freeBoardReplyInsert(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		sqlSession.insert("free.boardReplyInsert", rdto);
	}


	@Override
	public void freeBoardReplyUpdate(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		sqlSession.update("free.boardReplyUpdate", rdto);
	}

	@Override
	public void freeBoardReplyDelete(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		sqlSession.delete("free.boardReplyDelete",rdto);
	}

	@Override
	public String freeBoardReplyContentView(int reply_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("free.boardReplyContentView", reply_no);
	}

}
