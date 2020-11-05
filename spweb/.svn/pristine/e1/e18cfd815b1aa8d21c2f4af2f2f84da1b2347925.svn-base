package service;

import dao.UserDAO;
import dto.GuildDTO;
import dto.UserDTO;
import dto.UserLoginDTO;
import dto.UserRegisterDTO;

public class UserServiceImp implements UserService{

	private UserDAO dao;
	
	public void setDao(UserDAO dao) {
		this.dao = dao;
	}

	public UserServiceImp() {
		
	}

	@Override
	public void userRegisterService(UserRegisterDTO userRegisterDto) {
		dao.userRegister(userRegisterDto);
	}

	@Override
	public UserDTO userLoginService(String usr_name) {
		// TODO Auto-generated method stub
		return dao.userLogin(usr_name);
	}

	@Override
	public int kakaoCountCheckService(int kakao_id) {
		// TODO Auto-generated method stub
		return dao.kakaoCountCheck(kakao_id);
	}

	@Override
	public int userLoginCountService(UserLoginDTO userLoginDto) {
		// TODO Auto-generated method stub
		return dao.userLoginCount(userLoginDto);
	}

	@Override
	public void userRegisterEquipmentsService(int usr_id) {
		// TODO Auto-generated method stub
		dao.userRegisterEquipments(usr_id);
		
	}

	@Override
	public int userSelectIdService(String usr_name) {
		// TODO Auto-generated method stub
		return dao.userSelectId(usr_name);
	}

	@Override
	public int userNameCountService(String usr_name) {
		// TODO Auto-generated method stub
		return dao.userNameCount(usr_name);
	}


	@Override
	public GuildDTO guildLoginSelectService(String guild_name) {
		// TODO Auto-generated method stub
		return dao.guildLoginSelect(guild_name);
	}
}
