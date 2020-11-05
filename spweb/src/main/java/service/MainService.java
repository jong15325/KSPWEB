package service;

import java.util.List;

import dto.BoardDTO;
import dto.GuildRankDTO;
import dto.UserDTO;
import dto.UserRankDTO;

public interface MainService {

	public List<UserDTO> mainUserInfoListService();

	public List<BoardDTO> mainUpdateBoardListService(BoardDTO boardDto);

	public List<BoardDTO> mainNoticeBoardListService(BoardDTO boardDto);

	public List<BoardDTO> mainEventBoardListService(BoardDTO boardDto);
	
	public List<GuildRankDTO> mainGuildTopRankList(GuildRankDTO guildRankDto);
	
	public List<UserRankDTO> mainUserTopRankList(UserRankDTO userRankDto);
	
	public UserDTO mainUserInfoService(String usr_name);
}
