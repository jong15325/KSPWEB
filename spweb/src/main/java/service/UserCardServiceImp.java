package service;

import dao.UserCardDAO;
import dto.UserCardDTO;

public class UserCardServiceImp implements UserCardService{

	private UserCardDAO dao;
	
	public void setDao(UserCardDAO dao) {
		this.dao = dao;
	}

	public UserCardServiceImp() {
		
	}

	@Override
	public UserCardDTO userCardDetailViewService(int itm_id) {
		// TODO Auto-generated method stub
		return dao.userCardDetailView(itm_id);
	}

}
