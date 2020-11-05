package dao;

import org.mybatis.spring.SqlSessionTemplate;

import dto.UserCardDTO;

public class UserCardDaoImp implements UserCardDAO{
	
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public UserCardDaoImp() {
		
	}

	@Override
	public UserCardDTO userCardDetailView(int itm_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userCard.detailinfo", itm_id);
	}

	
	
}
