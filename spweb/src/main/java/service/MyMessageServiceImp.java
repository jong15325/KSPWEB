package service;

import java.util.HashMap;
import java.util.List;

import dao.MyMessageDAO;
import dto.MessageDTO;
import dto.MessagePageDTO;

public class MyMessageServiceImp implements MyMessageService {

	private MyMessageDAO dao;

	public void setDao(MyMessageDAO dao) {
		this.dao = dao;
	}

	public MyMessageServiceImp() {

	}

	@Override
	public List<MessageDTO> myMessageBoxListService(MessagePageDTO messagePageDto, String username) {
		// TODO Auto-generated method stub
		messagePageDto.setUsername(username);
		List<MessageDTO> aList = dao.myMessageBoxList(messagePageDto);
		return aList;
	}

	@Override
	public int myMessageBoxCountService(String username) {
		// TODO Auto-generated method stub
		return dao.myMessageBoxCount(username);
	}

	@Override
	public void myMessageBoxDeleteService(int num) {
		// TODO Auto-generated method stub
		dao.myMessageBoxDelete(num);
	}

	@Override
	public int myMessageUnreadCountService(String username) {
		// TODO Auto-generated method stub
		return dao.myMessageUnreadCount(username);
	}

	@Override
	public int myMessageDeleteCountService(String username) {
		// TODO Auto-generated method stub
		return dao.myMessageDeleteCount(username);
	}

	@Override
	public int myMessageSendCountService(String sender) {
		// TODO Auto-generated method stub
		return dao.myMessageSendCount(sender);
	}

	@Override
	public MessageDTO myMessageBoxViewService(int messageValue) {
		// TODO Auto-generated method stub
		return dao.myMessageBoxView(messageValue);
	}

	@Override
	public List<MessageDTO> mySendMessageBoxListService(MessagePageDTO messagePageDto, String sender) {
		// TODO Auto-generated method stub
		messagePageDto.setSender(sender);
		List<MessageDTO> aList = dao.mySendMessageBoxList(messagePageDto);
		return aList;
	}

	@Override
	public int mySendMessageBoxCountService(String sender) {
		// TODO Auto-generated method stub
		return dao.myMessageSendCount(sender);
	}

	@Override
	public List<MessageDTO> myMessageSearchLMapProcess(MessagePageDTO messagePageDto, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		String username = (String) map.get("username");
		System.out.println("username Search Service : "+username);
		messagePageDto.setUsername(username);
		List<MessageDTO> aList = dao.myMessageSearchMap(map);
		return aList;
	}

	@Override
	public int myMessageSearchCountMapProcess(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.myMessageSearchCountMap(map);
	}

	@Override
	public List<MessageDTO> mySendMessageSearchLMapProcess(MessagePageDTO messagePageDto, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		String sender = (String) map.get("sender");
		System.out.println("sender Search Service : "+sender);
		messagePageDto.setUsername(sender);
		List<MessageDTO> aList = dao.mySendMessageSearchMap(map);
		return aList;
	}

	@Override
	public int mySendMessageSearchCountMapProcess(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.mySendMessageSearchCountMap(map);
	}

	@Override
	public int userNameCountService(String usr_name) {
		// TODO Auto-generated method stub
		return dao.userNameCount(usr_name);
	}

	@Override
	public void mySendMessageInsertService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		dao.mySendMessageInsert(map);
	}

	@Override
	public void myReadMessageUpdateService(int num) {
		// TODO Auto-generated method stub
		dao.myReadMessageUpdate(num);
	}

	@Override
	public MessageDTO myPreviousMessageService(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.myPreviousMessage(map);
	}

}
