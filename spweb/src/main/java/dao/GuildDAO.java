package dao;

import java.util.HashMap;
import java.util.List;

import dto.GuestBookDTO;
import dto.GuildApplicationDTO;
import dto.GuildDTO;
import dto.GuildMemberDTO;
import dto.GuildPageDTO;
import dto.GuildPositionDTO;
import dto.UserDTO;

public interface GuildDAO {

	public List<GuildDTO> guildList(GuildPageDTO guildPageDto);
	
	public int guildListTotalCount();
	
	public GuildDTO guildHome(int guild_id);

	public int guildLikeCheck(HashMap<String, Object> map);
	
	public void guildLikeInsert(HashMap<String, Object> map);
	
	public void guildLikeDelete(HashMap<String, Object> map);
	
	public int guildLikeCount(int guild_id);
	
	public int guildMemberCount(int guild_id);
	
	public int guildTotalRank(int guild_id);
	
	public int guildPointCheck(int guild_id);
	
	public List<GuestBookDTO> guildGuestBookList(int guild_id);
	
	public void guildGuestBookInsert(GuestBookDTO gdto);
	
	public void guildGuestBookDelete(GuestBookDTO gdto);
	
	public int guildCheck(int guild_id);
	
	public int guildMemberCheck(HashMap<String, Object> map);
	
	public void guildMemberDelete(HashMap<String, Object> map);
	
	public void guildUserDelete(int usr_id);
	
	public void guildMemberInsert(HashMap<String, Object> map);
	
	public void guildUserInsert(HashMap<String, Object> map);
	
	public int guildMemberCheckOne(int usr_id);
	
	public int guildAppCheckOne(int usr_id);
	
	public GuildDTO guildJoinSelect(String guild_name);
	
	public UserDTO guildUserSetSession(String usr_name);
	
	public int guildIdeologyCheck(int guild_id);
	
	public void guildAppInsert(HashMap<String, Object> map);
	
	public int guildAppGuildCheck(int usr_id);
	
	public void guildAppDelete(int usr_id);
	
	public int guildAppGuildCheckOne(int usr_id);
	
	public List<GuildDTO> guildSearchMap(HashMap<String, Object> map);

	public int guildSearchCountMap(HashMap<String, Object> map);
	
	public List<GuestBookDTO> guildGuestBookList2(HashMap<String, Object> map);
	
	public int guildHomeUserChar(String usr_name);
	
	public int guildGuestBookCount(HashMap<String, Object> map);
	
	public int isGuildLeader(HashMap<String, Object> map);
	
	public int myInformationChangeCheck(HashMap<String, Object> map);
	
	public List<GuildApplicationDTO> guildApplicationList(HashMap<String, Object> map);
	
	public int guildApplicationCount(int guild_id);
	
	public GuildDTO guildInfo(String guild_name);
	
	public List<GuildMemberDTO> guildMemberListCreate(HashMap<String, Object> map);
	
	public List<GuildApplicationDTO> guildAppListCreate(HashMap<String, Object> map);
	
	public List<GuildPositionDTO> guildPositionListCreate(HashMap<String, Object> map);
	
	public int guildManagerListCount(HashMap<String, Object> map);
	
	public void guildManagerMemberExile(HashMap<String, Object> map);
	
	public int guildManagerAppListCount(HashMap<String, Object> map);
	
	public int guildManagerPositionListCount(HashMap<String, Object> map);
	
	public void guildManagerAppRefuse(HashMap<String, Object> map);
	
	public void guildManagerAppAccept(HashMap<String, Object> map);
	
	public GuildApplicationDTO guildAppInfo(int gapplication_id);
	
	public GuildMemberDTO guildMemberInfo(int gmember_id);
	
	public GuildPositionDTO guildPositionInfo(int gposition_id);
	
	public GuildPositionDTO guildUserPositionInfo(HashMap<String, Object> map);
	
	public GuildMemberDTO guildUserMemberInfo(int usr_id);
	
}
