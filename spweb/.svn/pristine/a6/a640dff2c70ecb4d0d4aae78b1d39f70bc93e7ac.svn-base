package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BankDTO;
import dto.UserCardDTO;
import dto.UserDTO;
import dto.UserGameActiveDTO;
import dto.UserShopDTO;
import dto.UserShopPageDTO;

public class UserShopDaoImp implements UserShopDAO{
	
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public UserShopDaoImp() {
		
	}

	@Override
	public List<UserShopDTO> userShopAllList(UserShopPageDTO userShopPageDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("userShop.itemAllList", userShopPageDto);
	}

	@Override
	public int userShopAllListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userShop.itemAllListCount");
	}

	@Override
	public UserShopDTO userShopCardDetailView(int shop_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userShop.detailinfo", shop_id);
	}

	@Override
	public List<UserShopDTO> userShopSearchList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("userShop.searchList", map);
	}

	@Override
	public int userShopSearchCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userShop.SearchCount", map);
	}

	@Override
	public int userShopBuyCheck(int shop_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userShop.buyShopCheck", shop_id);
	}

	@Override
	public int userShopBuyUserCheck(int usr_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userShop.buyUserCheck", usr_id);
	}

	@Override
	public UserDTO userShopBuyUserInfo(int usr_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userShop.buyUserInfo", usr_id);
	}

	@Override
	public int userGetSlot(int usr_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userShop.buyUserNSlot", usr_id);
	}

	@Override
	public int userTotalCardCount(int itm_usr_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userShop.buyUserTotalCardCount", itm_usr_id);
	}

	@Override
	public List<UserCardDTO> buyUserCardList(int itm_usr_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("userShop.buyUserCardList", itm_usr_id);
	}

	@Override
	public void buyCardTransUpdate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.update("userShop.buyCardTransUpdate", map);
	}

	@Override
	public void buyCardTransDelete(int itm_id) {
		// TODO Auto-generated method stub
		sqlSession.delete("userShop.buyCardTransDelete", itm_id);
	}

	@Override
	public void buyCardInsert(int itm_id) {
		// TODO Auto-generated method stub
		sqlSession.insert("userShop.buyUserCardInsert", itm_id);
	}

	@Override
	public void userShopSellCardDelete(int shop_id) {
		// TODO Auto-generated method stub
		sqlSession.delete("userShop.sellCardShopDelete", shop_id);
	}

	@Override
	public int bankCheck(String usr_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userShop.bankCheck", usr_name);
	}

	@Override
	public void sellUserBankUpdate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.update("userShop.sellUserbankUpdate", map);
	}

	
	@Override
	public void sellUserBackInsert(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert("userShop.sellUserbankInsert", map);
	}

	@Override
	public UserDTO sellUserInfo(String usr_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userShop.sellUserInfo", usr_name);
	}

	@Override
	public void buyUserCodeUpdate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.update("userShop.buyUserCodeUpdate", map);
	}

	@Override
	public void sellUserSpiritUpdate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.update("userShop.sellUserSpiritUpdate", map);
	}

	@Override
	public void buyUserSpiritUpdate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.update("userShop.buyUserSpiritUpdate", map);
	}

	@Override
	public void userShopLogUpdate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.update("userShop.userShopLogUpdate", map);
	}

	@Override
	public BankDTO userBankInfo(int usr_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userShop.getBankInfo", usr_id);
	}

	@Override
	public UserGameActiveDTO userGameActiveState(String usr_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userShop.gameActiveState", usr_name);
	}

	@Override
	public void sendGiftMessage(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert("userShop.sendGiftMessage", map);
	}

	@Override
	public void sendBuyMessage(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert("userShop.sendBuyMessage", map);
	}

	
}
