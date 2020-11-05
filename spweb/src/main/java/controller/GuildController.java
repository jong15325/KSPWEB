package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import api.GuildManager;
import api.LoginManager;
import api.UserImgManager;
import dto.GuestBookDTO;
import dto.GuildApplicationDTO;
import dto.GuildApplicationPageDTO;
import dto.GuildDTO;
import dto.GuildMemberDTO;
import dto.GuildPageDTO;
import dto.GuildPositionDTO;
import dto.UserDTO;
import service.GuildService;

@Controller
public class GuildController {

	private GuildService service;
	private int currentPage;
	private GuildPageDTO pdto;
	private GuildApplicationPageDTO apdto;
	LoginManager loginManager = LoginManager.getInstance();
	GuildManager guildManager = GuildManager.getInstance();

	public void setService(GuildService service) {
		this.service = service;
	}

	public GuildController() {

	}

	@RequestMapping(value = "/guildList.do")
	public ModelAndView guildList(GuildDTO guildDto, GuildPageDTO guildPageDto) {
		System.out.println("길드 리스트 접근.");
		ModelAndView mav = new ModelAndView();
		int totalRecord = service.guildListCount();
		if (totalRecord >= 1) {
			if (guildPageDto.getCurrentPage() == 0)
				currentPage = 1;
			else {
				currentPage = guildPageDto.getCurrentPage();
				if (currentPage < 0) {
					currentPage = -(currentPage);
					System.out.println("currentPage : " + currentPage);
				}
			}
			System.out.println("currentPage : " + currentPage);
			pdto = new GuildPageDTO(currentPage, totalRecord);
			System.out.println("총 페이지 수 : " + pdto.getTotalPage());
			System.out.println("총 레코드 수 : " + pdto.getTotalCount());
			System.out.println("시작 레코드 번호 : " + pdto.getStartRow());
			System.out.println("끝 레코드 번호 : " + pdto.getEndRow());
			System.out.println("시작 페이지 번호 : " + pdto.getStartPage());
			System.out.println("끝 페이지 번호 : " + pdto.getEndPage());
			mav.addObject("guildPageDto", pdto);
			mav.addObject("aList", service.guildList(pdto));
		}

		mav.setViewName("/guild/guildList");
		return mav;
	}

	@RequestMapping(value = "/guildHome.do")
	public ModelAndView guildHome(int guild_id, int usr_id) {
		System.out.println("길드 홈 접근.");
		ModelAndView mav = new ModelAndView();
		mav.addObject("guildHomeView", service.guildHomeService(guild_id));
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usr_id", usr_id);
		map.put("guild_id", guild_id);
		System.out.println("guild_id : " + guild_id);
		System.out.println("usr_id : " + usr_id);
		mav.addObject("guildHomeLike", service.guildLikeCheckService(map));
		mav.addObject("guildTotalRank", service.guildTotalRankService(guild_id));
		// mav.addObject("guildHomeGuestBook",
		// service.guildGuestBookListProcess(guild_id));
		mav.addObject("guildApplication", service.guildAppGuildCheckService(usr_id));
		if (currentPage == 0) {
			currentPage = 1;
		}
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/guild/guildHome");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/guildLike.do")
	public int guildLike(int usr_id, String usr_name, int guild_id, String guild_name, int like_type) {
		System.out.println("길드 좋아요 접근.");
		System.out.println("article_no : " + usr_id);
		System.out.println("usr_name : " + usr_name);
		System.out.println("guild_id : " + guild_id);
		System.out.println("guild_name : " + guild_name);
		System.out.println("like_type : " + like_type);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usr_id", usr_id);
		map.put("guild_id", guild_id);
		int checkFlag = service.guildLikeCheckService(map);
		int successFlag = 0;
		if (checkFlag == 0) {
			map.put("usr_name", usr_name);
			map.put("guild_name", guild_name);
			map.put("like_type", like_type);
			service.guildLikeInsertService(map);
			successFlag = 1;
		} else if (checkFlag == 1) {
			service.guildLikeDeleteService(map);
			successFlag = 2;
		}
		return successFlag;
	}

	@RequestMapping(value = "/guildGuestBookListProcess.do", method = RequestMethod.POST)
	public @ResponseBody List<GuestBookDTO> guildGuestBookList(GuestBookDTO gdto, int type_id, int viewLastNum,
			int viewLimitNum) {
		System.out.println("방명록 리스트 프로세스 접근");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", viewLastNum);
		map.put("type_id", type_id);
		viewLimitNum = service.guildGuestBookCountService(map); // 전체가져오기
		map.put("lastRow", viewLimitNum);
		return service.guildGuestBookList2Service(map);
	}

	@RequestMapping(value = "/guildGuestBookInsertProcess.do", method = RequestMethod.POST)
	public @ResponseBody List<GuestBookDTO> guildGuestBookInsertProcess(GuestBookDTO gdto) {
		System.out.println("방명록 등록 프로세스 접근");
		return service.guildGuestBookInsertProcess(gdto);
	}

	@RequestMapping(value = "/guildGuestBookDeleteProcess.do", method = RequestMethod.POST)
	public @ResponseBody List<GuestBookDTO> guildGuestBookDelete(GuestBookDTO gdto) {
		System.out.println("방명록 삭제 프로세스 접근");
		return service.guildGuestBookDeleteProcess(gdto);
	}

	@RequestMapping(value = "/memberListCreate.do", method = RequestMethod.POST)
	public @ResponseBody List<GuildMemberDTO> memberListCreate(HttpSession session, GuildMemberDTO gmdto,
			int memberNowNum, int limitCount) {
		System.out.println("길드 멤버 리스트 프로세스 접근");
		HashMap<String, Object> map = new HashMap<String, Object>();
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		GuildDTO gdto = service.guildInfoService(udto.getUsr_guildname());
		map.put("startRow", memberNowNum);
		map.put("blockCount", limitCount);
		map.put("guild_id", gdto.getGuild_id());
		map.put("usr_id", udto.getUsr_id());
		System.out.println(" gdto.getGuild_id() : " + gdto.getGuild_id());
		System.out.println(" udto.getUsr_id() : " + udto.getUsr_id());

		return service.guildMemberListCreateService(map);
	}

	@RequestMapping(value = "/appListCreate.do", method = RequestMethod.POST)
	public @ResponseBody List<GuildApplicationDTO> appListCreate(HttpSession session, GuildApplicationDTO gadto,
			int appNowNum, int limitCount) {
		System.out.println("길드 신청자 리스트 프로세스 접근");
		HashMap<String, Object> map = new HashMap<String, Object>();
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		GuildDTO gdto = service.guildInfoService(udto.getUsr_guildname());
		map.put("startRow", appNowNum);
		map.put("blockCount", limitCount);
		map.put("guild_id", gdto.getGuild_id());
		map.put("usr_id", udto.getUsr_id());
		System.out.println(" gdto.getGuild_id() : " + gdto.getGuild_id());
		System.out.println(" udto.getUsr_id() : " + udto.getUsr_id());

		return service.guildAppListCreateService(map);
	}

	@RequestMapping(value = "/positionListCreate.do", method = RequestMethod.POST)
	public @ResponseBody List<GuildPositionDTO> positionListCreate(HttpSession session, GuildPositionDTO gpdto,
			int positionNowNum, int limitCount) {
		System.out.println("길드 직책 리스트 프로세스 접근");
		HashMap<String, Object> map = new HashMap<String, Object>();
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		GuildDTO gdto = service.guildInfoService(udto.getUsr_guildname());
		map.put("startRow", positionNowNum);
		map.put("blockCount", limitCount);
		map.put("guild_id", gdto.getGuild_id());
		System.out.println(" gdto.getGuild_id() : " + gdto.getGuild_id());

		return service.guildPositionListCreateService(map);
	}

	@RequestMapping(value = "/guildManagerListCount.do", method = RequestMethod.POST)
	public @ResponseBody int guildManagerListCount(HttpSession session, int listType) {
		int listCount = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		GuildDTO gdto = service.guildInfoService(udto.getUsr_guildname());
		if (listType == 1) {
			// 멤버리스트
			map.put("guild_id", gdto.getGuild_id());
			map.put("usr_id", udto.getUsr_id());
			listCount = service.guildManagerListCountService(map);
		} else if (listType == 2) {
			// 신청자리스트
			map.put("guild_id", gdto.getGuild_id());
			listCount = service.guildManagerAppListCountService(map);
		} else if (listType == 3) {
			// 직책리스트
			map.put("guild_id", gdto.getGuild_id());
			listCount = service.guildManagerPositionListCountService(map);
		}
		return listCount;
	}

	/*
	 * @RequestMapping(value = "/guildApplicationListProcess.do", method =
	 * RequestMethod.POST) public @ResponseBody List<GuestBookDTO>
	 * guildApplicationList(GuildApplicationDTO gdto, GuildApplicationPageDTO gpdto,
	 * int guild_id){ System.out.println("신청자 리스트 프로세스 접근"); HashMap<String, Object>
	 * map = new HashMap<String, Object>(); map.put("guild_id", guild_id);
	 * map.put("startRow", gpdto.getStartRow()); map.put("blockCount",
	 * gpdto.getBlockCount()); int totalRecord =
	 * service.guildApplicationCountService(guild_id); if (totalRecord >= 1) { if
	 * (gpdto.getCurrentPage() == 0) currentPage = 1; else { currentPage =
	 * gpdto.getCurrentPage(); if (currentPage < 0) { currentPage = -(currentPage);
	 * System.out.println("currentPage : " + currentPage); } }
	 * System.out.println("currentPage : " + currentPage); pdto = new
	 * GuildPageDTO(currentPage, totalRecord); System.out.println("총 페이지 수 : " +
	 * pdto.getTotalPage()); System.out.println("총 레코드 수 : " +
	 * pdto.getTotalCount()); System.out.println("시작 레코드 번호 : " +
	 * pdto.getStartRow()); System.out.println("끝 레코드 번호 : " + pdto.getEndRow());
	 * System.out.println("시작 페이지 번호 : " + pdto.getStartPage());
	 * System.out.println("끝 페이지 번호 : " + pdto.getEndPage());
	 * mav.addObject("guildAppPageDto", pdto); mav.addObject("aList",
	 * service.guildList(pdto)); }
	 * 
	 * 
	 * 
	 * return service.guildGuestBookList2Service(map); }
	 */

	@ResponseBody
	@RequestMapping(value = "/guildSecession.do")
	public int guildSecession(int usr_id, String usr_name, int guild_id, String guild_name, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usr_id", usr_id);
		map.put("guild_id", guild_id);
		System.out.println("usr_id : " + usr_id);
		System.out.println("guild_id : " + guild_id);
		System.out.println("길드탈퇴 프로세스 접근");
		int guildCheckFlag = service.guildCheckService(guild_id);
		int successFlag = 0;
		if (guildCheckFlag == 0) {
			System.out.println("존재X");
			successFlag = 1; // 존재X
		} else {
			int memberCheckFlag = service.guildMemberCheckService(map);
			if (memberCheckFlag == 0) {
				System.out.println("멤버X");
				successFlag = 2; // 멤버아님
			} else {
				HashMap<String, Object> map2 = new HashMap<String, Object>();
				map2.put("usr_name", usr_name);
				map2.put("guild_id", guild_id);
				int isLeader = service.isGuildLeaderService(map2);
				if (isLeader == 1) {
					successFlag = 4; // ok
				} else {
					System.out.println("ok");
					session.removeAttribute("userInfoSession");
					session.removeAttribute("userGuildInfoSession");
					String guildNuser = guild_name + "/" + usr_name;
					guildManager.removeGuildSession(guildNuser);
					guildManager.printGuildUsers();
					service.guildMemberDeleteService(map);
					service.guildUserDeleteService(usr_id);
					UserDTO userDto = service.guildUserSetSessionService(usr_name);
					session.setAttribute("userInfoSession", userDto);
					loginManager.printLoginUsers();
					successFlag = 3; // ok
				}
			}
		}
		return successFlag;
	}

	@ResponseBody
	@RequestMapping(value = "/guildJoin.do")
	public int guildJoin(int usr_id, String usr_name, int guild_id, String guild_name, HttpSession session) {
		System.out.println("길드가입 프로세스 접근");
		int guildCheckFlag = service.guildCheckService(guild_id);
		int successFlag = 0;
		if (guildCheckFlag == 0) {
			System.out.println("존재X");
			successFlag = 1;
		} else {
			int memberCheckFlag = service.guildMemberCheckOneService(usr_id);
			if (memberCheckFlag == 1) {
				System.out.println("이미 가입한 곳 있음.");
				successFlag = 2;
			} else {
				int guildAppCheckFlag = service.guildAppCheckOneService(usr_id);
				if (guildAppCheckFlag == 1) {
					System.out.println("이미 신청한 곳 있음.");
					successFlag = 3;
				} else {
					int ideologyFlag = service.guildIdeologyCheckService(guild_id);
					if (ideologyFlag == 0) { // 자유가입
						HashMap<String, Object> map = new HashMap<String, Object>();
						HashMap<String, Object> map2 = new HashMap<String, Object>();
						map.put("usr_id", usr_id);
						map.put("usr_name", usr_name);
						map.put("guild_id", guild_id);
						map.put("guild_name", guild_name);
						map2.put("usr_id", usr_id);
						map2.put("guild_name", guild_name);
						service.guildMemberInsertService(map);
						service.guildUserInsertService(map);
						session.removeAttribute("userInfoSession");
						session.removeAttribute("userGuildInfoSession");
						GuildDTO guildDto = service.guildJoinSelectService(guild_name);
						session.setAttribute("userGuildInfoSession", guildDto);
						String guildNuser = guild_name + "/" + usr_name;
						guildManager.setSession(session, guildNuser);
						guildManager.printGuildUsers();
						UserDTO userDto = service.guildUserSetSessionService(usr_name);
						session.setAttribute("userInfoSession", userDto);
						loginManager.printLoginUsers();
						successFlag = 4; // ok
					} else if (ideologyFlag == 1) { // 가입제한
						HashMap<String, Object> map = new HashMap<String, Object>();
						map.put("usr_id", usr_id);
						map.put("usr_name", usr_name);
						map.put("guild_id", guild_id);
						service.guildAppInsertSerivce(map);
						successFlag = 5; // ok
					}
				}
			}
		}
		return successFlag;
	}

	@ResponseBody
	@RequestMapping(value = "/guildAppDelete.do")
	public int guildAppDelete(int usr_id, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usr_id", usr_id);
		System.out.println("usr_id : " + usr_id);
		System.out.println("신청 취소 프로세스 접근");
		int successFlag = 0;
		int appCheckFlag = service.guildAppCheckOneService(usr_id);
		if (appCheckFlag == 0) {
			System.out.println("신청한 적 없음");
			successFlag = 1; // 멤버아님
		} else {
			System.out.println("ok");
			service.guildAppDeleteService(usr_id);
			successFlag = 2; // ok
		}

		return successFlag;
	}

	@RequestMapping(value = "/guildSearch.do")
	public ModelAndView freeBoardSearch(String option, String keyword, GuildPageDTO guildPageDto) throws IOException {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("option", option);
		map.put("keyword", keyword);
		int totalRecord = service.guildSearchCountMapProcess(map);
		if (totalRecord >= 1) {
			if (guildPageDto.getCurrentPage() == 0)
				currentPage = 1;
			else {
				currentPage = guildPageDto.getCurrentPage();
				if (currentPage < 0) {
					currentPage = -(currentPage);
					System.out.println("currentPage : " + currentPage);
				}

			}
			System.out.println("currentPage : " + currentPage);
			pdto = new GuildPageDTO(currentPage, totalRecord);
			System.out.println("총 페이지 수 : " + pdto.getTotalPage());
			System.out.println("총 레코드 수 : " + pdto.getTotalCount());
			System.out.println("시작 레코드 번호 : " + pdto.getStartRow());
			System.out.println("끝 레코드 번호 : " + pdto.getEndRow());
			System.out.println("시작 페이지 번호 : " + pdto.getStartPage());
			System.out.println("끝 페이지 번호 : " + pdto.getEndPage());
			map.put("startRow", pdto.getStartRow());
			map.put("blockCount", pdto.getBlockCount());
			mav.addObject("guildPageDto", pdto);
			mav.addObject("map", map);
			mav.addObject("aList", service.guildSearchLMapProcess(map));
		}
		mav.setViewName("/guild/guildSearch");
		return mav;
	}

	@RequestMapping(value = "/guildChangeCheck.do")
	public ModelAndView myInformationChangeCheck(HttpSession session) {
		System.out.println("내 길드 관리 체크 페이지 접근.");
		ModelAndView mav = new ModelAndView();
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		if (udto != null) {
			UserImgManager UIM = new UserImgManager();
			mav.addObject("userDTO", udto);
			mav.addObject("myInfoCharImg", UIM.userMainCharacterImg(udto.getUsr_char()));
			mav.setViewName("/guild/guildChangeCheck");
		} else {
			mav.setViewName("/user/userLogin");
		}

		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/guildPasswordCheck.do")
	public int myInfoPasswordCheck(HttpSession session, String changeusr_name, String changePassword) {
		System.out.println("내 길드 관리 체크 프로세스 접근.");
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int successFlag = 0;
		if (udto != null) {
			if (changePassword != "") {
				map.put("usr_name", changeusr_name);
				map.put("usr_pw", changePassword);
				int checkFlag = service.myInformationChangeCheckService(map);
				if (checkFlag == 1) {
					successFlag = 1; // 일치O
				} else {
					successFlag = 2; // 일치X
				}
			} else {
				successFlag = 3; // 입력X
			}
		} else {
			successFlag = 0;
		}

		return successFlag;
	}

	@RequestMapping(value = "/guildInfoChange.do")
	public ModelAndView guildInfoChange(HttpSession session, GuildApplicationPageDTO guildAppPageDto) {
		System.out.println("내 길드 관리 페이지 접근.");
		ModelAndView mav = new ModelAndView();
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		if (udto != null) {
			GuildDTO gdto = service.guildInfoService(udto.getUsr_guildname());
			if (gdto != null) {
				HashMap<String, Object> map2 = new HashMap<String, Object>();
				map2.put("usr_name", udto.getUsr_name());
				map2.put("guild_id", gdto.getGuild_id());
				int isLeader = service.isGuildLeaderService(map2);
				if (isLeader == 0) {
					mav.setViewName("/user/userLogin");
				} else {
					UserImgManager UIM = new UserImgManager();
					mav.addObject("userDTO", udto);
					mav.addObject("myInfoCharImg", UIM.userMainCharacterImg(udto.getUsr_char()));
					mav.setViewName("/guild/guildManager");
					int totalRecord = service.guildApplicationCountService(gdto.getGuild_id());
					if (totalRecord >= 1) {
						if (guildAppPageDto.getCurrentPage() == 0)
							currentPage = 1;
						else {
							currentPage = guildAppPageDto.getCurrentPage();
							if (currentPage < 0) {
								currentPage = -(currentPage);
								System.out.println("currentPage : " + currentPage);
							}
						}
						apdto = new GuildApplicationPageDTO(currentPage, totalRecord);
						HashMap<String, Object> map = new HashMap<String, Object>();
						map.put("startRow", apdto.getStartRow());
						map.put("blockCount", apdto.getBlockCount());
						map.put("guild_id", gdto.getGuild_id());
						mav.addObject("guildAppPageDto", apdto);
						mav.addObject("aList", service.guildApplicationListService(map));
					}
				}
			} else {
				mav.setViewName("/user/userLogin");
			}
		} else {
			mav.setViewName("/user/userLogin");
		}
		return mav;

	}

	@ResponseBody
	@RequestMapping(value = "/guildManagerMemberExile.do")
	public int guildManagerMemberExile(HttpSession session, String member_no) {
		System.out.println("멤버 추방 프로세스 접근.");
		System.out.println("article_no : " + member_no);
		int successFlag = 0;
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		if (udto != null) {
			GuildDTO gdto = service.guildInfoService(udto.getUsr_guildname());
			if (gdto != null) {
				String[] checkDeleteNo = member_no.split(",");
				for (int i = 0; i < checkDeleteNo.length; i++) {
					GuildMemberDTO gmdto = service.guildMemberInfoService(Integer.parseInt(checkDeleteNo[i]));
					if (gmdto != null) {
						HashMap<String, Object> map = new HashMap<String, Object>();
						map.put("gmember_id", Integer.parseInt(checkDeleteNo[i]));
						map.put("guild_id", gdto.getGuild_id());
						service.guildManagerMemberExileService(map);
						service.guildUserDeleteService(gmdto.getUsr_id());
					} else {
						successFlag = 0;
					}
				}
				successFlag = 1;
			} else {
				successFlag = 0;
			}
		} else {
			successFlag = 0;
		}
		return successFlag;
	}

	@ResponseBody
	@RequestMapping(value = "/guildManagerAppAccept.do")
	public int guildManagerAppAccept(HttpSession session, String app_no) {
		System.out.println("신청자 수락 프로세스 접근.");
		System.out.println("article_no : " + app_no);
		int successFlag = 0;
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		if (udto != null) {
			GuildDTO gdto = service.guildInfoService(udto.getUsr_guildname());
			if (gdto != null) {
				String[] checkDeleteNo = app_no.split(",");
				for (int i = 0; i < checkDeleteNo.length; i++) {
					GuildApplicationDTO gadto = service.guildAppInfoService(Integer.parseInt(checkDeleteNo[i]));
					if (gadto != null) {
						HashMap<String, Object> map = new HashMap<String, Object>();
						HashMap<String, Object> map2 = new HashMap<String, Object>();
						HashMap<String, Object> map3 = new HashMap<String, Object>();
						map.put("gapplication_id", Integer.parseInt(checkDeleteNo[i]));
						map.put("guild_id", gdto.getGuild_id());
						map2.put("guild_name", gdto.getGuild_name());
						map2.put("usr_id", gadto.getUsr_id());
						map3.put("usr_id", gadto.getUsr_id());
						map3.put("usr_name", gadto.getUsr_name());
						map3.put("guild_id", gdto.getGuild_id());
						map3.put("guild_name", gdto.getGuild_name());
						service.guildManagerAppAcceptService(map);
						service.guildUserInsertService(map2);
						service.guildMemberInsertService(map3);
					} else {
						successFlag = 0;
					}
				}
				successFlag = 1;
			} else {
				successFlag = 0;
			}
		} else {
			successFlag = 0;
		}
		return successFlag;
	}

	@ResponseBody
	@RequestMapping(value = "/guildManagerAppRefuse.do")
	public int guildManagerAppRefuse(HttpSession session, String app_no) {
		System.out.println("신청자 거절 프로세스 접근.");
		System.out.println("article_no : " + app_no);
		int successFlag = 0;
		UserDTO udto = (UserDTO) session.getAttribute("userInfoSession");
		if (udto != null) {
			GuildDTO gdto = service.guildInfoService(udto.getUsr_guildname());
			if (gdto != null) {
				String[] checkDeleteNo = app_no.split(",");
				for (int i = 0; i < checkDeleteNo.length; i++) {
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("gapplication_id", Integer.parseInt(checkDeleteNo[i]));
					map.put("guild_id", gdto.getGuild_id());
					service.guildManagerAppRefuseService(map);
				}
				successFlag = 1;
			} else {
				successFlag = 0;
			}
		} else {
			successFlag = 0;
		}

		return successFlag;
	}

	@ResponseBody
	@RequestMapping(value = "/guildManagerAuthCheck.do")
	public int guildManagerAuthCheck(HttpSession session, int usr_id) {
		System.out.println("길드 매니저 접근 체크 프로세스 접근.");
		int successFlag = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		GuildMemberDTO gmdto = service.guildUserMemberInfoService(usr_id);
		map.put("usr_id", usr_id);
		map.put("guild_id", gmdto.getGuild_id());
		int ismember = service.guildMemberCheckService(map);
		// 길드 멤버인지 검색
		if (ismember == 1) {
			int isLeader = service.isGuildLeaderService(map);
			if (isLeader == 1) {
				// 1. 길드장일 경우 모두 패스
				successFlag = 9999;
			} else {
				// 2. 권한이 있는 경우 체크
				GuildPositionDTO gpdto = service.guildUserPositionInfoService(map);
				if (gpdto == null) {
					successFlag = 0;
				} else {
					if (gpdto.getP_member_yn().equals("Y") || gpdto.getP_app_yn().equals("Y")
							|| gpdto.getP_position_yn().equals("Y") || gpdto.getP_auth_yn().equals("Y")) {
						successFlag = 1;
					} else {
						successFlag = 0;
					}
				}
			}
		} else {
			successFlag = 0;
		}

		return successFlag;
	}

	@SuppressWarnings("unused") // 흠;;
	@ResponseBody
	@RequestMapping(value = "/guildManagerMenuAuthCheck.do")
	public int guildManagerMenuAuthCheck(HttpSession session, int menu_num, int usr_id) {
		int successFlag = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		GuildMemberDTO gmdto = service.guildUserMemberInfoService(usr_id);
		map.put("usr_id", usr_id);
		map.put("guild_id", gmdto.getGuild_id());
		int ismember = service.guildMemberCheckService(map);
		// 길드 멤버인지 검색
		if (ismember == 1) {
			if(gmdto != null) {
				if(menu_num == 1) {
					GuildPositionDTO gpdto = service.guildUserPositionInfoService(map);
					if(gpdto != null) {
						if(gpdto.getP_member_yn().equals("Y")) {
							successFlag = 1;
						}else {
							successFlag = 0;
						}
					}else {
						successFlag = 500;
					}
				} else if(menu_num == 2) {
					GuildPositionDTO gpdto = service.guildUserPositionInfoService(map);
					if(gpdto != null) {
						if(gpdto.getP_app_yn().equals("Y")) {
							successFlag = 1;
						}else {
							successFlag = 0;
						}
					}else {
						successFlag = 500;
					}
				} else if(menu_num == 3){
					GuildPositionDTO gpdto = service.guildUserPositionInfoService(map);
					if(gpdto != null) {
						if(gpdto.getP_position_yn().equals("Y")) {
							successFlag = 1;
						}else {
							successFlag = 0;
						}
					}else {
						successFlag = 500;
					}
				}
			}else {
				successFlag = 500;
			}
		}else{
			successFlag = 500;
		}
		
		return successFlag;
	}

}
