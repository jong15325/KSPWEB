package service;

import java.util.HashMap;
import java.util.List;

import api.UserImgManager;
import dao.MyDAO;
import dto.GuestBookDTO;
import dto.UserDTO;
import dto.UserNowEquipDTO;
import dto.UserPageDTO;

public class MyServiceImp implements MyService{

	private MyDAO dao;
	
	public void setDao(MyDAO dao) {
		this.dao = dao;
	}

	public MyServiceImp() {
		
	}

	@Override
	public UserDTO myPageService(String usr_name) {
		// TODO Auto-generated method stub
		return dao.myPage(usr_name);
	}

	@Override
	public int myInfoRankService(String usr_name) {
		// TODO Auto-generated method stub
		return dao.myInfoRank(usr_name);
	}

	@Override
	public int myHomeLikeCheckService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.myHomeLikeCheck(map);
	}

	@Override
	public void myHomeLikeInsertService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.myHomeLikeInsert(map);
	}

	@Override
	public void myHomeLikeDeleteService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.myHomeLikeDelete(map);
	}

	@Override
	public List<GuestBookDTO> myHomeGuestBookListProcess(int type_id) {
		// TODO Auto-generated method stub
		return dao.myHomeGuestBookList(type_id);
	}

	@Override
	public List<GuestBookDTO> myHomeGuestBookInsertProcess(GuestBookDTO gdto) {
		// TODO Auto-generated method stub
		dao.myHomeGuestBookInsert(gdto);
		return dao.myHomeGuestBookList(gdto.getType_id());
	}

	@Override
	public List<GuestBookDTO> myHomeGuestBookDeleteProcess(GuestBookDTO gdto) {
		// TODO Auto-generated method stub
		dao.myHomeGuestBookDelete(gdto);
		return dao.myHomeGuestBookList(gdto.getType_id());
	}

	@Override
	public List<UserDTO> userMyListService(UserPageDTO userPageDto) {
		// TODO Auto-generated method stub
		UserImgManager UIM  = new UserImgManager();
		List<UserDTO> aList = dao.userMyList(userPageDto);
		for (UserDTO dto : aList) {
			dto.setUsr_online_state(dao.userOnlineState(dto.getUsr_name()));
			dto.setUsr_like_count(dao.myHomeLikeCount(dto.getUsr_id()));
			dto.setUsr_profile_path(UIM.userMainCharacterImg(dto.getUsr_char()));
			dto.setUsr_level_path(UIM.userLevelImg(dto.getUsr_level()));
		}
		return aList;
	}

	@Override
	public int userMyListTotalCountService() {
		// TODO Auto-generated method stub
		return dao.userMyListTotalCount();
	}

	@Override
	public List<UserDTO> userSearchLMapProcess(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		UserImgManager UIM  = new UserImgManager();
		List<UserDTO> aList = dao.userSearchMap(map);
		for (UserDTO dto : aList) {
			dto.setUsr_online_state(dao.userOnlineState(dto.getUsr_name()));
			dto.setUsr_like_count(dao.myHomeLikeCount(dto.getUsr_id()));
			dto.setUsr_profile_path(UIM.userMainCharacterImg(dto.getUsr_char()));
			dto.setUsr_level_path(UIM.userLevelImg(dto.getUsr_level()));
		}
		return aList;
	}

	@Override
	public int userSearchCountMapProcess(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.userSearchCountMap(map);
	}

	@Override
	public int userLikeCountService(int like_usr_id) {
		// TODO Auto-generated method stub
		return dao.myHomeLikeCount(like_usr_id);
	}

	@Override
	public int userOnlineStateService(String usr_name) {
		// TODO Auto-generated method stub
		return dao.userOnlineState(usr_name);
	}

	@Override
	public int myInformationChangeCheckService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.myInformationChangeCheck(map);
	}

	@Override
	public UserNowEquipDTO myInfoNowEquipMagicService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.myInfoNowEquipMagic(map);
	}

	@Override
	public UserNowEquipDTO myInfoNowEquipWeaponService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.myInfoNowEquipWeapon(map);
	}

	@Override
	public UserNowEquipDTO myInfoNowEquipArmService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.myInfoNowEquipArm(map);
	}

	@Override
	public UserNowEquipDTO myInfoNowEquipPetService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.myInfoNowEquipPet(map);
	}

	@Override
	public List<GuestBookDTO> myHomeGuestBookList2Service(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<GuestBookDTO> aList = dao.myHomeGuestBookList2(map);
		for (GuestBookDTO dto : aList) {
			UserImgManager UIM  = new UserImgManager();
			dto.setGuest_profile_path(UIM.userMainCharacterImg(dao.myHomeUserChar(dto.getGuest_writer())));
			dto.setGuest_count(dao.myHomeGuestBookCount(map));
		}
		return aList;
	}

	@Override
	public int myHomeGuestBookCountService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.myHomeGuestBookCount(map);
	}
}
