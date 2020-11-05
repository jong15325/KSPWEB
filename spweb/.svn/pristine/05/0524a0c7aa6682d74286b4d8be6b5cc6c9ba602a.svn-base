package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BoardDTO;
import dto.BoardPageDTO;
import dto.ReplyDTO;

public class UpdateBoardDaoImp implements UpdateBoardDAO {

	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public UpdateBoardDaoImp() {

	}

	@Override
	public void updateBoardInsert(BoardDTO updateBoardDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("update.boardInsert", updateBoardDto);
	}

	@Override
	public BoardDTO updateBoardContentRead(Integer article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("update.boardContentRead", article_no);
	}

	@Override
	public void updateBoardUpdate(BoardDTO updateBoardDto) {
		// TODO Auto-generated method stub
		sqlSession.update("update.boardUpdate", updateBoardDto);
	}

	@Override
	public void updateBoardDelete(Integer article_no) {
		// TODO Auto-generated method stub
		sqlSession.update("update.boardDelete", article_no);
	}

	@Override
	public List<BoardDTO> updateBoardList(BoardPageDTO updateBoardPageDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("update.boardList", updateBoardPageDto);
	}

	@Override
	public BoardDTO updateBoardSelectNum(Integer article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("update.boardSelectNum", article_no);
	}

	@Override
	public int updateBoardTotalCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("update.boardTotalcount");
	}

	/*
	 * @Override public List<UpdateBoardDTO> updateBoardSearchList(UpdateBoardPageDTO
	 * updateBoardPageDto) { // TODO Auto-generated method stub return
	 * sqlSession.selectList("update.boardSearch", updateBoardPageDto); }
	 */

	@Override
	public List<BoardDTO> updateBoardSearchMap(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("update.boardSearch", map);
	}

	@Override
	public int updateBoardSearchCountMap(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("update.boardSearchCount", map);
	}

	@Override
	public void updateBoardViewCountUpdate(Integer article_no) {
		// TODO Auto-generated method stub
		sqlSession.update("update.boardViewCountUpdate", article_no);
	}

	@Override
	public int updateBoardViewCount(Integer article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("update.boardViewCount", article_no);
	}

	@Override
	public void updateBoardViewCountInsert(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert("update.boardViewCountInsert", map);
	}

	@Override
	public int updateBoardViewCountCheck(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("update.boardViewCheck", map);
	}

	@Override
	public int updateBoardUUID(String article_uuid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("update.boardNumUUID", article_uuid);
	}

	@Override
	public int updateBoardReplyCount(int article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("update.boardReplyCount", article_no);
	}
	
	@Override
	public List<ReplyDTO> updateBoardReplyList(int article_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("update.boardReplyList", article_no);
	}

	@Override
	public void updateBoardReplyInsert(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		sqlSession.insert("update.boardReplyInsert", rdto);
	}


	@Override
	public void updateBoardReplyUpdate(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		sqlSession.update("update.boardReplyUpdate", rdto);
	}

	@Override
	public void updateBoardReplyDelete(ReplyDTO rdto) {
		// TODO Auto-generated method stub
		sqlSession.delete("update.boardReplyDelete",rdto);
	}

	@Override
	public String updateBoardReplyContentView(int reply_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("update.boardReplyContentView", reply_no);
	}

}
