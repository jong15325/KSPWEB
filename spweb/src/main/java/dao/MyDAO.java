package dao;

import java.util.HashMap;
import java.util.List;

import dto.GuestBookDTO;
import dto.UserDTO;
import dto.UserNowEquipDTO;
import dto.UserPageDTO;

public interface MyDAO {

	public List<UserDTO> userMyList(UserPageDTO userPageDto);

	public int userMyListTotalCount();

	public UserDTO myPage(String usr_name);

	public int myInfoRank(String usr_name);

	public int myHomeLikeCheck(HashMap<String, Object> map);

	public void myHomeLikeInsert(HashMap<String, Object> map);

	public void myHomeLikeDelete(HashMap<String, Object> map);

	public int myHomeLikeCount(int like_usr_id);

	public List<GuestBookDTO> myHomeGuestBookList(int type_id);

	public void myHomeGuestBookInsert(GuestBookDTO gdto);

	public void myHomeGuestBookDelete(GuestBookDTO gdto);

	public List<UserDTO> userSearchMap(HashMap<String, Object> map);

	public int userSearchCountMap(HashMap<String, Object> map);

	public int userOnlineState(String usr_name);

	public int myInformationChangeCheck(HashMap<String, Object> map);

	public UserNowEquipDTO myInfoNowEquipMagic(HashMap<String, Object> map);

	public UserNowEquipDTO myInfoNowEquipWeapon(HashMap<String, Object> map);

	public UserNowEquipDTO myInfoNowEquipArm(HashMap<String, Object> map);

	public UserNowEquipDTO myInfoNowEquipPet(HashMap<String, Object> map);

	public List<GuestBookDTO> myHomeGuestBookList2(HashMap<String, Object> map);

	public int myHomeUserChar(String usr_name);

	public int myHomeGuestBookCount(HashMap<String, Object> map);
}
