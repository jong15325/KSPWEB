package dao;

import org.mybatis.spring.SqlSessionTemplate;

import dto.GuildDTO;
import dto.UserDTO;
import dto.UserLoginDTO;
import dto.UserRegisterDTO;

public class UserDaoImp implements UserDAO {

	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public UserDaoImp() {

	}

	@Override
	public void userRegister(UserRegisterDTO userRegisterDto) {
		// TODO Auto-generated method stub
		sqlSession.insert("user.userRegister", userRegisterDto);
	}

	@Override
	public UserDTO userLogin(String usr_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.userLogin", usr_name);
	}

	@Override
	public int kakaoCountCheck(int kakao_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.kakaoCountCheck", kakao_id);
	}

	@Override
	public int userLoginCount(UserLoginDTO userLoginDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.userLoginCount", userLoginDto);
	}

	@Override
	public void userRegisterEquipments(int usr_id) {
		// TODO Auto-generated method stub
		sqlSession.insert("user.userRegister_equipments", usr_id);
	}

	@Override
	public int userSelectId(String usr_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.userSelectId", usr_name);
	}

	@Override
	public int userNameCount(String usr_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.userNameCount", usr_name);
	}
	
	@Override
	public GuildDTO guildLoginSelect(String guild_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("guild.guildLoginSelect", guild_name);
	}

}
