package service;

import java.util.HashMap;
import java.util.List;

import dto.GuestBookDTO;
import dto.GuildApplicationDTO;
import dto.GuildDTO;
import dto.GuildMemberDTO;
import dto.GuildPageDTO;
import dto.GuildPositionDTO;
import dto.UserDTO;

public interface GuildService {

	public List<GuildDTO> guildList(GuildPageDTO guildPageDto);
	
	public int guildListCount();
	
	public GuildDTO guildHomeService(int guild_id);
	
	public int guildLikeCheckService(HashMap<String, Object> map);

	public void guildLikeInsertService(HashMap<String, Object> map);
	
	public void guildLikeDeleteService(HashMap<String, Object> map);
	
	public int guildTotalRankService(int guild_id);
	
	public List<GuestBookDTO> guildGuestBookListProcess(int guild_id);

	public List<GuestBookDTO> guildGuestBookInsertProcess(GuestBookDTO gdto);
	
	public List<GuestBookDTO> guildGuestBookDeleteProcess(GuestBookDTO gdto);
	
	public int guildCheckService(int guild_id);
	
	public int guildMemberCheckService(HashMap<String, Object> map);
	
	public void guildMemberDeleteService(HashMap<String, Object> map);
	
	public void guildUserDeleteService(int usr_id);
	
	public void guildMemberInsertService(HashMap<String, Object> map);
	
	public void guildUserInsertService(HashMap<String, Object> map);
	
	public int guildMemberCheckOneService(int usr_id);
	
	public int guildAppCheckOneService(int usr_id);
	
	public GuildDTO guildJoinSelectService(String guild_name);
	
	public UserDTO guildUserSetSessionService(String usr_name);
	
	public int guildIdeologyCheckService(int guild_id);
	
	public void guildAppInsertSerivce(HashMap<String, Object> map);
	
	public int guildAppGuildCheckService(int usr_id);
	
	public void guildAppDeleteService(int usr_id);
	
	public List<GuildDTO> guildSearchLMapProcess(HashMap<String, Object> map);

	public int guildSearchCountMapProcess(HashMap<String, Object> map);
	
	public List<GuestBookDTO> guildGuestBookList2Service(HashMap<String, Object> map);
	
	public int guildGuestBookCountService(HashMap<String, Object> map);
	
	public int isGuildLeaderService(HashMap<String, Object> map);
	
	public int myInformationChangeCheckService(HashMap<String, Object> map);
	
	public List<GuildApplicationDTO> guildApplicationListService(HashMap<String, Object> map);
	
	public int guildApplicationCountService(int guild_id);
	
	public GuildDTO guildInfoService(String guild_name);
	
	public List<GuildMemberDTO> guildMemberListCreateService(HashMap<String, Object> map);
	
	public int guildManagerListCountService(HashMap<String, Object> map);
	
	public void guildManagerMemberExileService(HashMap<String, Object> map);
	
	public int guildManagerAppListCountService(HashMap<String, Object> map);
	
	public int guildManagerPositionListCountService(HashMap<String, Object> map);
	
	public List<GuildApplicationDTO> guildAppListCreateService(HashMap<String, Object> map);
	
	public void guildManagerAppRefuseService(HashMap<String, Object> map);
	
	public void guildManagerAppAcceptService(HashMap<String, Object> map);
	
	public GuildApplicationDTO guildAppInfoService(int gapplication_id);
	
	public GuildMemberDTO guildMemberInfoService(int gmember_id);
	
	public List<GuildPositionDTO> guildPositionListCreateService(HashMap<String, Object> map);
	
	public GuildPositionDTO guildPositionInfoService(int gposition_id);
	
	public GuildPositionDTO guildUserPositionInfoService(HashMap<String, Object> map);
	
	public GuildMemberDTO guildUserMemberInfoService(int usr_id);
	
	
}
