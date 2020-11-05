package service;

import java.util.HashMap;
import java.util.List;

import dto.GuestBookDTO;
import dto.UserDTO;
import dto.UserNowEquipDTO;
import dto.UserPageDTO;

public interface MyService {

	public List<UserDTO> userMyListService(UserPageDTO userPageDto);

	public int userMyListTotalCountService();

	public UserDTO myPageService(String usr_name);

	public int myInfoRankService(String usr_name);

	public int myHomeLikeCheckService(HashMap<String, Object> map);

	public void myHomeLikeInsertService(HashMap<String, Object> map);

	public void myHomeLikeDeleteService(HashMap<String, Object> map);

	public List<GuestBookDTO> myHomeGuestBookListProcess(int type_id);

	public List<GuestBookDTO> myHomeGuestBookInsertProcess(GuestBookDTO gdto);

	public List<GuestBookDTO> myHomeGuestBookDeleteProcess(GuestBookDTO gdto);

	public List<UserDTO> userSearchLMapProcess(HashMap<String, Object> map);

	public int userSearchCountMapProcess(HashMap<String, Object> map);

	public int userLikeCountService(int like_usr_id);

	public int userOnlineStateService(String usr_name);

	public int myInformationChangeCheckService(HashMap<String, Object> map);

	public UserNowEquipDTO myInfoNowEquipMagicService(HashMap<String, Object> map);

	public UserNowEquipDTO myInfoNowEquipWeaponService(HashMap<String, Object> map);

	public UserNowEquipDTO myInfoNowEquipArmService(HashMap<String, Object> map);

	public UserNowEquipDTO myInfoNowEquipPetService(HashMap<String, Object> map);

	public List<GuestBookDTO> myHomeGuestBookList2Service(HashMap<String, Object> map);

	public int myHomeGuestBookCountService(HashMap<String, Object> map);
}
