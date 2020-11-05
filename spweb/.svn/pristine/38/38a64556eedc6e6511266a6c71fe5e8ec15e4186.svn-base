package controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import api.CardInfoManager;
import api.UserCardImgManager;
import api.UserImgManager;
import dto.UserDTO;
import dto.UserShopDTO;
import dto.UserShopPageDTO;
import service.UserShopService;

//http://localhost:8070/sp/mainPage.do

@Controller
public class UserShopController {

	private UserShopService service;
	private int currentPage;
	private UserShopPageDTO pdto;

	public void setService(UserShopService service) {
		this.service = service;
	}

	public UserShopController() {

	}

	@RequestMapping(value = "/userShopMain.do")
	public ModelAndView userShopMain(UserShopPageDTO userShopPageDto) {
		System.out.println("유저샾 매인 접근.");
		ModelAndView mav = new ModelAndView();
		int totalRecord = service.userShopAllListCountService();
		if (totalRecord >= 1) {
			if (userShopPageDto.getCurrentPage() == 0)
				currentPage = 1;
			else {
				currentPage = userShopPageDto.getCurrentPage();
				if (currentPage < 0) {
					currentPage = -(currentPage);
					System.out.println("currentPage : " + currentPage);
				}

			}
			System.out.println("currentPage : " + currentPage);
			pdto = new UserShopPageDTO(currentPage, totalRecord);
			System.out.println("총 페이지 수 : " + pdto.getTotalPage());
			System.out.println("총 레코드 수 : " + pdto.getTotalCount());
			System.out.println("시작 레코드 번호 : " + pdto.getStartRow());
			System.out.println("끝 레코드 번호 : " + pdto.getEndRow());
			System.out.println("시작 페이지 번호 : " + pdto.getStartPage());
			System.out.println("끝 페이지 번호 : " + pdto.getEndPage());
			mav.addObject("userShopPageDto", pdto);
			mav.addObject("aList", service.userShopAllListService(pdto));
		}
		mav.setViewName("/shop/userShopMain");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/userShopCardDetailView.do")
	public UserShopDTO userShopCardDetailView(int shop_id, int buy_usr_id) {
		UserShopDTO usdto = new UserShopDTO();
		UserDTO udto = new UserDTO();
		CardInfoManager cim = new CardInfoManager();
		UserCardImgManager UCIM = new UserCardImgManager();
		UserImgManager UIM = new UserImgManager();
		usdto = service.userShopCardDetailViewService(shop_id);
		udto = service.userShopBuyUserInfoService(buy_usr_id);
		if (usdto != null) {
			usdto.setCard_type_info(cim.cardTypeInfo(usdto.getCard_type(), true));
			usdto.setCard_name_info(cim.cardNameInfo(usdto.getCard_type(), true));
			usdto.setCard_channl_info(cim.cardChannel_info(usdto.getCard_type(), usdto.getCard_level()));
			usdto.setCard_element(cim.cardElement(usdto.getCard_type(), true));
			usdto.setCard_date(cim.card_date(usdto.getCard_type(), usdto.getItm_trans_gf(), usdto.getCard_level(), true));
			usdto.setCard_img_path(UCIM.userSPCardImg(usdto.getCard_type(), usdto.getCard_level(), true));
			usdto.setCard_skill1(cim.card_skill1(usdto.getCard_skill(), usdto.getCard_level()));
			usdto.setCard_skill2(cim.card_skill2(usdto.getCard_skill()));
			usdto.setLevel_img_path(UIM.userLevelImg(usdto.getLevels()));
			if (usdto.getCard_type() > 9999) {
				int count = usdto.getCard_type() % 10000;
				usdto.setSpirit_count(count);
			}
			usdto.setBuy_usr_code(udto.getUsr_code());
			usdto.setBuy_usr_name(udto.getUsr_name());
			usdto.setBuy_usr_img_path(UIM.userLevelImg(udto.getUsr_level()));
			System.out.println("스킬 : " + usdto.getCard_skill());
			System.out.println("스킬1 : " + usdto.getCard_skill1());
			System.out.println("스킬2 : " + usdto.getCard_skill2());
		}else {
			usdto = null;
		}
		return usdto;
	}

	@RequestMapping(value = "/userShopSearch.do")
	public ModelAndView userShopSearch(UserShopPageDTO userShopPageDto, String search_shop_type,
			String search_shop_element, String search_card_level) {
		System.out.println("유저샾 검색접근.");
		ModelAndView mav = new ModelAndView();
		CardInfoManager cim = new CardInfoManager();
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println("저장 save_shop_type : " + search_shop_type + " save_shop_element : " + search_shop_element
				+ " card_level : " + search_card_level);
		if (search_shop_type != null) {
			if (search_shop_element != null) {
				if (search_card_level != null) {
					System.out.println("저장 save_shop_type : " + search_shop_type + " save_shop_element : "
							+ search_shop_element + " card_level : " + search_card_level);
					int shop_type_trans = cim.search_shop_type(search_shop_type);
					int shop_element_trans = cim.search_shop_element(search_shop_element);
					int card_level_trans = cim.search_card_level(search_card_level);
					map.put("shop_type", shop_type_trans);
					map.put("shop_element", shop_element_trans);
					map.put("card_level", card_level_trans);
					map.put("save_shop_type", search_shop_type);
					map.put("save_shop_element", search_shop_element);
					map.put("save_card_level", search_card_level);
					System.out.println("검색 shop_type : " + shop_type_trans + " shop_element : " + shop_element_trans
							+ " card_level : " + card_level_trans);
					System.out.println("저장 save_shop_type : " + search_shop_type + " save_shop_element : "
							+ search_shop_element + " card_level : " + search_card_level);
					int totalRecord = service.userShopSearchListCountService(map);
					if (totalRecord >= 1) {
						if (userShopPageDto.getCurrentPage() == 0)
							currentPage = 1;
						else {
							currentPage = userShopPageDto.getCurrentPage();
							if (currentPage < 0) {
								currentPage = -(currentPage);
								System.out.println("currentPage : " + currentPage);
							}

						}
						System.out.println("currentPage : " + currentPage);
						pdto = new UserShopPageDTO(currentPage, totalRecord);
						System.out.println("총 페이지 수 : " + pdto.getTotalPage());
						System.out.println("총 레코드 수 : " + pdto.getTotalCount());
						System.out.println("시작 레코드 번호 : " + pdto.getStartRow());
						System.out.println("끝 레코드 번호 : " + pdto.getEndRow());
						System.out.println("시작 페이지 번호 : " + pdto.getStartPage());
						System.out.println("끝 페이지 번호 : " + pdto.getEndPage());
						map.put("startRow", pdto.getStartRow());
						map.put("blockCount", pdto.getBlockCount());
						mav.addObject("userShopPageDto", pdto);
						mav.addObject("aList", service.userShopSearchListService(map));
					}
					mav.addObject("map", map);
					mav.setViewName("/shop/userShopSearch");
				} else {
					mav.setViewName("redirect:/userShopMain.do");
				}
			} else {
				mav.setViewName("redirect:/userShopMain.do");
			}
		} else {
			mav.setViewName("redirect:/userShopMain.do");
		}
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/userShopBuy.do")
	public int userShopBuy(Integer shop_id, Integer card_room, HttpSession session) throws Exception {
		int flag = service.userShopBuyService(shop_id, card_room, session);
		return flag;
	}
	
	@ResponseBody
	@RequestMapping(value = "/userShopBuyCheck.do")
	public UserShopDTO userShopBuyCheck(Integer shop_id, HttpSession session) {
		UserShopDTO usdto = new UserShopDTO();
		UserDTO userSession = (UserDTO) session.getAttribute("userInfoSession");
		if (userSession != null) {
			usdto = service.userShopCardDetailViewService(shop_id);
			if (usdto != null) {
				UserDTO udto = new UserDTO();
				CardInfoManager cim = new CardInfoManager();
				UserCardImgManager UCIM = new UserCardImgManager();
				UserImgManager UIM = new UserImgManager();
				udto = service.userShopBuyUserInfoService(userSession.getUsr_id());
				usdto.setBuy_usr_name(udto.getUsr_name());
				usdto.setBuy_usr_code(udto.getUsr_code());
				usdto.setBuy_usr_id(userSession.getUsr_id());
				usdto.setCard_type_info(cim.cardTypeInfo(usdto.getCard_type(), true));
				usdto.setCard_name_info(cim.cardNameInfo(usdto.getCard_type(), true));
				usdto.setCard_channl_info(cim.cardChannel_info(usdto.getCard_type(), usdto.getCard_level()));
				usdto.setCard_element(cim.cardElement(usdto.getCard_type(), true));
				usdto.setCard_date(cim.card_date(usdto.getCard_type(), usdto.getItm_trans_gf(), usdto.getCard_level(), true));
				usdto.setCard_img_path(UCIM.userSPCardImg(usdto.getCard_type(), usdto.getCard_level(), true));
				usdto.setCard_skill1(cim.card_skill1(usdto.getCard_skill(), usdto.getCard_level()));
				usdto.setCard_skill2(cim.card_skill2(usdto.getCard_skill()));
				usdto.setLevel_img_path(UIM.userLevelImg(usdto.getLevels()));
				if (usdto.getCard_type() > 9999) {
					int count = usdto.getCard_type() % 10000;
					usdto.setSpirit_count(count);
				}
				usdto.setBuy_usr_code(udto.getUsr_code());
				usdto.setBuy_usr_name(udto.getUsr_name());
				usdto.setBuy_usr_img_path(UIM.userLevelImg(udto.getUsr_level()));
				System.out.println("스킬 : " + usdto.getCard_skill());
				System.out.println("스킬1 : " + usdto.getCard_skill1());
				System.out.println("스킬2 : " + usdto.getCard_skill2());
			}
		} else {
			usdto = null;
		}
		return usdto;
	}
	
	@ResponseBody
	@RequestMapping(value = "/userShopExistenceCheck.do")
	public int userShopExistenceCheck(Integer shop_id) throws Exception {
		int flag = 0;
		int shopCount = service.userShopBuyCheckService(shop_id);
		if(shopCount == 1) {
			flag = 1; // 구매가능
		} else {
			flag = 0; // 샾에 존재하지 않음
		}
		
		return flag;
	}

}
