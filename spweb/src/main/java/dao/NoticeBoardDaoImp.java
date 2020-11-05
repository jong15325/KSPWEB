package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BoardDTO;
import dto.BoardPageDTO;
import dto.ReplyDTO;

public class NoticeBoardDaoImp implements NoticeBoardDAO {

	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public NoticeBoardDaoImp() {

	}

	@Override
	public void noticeBoardInsert(BoardDTO noticeBoardDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("notice.boardInsert", noticeBoardDto);
	}

	@Override
	public BoardDTO noticeBoardContentRead(Integer article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("notice.boardContentRead", article_no);
	}

	@Override
	public void noticeBoardUpdate(BoardDTO noticeBoardDto) {
		// TODO Auto-generated method stub
		sqlSession.update("notice.boardUpdate", noticeBoardDto);
	}

	@Override
	public void noticeBoardDelete(Integer article_no) {
		// TODO Auto-generated method stub
		sqlSession.update("notice.boardDelete", article_no);
	}

	@Override
	public List<BoardDTO> noticeBoardList(BoardPageDTO noticeBoardPageDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("notice.boardList", noticeBoardPageDto);
	}

	@Override
	public BoardDTO noticeBoardSelectNum(Integer article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("notice.boardSelectNum", article_no);
	}

	@Override
	public int noticeBoardTotalCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("notice.boardTotalcount");
	}

	/*
	 * @Override public List<noticeBoardDTO> noticeBoardSearchList(noticeBoardPageDTO
	 * noticeBoardPageDto) { // TODO Auto-generated method stub return
	 * sqlSession.selectList("notice.boardSearch", noticeBoardPageDto); }
	 */

	@Override
	public List<BoardDTO> noticeBoardSearchMap(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("notice.boardSearch", map);
	}

	@Override
	public int noticeBoardSearchCountMap(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("notice.boardSearchCount", map);
	}

	@Override
	public void noticeBoardViewCountUpdate(Integer article_no) {
		// TODO Auto-generated method stub
		sqlSession.update("notice.boardViewCountUpdate", article_no);
	}

	@Override
	public int noticeBoardViewCount(Integer article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("notice.boardViewCount", article_no);
	}

	@Override
	public void noticeBoardViewCountInsert(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert("notice.boardViewCountInsert", map);
	}

	@Override
	public int noticeBoardViewCountCheck(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("notice.boardViewCheck", map);
	}

	@Override
	public int noticeBoardUUID(String article_uuid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("notice.boardNumUUID", article_uuid);
	}

	@Override
	public int noticeBoardReplyCount(int article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("notice.boardReplyCount", article_no);
	}
	
	@Override
	public List<ReplyDTO> noticeBoardReplyList(int article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("notice.boardReplyList", article_no);
	}

	@Override
	public void noticeBoardReplyInsert(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		sqlSession.insert("notice.boardReplyInsert", rdto);
	}


	@Override
	public void noticeBoardReplyUpdate(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		sqlSession.update("notice.boardReplyUpdate", rdto);
	}

	@Override
	public void noticeBoardReplyDelete(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		sqlSession.delete("notice.boardReplyDelete",rdto);
	}

	@Override
	public String noticeBoardReplyContentView(int reply_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("notice.boardReplyContentView", reply_no);
	}

}
