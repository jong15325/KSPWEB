package dao;

import java.util.List;

import dto.BoardDTO;
import dto.GuildRankDTO;
import dto.UserDTO;
import dto.UserRankDTO;

public interface MainDAO {

	public List<UserDTO> mainUserInfoListDao();

	public List<BoardDTO> mainUpdateBoardList(BoardDTO boardDto);

	public List<BoardDTO> mainNoticeBoardList(BoardDTO boardDto);

	public List<BoardDTO> mainEventBoardList(BoardDTO boardDto);

	public List<GuildRankDTO> mainGuildTopRank(GuildRankDTO guildRankDto);
	
	public List<UserRankDTO> mainUserTopRank(UserRankDTO userRankDto);
	
	public UserDTO mainUserInfo(String usr_name);
}
