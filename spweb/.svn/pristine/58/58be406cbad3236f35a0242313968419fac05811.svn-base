package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import api.CardInfoManager;
import api.UserCardImgManager;
import dto.UserCardDTO;
import service.UserCardService;

//http://localhost:8070/sp/mainPage.do

@Controller
public class UserCardController {

	private UserCardService service;

	public void setService(UserCardService service) {
		this.service = service;
	}

	public UserCardController() {

	}
	
	
	@ResponseBody
	@RequestMapping(value = "/userCardDetailView.do")
	public UserCardDTO userCardDetailView(int itm_id) {
		UserCardDTO ucdto = new UserCardDTO();
		CardInfoManager cim = new CardInfoManager();
		UserCardImgManager UCIM = new UserCardImgManager();
		ucdto = service.userCardDetailViewService(itm_id);
		if(ucdto != null) {
			ucdto.setCard_type_info(cim.cardTypeInfo(ucdto.getItm_type(), false));
			ucdto.setCard_name_info(cim.cardNameInfo(ucdto.getItm_type(), false));
			ucdto.setCard_channl_info(cim.cardChannel_info(ucdto.getItm_type(), ucdto.getItm_level()));
			ucdto.setCard_element(cim.cardElement(ucdto.getItm_type(), false));
			ucdto.setCard_date(cim.card_date(ucdto.getItm_type(), ucdto.getItm_trans_gf(), ucdto.getItm_level(), false));
			ucdto.setCard_img_path(UCIM.userSPCardImg(ucdto.getItm_type(), ucdto.getItm_level(), false));
			ucdto.setCard_skill1(cim.card_skill1(ucdto.getItm_skill(), ucdto.getItm_level()));
			ucdto.setCard_skill2(cim.card_skill2(ucdto.getItm_skill()));
			
			System.out.println("스킬 : "+ucdto.getItm_skill());
			System.out.println("스킬1 : "+ucdto.getCard_skill1());
			System.out.println("스킬2 : "+ucdto.getCard_skill2());
		}
		return ucdto;
	}
	
}
