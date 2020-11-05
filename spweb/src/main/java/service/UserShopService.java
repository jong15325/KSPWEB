package service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import dto.BankDTO;
import dto.UserCardDTO;
import dto.UserDTO;
import dto.UserGameActiveDTO;
import dto.UserShopDTO;
import dto.UserShopPageDTO;

public interface UserShopService {

	public List<UserShopDTO> userShopAllListService(UserShopPageDTO userShopPageDto);

	public int userShopAllListCountService();

	public UserShopDTO userShopCardDetailViewService(int shop_id);

	public List<UserShopDTO> userShopSearchListService(HashMap<String, Object> map);

	public int userShopSearchListCountService(HashMap<String, Object> map);

	public int userShopBuyCheckService(int shop_id);

	public int userShopBuyUserCheckService(int usr_id);

	public UserDTO userShopBuyUserInfoService(int usr_id);

	public int userGetSlotService(int usr_id);

	public int userTotalCardCountService(int itm_usr_id);

	public List<UserCardDTO> buyUserCardListService(int itm_usr_id);

	public void buyCardTransUpdateService(HashMap<String, Object> map) throws Exception;

	public void buyCardTransDeleteService(int itm_id) throws Exception;

	public void buyCardInsertService(int itm_id) throws Exception;

	public void userShopSellCardDeleteService(int shop_id) throws Exception;

	public int bankCheckService(String usr_name);

	public void sellUserBankUpdateService(HashMap<String, Object> map) throws Exception;

	public void sellUserBackInsertService(HashMap<String, Object> map) throws Exception;

	public UserDTO sellUserInfoService(String usr_name);

	public void buyUserCodeUpdateService(HashMap<String, Object> map) throws Exception;

	public void sellUserSpiritUpdateService(HashMap<String, Object> map) throws Exception;

	public void buyUserSpiritUpdateService(HashMap<String, Object> map) throws Exception;
	
	public void userShopLogUpdateService(HashMap<String, Object> map) throws Exception;
	
	public BankDTO userBankInfoService(int usr_id);
	
	public UserGameActiveDTO userGameActiveStateService(String usr_name);
	
	public void sendGiftMessageService(HashMap<String, Object> map) throws Exception;
	
	public void sendBuyMessageService(HashMap<String, Object> map) throws Exception;
	
	public int userShopBuyService(Integer shop_id, Integer card_room, HttpSession session) throws Exception;

}
