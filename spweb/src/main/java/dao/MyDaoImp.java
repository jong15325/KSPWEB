package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.GuestBookDTO;
import dto.UserDTO;
import dto.UserNowEquipDTO;
import dto.UserPageDTO;

public class MyDaoImp implements MyDAO{
	
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public MyDaoImp() {
		
	}

	@Override
	public UserDTO myPage(String usr_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("my.myInformation", usr_name);
	}

	@Override
	public int myInfoRank(String usr_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("my.infoRank", usr_name);
	}

	@Override
	public int myHomeLikeCheck(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("my.homeLikeCheck", map);
	}

	@Override
	public void myHomeLikeInsert(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert("my.homeLikeInsert", map);
	}

	@Override
	public void myHomeLikeDelete(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.delete("my.homeLikeDelete", map);
	}

	@Override
	public int myHomeLikeCount(int like_usr_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("my.homeLikeCount", like_usr_id);
	}

	@Override
	public List<GuestBookDTO> myHomeGuestBookList(int type_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("my.homeGuestBookList", type_id);
	}

	@Override
	public void myHomeGuestBookInsert(GuestBookDTO gdto) {
		// TODO Auto-generated method stub
		sqlSession.insert("my.homeGuestBookInsert", gdto);
	}

	@Override
	public void myHomeGuestBookDelete(GuestBookDTO gdto) {
		// TODO Auto-generated method stub
		sqlSession.insert("my.homeGuestBookDelete", gdto);
	}

	@Override
	public List<UserDTO> userMyList(UserPageDTO userPageDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("my.userMyList", userPageDto);
	}

	@Override
	public int userMyListTotalCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("my.userMyListCount");
	}

	@Override
	public List<UserDTO> userSearchMap(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("my.userSearch", map);
	}

	@Override
	public int userSearchCountMap(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("my.userSearchCount", map);
	}

	@Override
	public int userOnlineState(String usr_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("my.userOnlineState", usr_name);
	}

	@Override
	public int myInformationChangeCheck(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("my.userLoginCheck", map);
	}

	@Override
	public UserNowEquipDTO myInfoNowEquipMagic(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("my.userNowEquipMagic", map);
	}

	@Override
	public UserNowEquipDTO myInfoNowEquipWeapon(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("my.userNowEquipWeapon", map);
	}

	@Override
	public UserNowEquipDTO myInfoNowEquipArm(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("my.userNowEquipArm", map);
	}

	@Override
	public UserNowEquipDTO myInfoNowEquipPet(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("my.userNowEquipPet", map);
	}

	@Override
	public List<GuestBookDTO> myHomeGuestBookList2(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("my.homeGuestBookList2", map);
	}

	@Override
	public int myHomeUserChar(String usr_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("my.homeUserChar", usr_name);
	}

	@Override
	public int myHomeGuestBookCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("my.homeGuestBookCount", map);
	}
	
	
}
