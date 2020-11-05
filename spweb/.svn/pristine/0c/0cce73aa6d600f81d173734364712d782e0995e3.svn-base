package service;

import java.util.HashMap;
import java.util.List;

import dto.MessageDTO;
import dto.MessagePageDTO;

public interface MyMessageService {

	public List<MessageDTO> myMessageBoxListService(MessagePageDTO messagePageDto, String username);
	
	public int myMessageBoxCountService(String username);
	
	public void myMessageBoxDeleteService(int num);
	
	public int myMessageUnreadCountService(String username);
	
	public int myMessageDeleteCountService(String username);
	
	public int myMessageSendCountService(String sender);
	
	public MessageDTO myMessageBoxViewService(int messageValue);
	
	public List<MessageDTO> mySendMessageBoxListService(MessagePageDTO messagePageDto, String sender);
	
	public int mySendMessageBoxCountService(String sender);
	
	public List<MessageDTO> myMessageSearchLMapProcess(MessagePageDTO messagePageDto, HashMap<String, Object> map);

	public int myMessageSearchCountMapProcess(HashMap<String, Object> map);
	
	public List<MessageDTO> mySendMessageSearchLMapProcess(MessagePageDTO messagePageDto, HashMap<String, Object> map);

	public int mySendMessageSearchCountMapProcess(HashMap<String, Object> map);
	
	public int userNameCountService(String usr_name);
	
	public void mySendMessageInsertService(HashMap<String, Object> map);
	
	public void myReadMessageUpdateService(int num);
	
	public MessageDTO myPreviousMessageService(HashMap<String, Object> map);
	
}
