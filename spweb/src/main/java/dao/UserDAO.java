package dao;

import dto.GuildDTO;
import dto.UserDTO;
import dto.UserLoginDTO;
import dto.UserRegisterDTO;

public interface UserDAO {

	/* public String getTime(); */
	public int userSelectId(String usr_name);
	
	public int userNameCount(String usr_name);
	
	public void userRegister(UserRegisterDTO userRegisterDto);
	
	public void userRegisterEquipments(int usr_id);
	
	public UserDTO userLogin(String usr_name);
	
	public int kakaoCountCheck(int kakao_id);
	
	public int userLoginCount(UserLoginDTO userLoginDto);
	
	public GuildDTO guildLoginSelect(String guild_name);
}
