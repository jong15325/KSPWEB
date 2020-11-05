package dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import dto.MessageDTO;
import dto.MessagePageDTO;

public class MyMessageDaoImp implements MyMessageDAO{
	
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	public MyMessageDaoImp() {
		
	}

	@Override
	public List<MessageDTO> myMessageBoxList(MessagePageDTO messagePageDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("message.inBox", messagePageDto);
	}

	@Override
	public int myMessageBoxCount(String username) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("message.inBoxCount", username);
	}

	@Override
	public void myMessageBoxDelete(int num) {
		// TODO Auto-generated method stub
		sqlSession.delete("message.messageDelete", num);
	}

	@Override
	public int myMessageUnreadCount(String username) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("message.inBoxUnreadCount", username);
	}

	@Override
	public int myMessageDeleteCount(String username) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("message.inboxDeleteCount", username);
	}

	@Override
	public int myMessageSendCount(String sender) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("message.inboxSendCount", sender);
	}

	@Override
	public MessageDTO myMessageBoxView(int messageValue) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("message.inBoxView", messageValue);
	}

	@Override
	public List<MessageDTO> mySendMessageBoxList(MessagePageDTO messagePageDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("message.inBoxSend", messagePageDto);
	}

	@Override
	public int mySendMessageBoxCount(String sender) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("message.inBoxSendCount", sender);
	}

	@Override
	public List<MessageDTO> myMessageSearchMap(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("message.inboxSearch", map);
	}

	@Override
	public int myMessageSearchCountMap(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("message.inboxSearchCount", map);
	}

	@Override
	public List<MessageDTO> mySendMessageSearchMap(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("message.inboxSendSearch", map);
	}

	@Override
	public int mySendMessageSearchCountMap(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("message.inboxSendSearchCount", map);
	}

	@Override
	public int userNameCount(String usr_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("user.userNameCount", usr_name);
	}

	@Override
	public void mySendMessageInsert(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		sqlSession.insert("message.insertMessage", map);
	}

	@Override
	public void myReadMessageUpdate(int num) {
		// TODO Auto-generated method stub
		sqlSession.update("message.readMessage", num);
	}

	@Override
	public MessageDTO myPreviousMessage(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("message.previousMessageTime", map);
	}

	
}
