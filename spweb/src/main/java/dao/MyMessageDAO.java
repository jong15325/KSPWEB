package dao;

import java.util.HashMap;
import java.util.List;

import dto.MessageDTO;
import dto.MessagePageDTO;

public interface MyMessageDAO {

	public List<MessageDTO> myMessageBoxList(MessagePageDTO messagePageDto);
	
	public int myMessageBoxCount(String username);
	
	public void myMessageBoxDelete(int num);
	
	public int myMessageUnreadCount(String username);
	
	public int myMessageDeleteCount(String username);
	
	public int myMessageSendCount(String sender);
	
	public MessageDTO myMessageBoxView(int messageValue);
	
	public List<MessageDTO> mySendMessageBoxList(MessagePageDTO messagePageDto);
	
	public int mySendMessageBoxCount(String sender);
	
	public List<MessageDTO> myMessageSearchMap(HashMap<String, Object> map);

	public int myMessageSearchCountMap(HashMap<String, Object> map);
	
	public List<MessageDTO> mySendMessageSearchMap(HashMap<String, Object> map);

	public int mySendMessageSearchCountMap(HashMap<String, Object> map);
	
	public int userNameCount(String usr_name);
	
	public void mySendMessageInsert(HashMap<String, Object> map);
	
	public void myReadMessageUpdate(int num);
	
	public MessageDTO myPreviousMessage(HashMap<String, Object> map);
	
}
