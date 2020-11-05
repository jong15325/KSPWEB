package service;

import java.util.HashMap;
import java.util.List;

import api.UserImgManager;
import dao.GuildDAO;
import dto.GuestBookDTO;
import dto.GuildApplicationDTO;
import dto.GuildDTO;
import dto.GuildMemberDTO;
import dto.GuildPageDTO;
import dto.GuildPositionDTO;
import dto.UserDTO;

public class GuildServiceImp implements GuildService{

	private GuildDAO dao;
	
	public void setDao(GuildDAO dao) {
		this.dao = dao;
	}

	public GuildServiceImp() {
		
	}

	@Override
	public List<GuildDTO> guildList(GuildPageDTO guildPageDto) {
		// TODO Auto-generated method stub
		List<GuildDTO> aList = dao.guildList(guildPageDto);
		for (GuildDTO dto : aList) {
			int pointCheck = dao.guildPointCheck(dto.getGuild_id());
			dto.setGuild_like(dao.guildLikeCount(dto.getGuild_id()));
			dto.setMember_count(dao.guildMemberCount(dto.getGuild_id()));
			int rank = 0;
			if(pointCheck == 0) {
				rank = 0;
				dto.setGuildTotalRank(rank);
			}else {
				rank = dao.guildTotalRank(dto.getGuild_id());
				dto.setGuildTotalRank(rank);
			}
		}
		return aList;
	}

	@Override
	public int guildListCount() {
		// TODO Auto-generated method stub
		return dao.guildListTotalCount();
	}

	@Override
	public GuildDTO guildHomeService(int guild_id) {
		// TODO Auto-generated method stub
		return dao.guildHome(guild_id);
	}

	@Override
	public int guildLikeCheckService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.guildLikeCheck(map);
	}

	@Override
	public void guildLikeInsertService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.guildLikeInsert(map);
	}

	@Override
	public void guildLikeDeleteService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.guildLikeDelete(map);
	}

	@Override
	public int guildTotalRankService(int guild_id) {
		// TODO Auto-generated method stub
		int rank = 0;
		int pointCheck = dao.guildPointCheck(guild_id);
		if(pointCheck == 0) {
			rank = 0;
		}else {
			rank = dao.guildTotalRank(guild_id);
		}
		return rank;
	}

	@Override
	public List<GuestBookDTO> guildGuestBookListProcess(int guild_id) {
		// TODO Auto-generated method stub
		return dao.guildGuestBookList(guild_id);
	}

	@Override
	public List<GuestBookDTO> guildGuestBookInsertProcess(GuestBookDTO gdto) {
		// TODO Auto-generated method stub
		dao.guildGuestBookInsert(gdto);
		return dao.guildGuestBookList(gdto.getType_id());
	}

	@Override
	public List<GuestBookDTO> guildGuestBookDeleteProcess(GuestBookDTO gdto) {
		// TODO Auto-generated method stub
		dao.guildGuestBookDelete(gdto);
		return dao.guildGuestBookList(gdto.getType_id());
	}

	@Override
	public int guildCheckService(int guild_id) {
		// TODO Auto-generated method stub
		return dao.guildCheck(guild_id);
	}

	@Override
	public int guildMemberCheckService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.guildMemberCheck(map);
	}

	@Override
	public void guildMemberDeleteService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.guildMemberDelete(map);
	}

	@Override
	public void guildUserDeleteService(int usr_id) {
		// TODO Auto-generated method stub
		dao.guildUserDelete(usr_id);
	}

	@Override
	public void guildMemberInsertService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.guildMemberInsert(map);
	}

	@Override
	public void guildUserInsertService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.guildUserInsert(map);
	}

	@Override
	public int guildMemberCheckOneService(int usr_id) {
		// TODO Auto-generated method stub
		return dao.guildMemberCheckOne(usr_id);
	}

	@Override
	public int guildAppCheckOneService(int usr_id) {
		// TODO Auto-generated method stub
		return dao.guildAppCheckOne(usr_id);
	}

	@Override
	public GuildDTO guildJoinSelectService(String guild_name) {
		// TODO Auto-generated method stub
		return dao.guildJoinSelect(guild_name);
	}

	@Override
	public UserDTO guildUserSetSessionService(String usr_name) {
		// TODO Auto-generated method stub
		return dao.guildUserSetSession(usr_name);
	}

	@Override
	public int guildIdeologyCheckService(int guild_id) {
		// TODO Auto-generated method stub
		return dao.guildIdeologyCheck(guild_id);
	}

	@Override
	public void guildAppInsertSerivce(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.guildAppInsert(map);
	}

	@Override
	public int guildAppGuildCheckService(int usr_id) {
		// TODO Auto-generated method stub
		int checkFlag = 0;
		int appCheckCount = dao.guildAppGuildCheckOne(usr_id);
		if(appCheckCount == 0) {
			checkFlag = 0;
		}else {
			checkFlag = dao.guildAppGuildCheck(usr_id);
		}
		return checkFlag;
	}

	@Override
	public void guildAppDeleteService(int usr_id) {
		// TODO Auto-generated method stub
		dao.guildAppDelete(usr_id);
	}

	@Override
	public List<GuildDTO> guildSearchLMapProcess(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.guildSearchMap(map);
	}

	@Override
	public int guildSearchCountMapProcess(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.guildSearchCountMap(map);
	}

	@Override
	public List<GuestBookDTO> guildGuestBookList2Service(HashMap<String, Object> map) {
		List<GuestBookDTO> aList = dao.guildGuestBookList2(map);
		for (GuestBookDTO dto : aList) {
			UserImgManager UIM  = new UserImgManager();
			dto.setGuest_profile_path(UIM.userMainCharacterImg(dao.guildHomeUserChar(dto.getGuest_writer())));
			dto.setGuest_count(dao.guildGuestBookCount(map));
		}
		return aList;
	}

	@Override
	public int guildGuestBookCountService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.guildGuestBookCount(map);
	}

	@Override
	public int isGuildLeaderService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.isGuildLeader(map);
	}

	@Override
	public int myInformationChangeCheckService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.myInformationChangeCheck(map);
	}

	@Override
	public List<GuildApplicationDTO> guildApplicationListService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<GuildApplicationDTO> aList = dao.guildApplicationList(map);
		//for (GuildApplicationDTO dto : aList) {
			//UserImgManager UIM  = new UserImgManager();
			//dto.setGuest_profile_path(UIM.userMainCharacterImg(dao.guildHomeUserChar(dto.getGuest_writer())));
			//dto.setGuest_count(dao.guildGuestBookCount(map));
		//}
		return aList;
	}

	@Override
	public int guildApplicationCountService(int guild_id) {
		// TODO Auto-generated method stub
		return dao.guildApplicationCount(guild_id);
	}

	@Override
	public GuildDTO guildInfoService(String guild_name) {
		// TODO Auto-generated method stub
		return dao.guildInfo(guild_name);
	}

	@Override
	public List<GuildMemberDTO> guildMemberListCreateService(HashMap<String, Object> map) {
		List<GuildMemberDTO> aList = dao.guildMemberListCreate(map);
		for (GuildMemberDTO dto : aList) {
			UserImgManager UIM  = new UserImgManager();
			dto.setMember_level_img(UIM.userLevelImg(dto.getUsr_level()));
		}
		return aList;
	}

	@Override
	public int guildManagerListCountService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.guildManagerListCount(map);
	}

	@Override
	public void guildManagerMemberExileService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.guildManagerMemberExile(map);
	}

	@Override
	public int guildManagerAppListCountService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.guildManagerAppListCount(map);
	}

	@Override
	public List<GuildApplicationDTO> guildAppListCreateService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<GuildApplicationDTO> aList = dao.guildAppListCreate(map);
		for (GuildApplicationDTO dto : aList) {
			UserImgManager UIM  = new UserImgManager();
			dto.setApp_level_img(UIM.userLevelImg(dto.getUsr_level()));
		}
		return aList;
	}

	@Override
	public void guildManagerAppRefuseService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.guildManagerAppRefuse(map);
	}

	@Override
	public void guildManagerAppAcceptService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.guildManagerAppAccept(map);
	}

	@Override
	public GuildApplicationDTO guildAppInfoService(int gapplication_id) {
		// TODO Auto-generated method stub
		return dao.guildAppInfo(gapplication_id);
	}

	@Override
	public GuildMemberDTO guildMemberInfoService(int gmember_id) {
		// TODO Auto-generated method stub
		return dao.guildMemberInfo(gmember_id);
	}

	@Override
	public List<GuildPositionDTO> guildPositionListCreateService(HashMap<String, Object> map) {
		List<GuildPositionDTO> aList = dao.guildPositionListCreate(map);
		return aList;
	}

	@Override
	public GuildPositionDTO guildPositionInfoService(int gposition_id) {
		// TODO Auto-generated method stub
		return dao.guildPositionInfo(gposition_id);
	}

	@Override
	public GuildPositionDTO guildUserPositionInfoService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.guildUserPositionInfo(map);
	}

	@Override
	public GuildMemberDTO guildUserMemberInfoService(int usr_id) {
		// TODO Auto-generated method stub
		return dao.guildUserMemberInfo(usr_id);
	}

	@Override
	public int guildManagerPositionListCountService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.guildManagerPositionListCount(map);
	}

}
