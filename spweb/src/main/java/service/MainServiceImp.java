package service;

import java.util.List;

import dao.MainDAO;
import dto.BoardDTO;
import dto.GuildRankDTO;
import dto.UserDTO;
import dto.UserRankDTO;

public class MainServiceImp implements MainService{

	private MainDAO dao;
	
	public void setDao(MainDAO dao) {
		this.dao = dao;
	}

	public MainServiceImp() {
		
	}

	@Override
	public List<UserDTO> mainUserInfoListService() {
		// TODO Auto-generated method stub
		System.out.println("mainUserInfoListService 접근");
		List<UserDTO> aList = dao.mainUserInfoListDao();
		return aList;
	}

	@Override
	public List<BoardDTO> mainUpdateBoardListService(BoardDTO boardDto) {
		// TODO Auto-generated method stub
		return dao.mainUpdateBoardList(boardDto);
	}

	@Override
	public List<BoardDTO> mainNoticeBoardListService(BoardDTO boardDto) {
		// TODO Auto-generated method stub
		return dao.mainNoticeBoardList(boardDto);
	}

	@Override
	public List<BoardDTO> mainEventBoardListService(BoardDTO boardDto) {
		// TODO Auto-generated method stub
		return dao.mainEventBoardList(boardDto);
	}

	@Override
	public List<GuildRankDTO> mainGuildTopRankList(GuildRankDTO guildRankDto) {
		// TODO Auto-generated method stub
		return dao.mainGuildTopRank(guildRankDto);
	}

	@Override
	public List<UserRankDTO> mainUserTopRankList(UserRankDTO userRankDto) {
		// TODO Auto-generated method stub
		return dao.mainUserTopRank(userRankDto);
	}

	@Override
	public UserDTO mainUserInfoService(String usr_name) {
		// TODO Auto-generated method stub
		return dao.mainUserInfo(usr_name);
	}
}
