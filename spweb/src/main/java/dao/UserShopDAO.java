package dao;

import java.util.HashMap;
import java.util.List;

import dto.BankDTO;
import dto.UserCardDTO;
import dto.UserDTO;
import dto.UserGameActiveDTO;
import dto.UserShopDTO;
import dto.UserShopPageDTO;

public interface UserShopDAO {

	public List<UserShopDTO> userShopAllList(UserShopPageDTO userShopPageDto);
	
	public int userShopAllListCount();
	
	public UserShopDTO userShopCardDetailView(int shop_id);
	
	public List<UserShopDTO> userShopSearchList(HashMap<String, Object> map);
	
	public int userShopSearchCount(HashMap<String, Object> map);
	 //buyShopCheck buyUserCheck buyUserInfo
	
	public int userShopBuyCheck(int shop_id);
	
	public int userShopBuyUserCheck(int usr_id);
	
	public UserDTO userShopBuyUserInfo(int usr_id);
	
	public int userGetSlot(int usr_id);
	
	public int userTotalCardCount(int itm_usr_id);
	
	public List<UserCardDTO> buyUserCardList(int itm_usr_id);
	
	public void buyCardTransUpdate(HashMap<String, Object> map);
	
	public void buyCardTransDelete(int itm_id);
	
	public void buyCardInsert(int itm_id);
	
	public void userShopSellCardDelete(int shop_id);
	
	public int bankCheck(String usr_name);
	
	public void sellUserBankUpdate(HashMap<String, Object> map);
	
	public void sellUserBackInsert(HashMap<String, Object> map);
	
	public UserDTO sellUserInfo(String usr_name);
	
	public void buyUserCodeUpdate(HashMap<String, Object> map);
	
	public void sellUserSpiritUpdate(HashMap<String, Object> map);
	
	public void buyUserSpiritUpdate(HashMap<String, Object> map);
	
	public void userShopLogUpdate(HashMap<String, Object> map);
	
	public BankDTO userBankInfo(int usr_id);
	
	public UserGameActiveDTO userGameActiveState(String usr_name);
	
	public void sendGiftMessage(HashMap<String, Object> map);
	
	public void sendBuyMessage(HashMap<String, Object> map);
}
