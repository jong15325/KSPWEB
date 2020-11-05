package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.BoardDTO;
import dto.GuildRankDTO;
import dto.UserDTO;
import dto.UserRankDTO;

public class MainDaoImp implements MainDAO{
	
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public MainDaoImp() {
		
	}

	@Override
	public List<UserDTO> mainUserInfoListDao() {
		// TODO Auto-generated method stub
		System.out.println("mainUserInfoListDao 접근");
		return sqlSession.selectList("main.main_user_info");
	}

	@Override
	public List<BoardDTO> mainUpdateBoardList(BoardDTO boardDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main.updateBoardList", boardDto);
	}

	@Override
	public List<BoardDTO> mainNoticeBoardList(BoardDTO boardDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main.noticeBoardList", boardDto);
	}

	@Override
	public List<BoardDTO> mainEventBoardList(BoardDTO boardDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main.eventBoardList", boardDto);
	}

	@Override
	public List<GuildRankDTO> mainGuildTopRank(GuildRankDTO guildRankDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main.guildTopRank", guildRankDto);
	}

	@Override
	public List<UserRankDTO> mainUserTopRank(UserRankDTO userRankDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("main.userTopRank", userRankDto);
	}

	@Override
	public UserDTO mainUserInfo(String usr_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("main.mainUserInfo", usr_name);
	}
	
	
}
