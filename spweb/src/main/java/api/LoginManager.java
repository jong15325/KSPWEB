package api;

import java.util.Collection;
import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import dto.UserLoginDTO;
import service.UserService;

/*
 * 20.3.15 equals를 equalsIgnoreCase로 변경*/
public class LoginManager implements HttpSessionBindingListener{

	private static LoginManager loginManager = null;
	private static Hashtable<HttpSession, String> loginUsers = new Hashtable<HttpSession, String>();
	
	private UserService service;

	public void setService(UserService service) {
		this.service = service;
	}
	
	public static synchronized LoginManager getInstance() {
		if(loginManager == null) {
			loginManager = new LoginManager();
		}
		
		return loginManager;
		
	}
	
	//현재 접속자 사이즈
	public int getUserCount() {
		return loginUsers.size();
	}
	
	//세션 연결될 때 호출
	//Hash에 접속자 저장함
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		loginUsers.put(event.getSession(), event.getName());
		System.out.println(event.getName()+" 님이 로그인 하였습니다.");
		System.out.println("현재 접속자 수 : "+ getUserCount());
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		loginUsers.remove(event.getSession());
		System.out.println(event.getName()+" 님이 로그아웃 하였습니다.");
		System.out.println("현재 접속자 수 : "+ getUserCount());
	}
	
	public void invalidateUserSession(String usr_name) {
		Enumeration<HttpSession> e = loginUsers.keys();
		HttpSession session = null;
		while(e.hasMoreElements()) {
			session = (HttpSession)e.nextElement();
			if(loginUsers.get(session).equalsIgnoreCase(usr_name)) {
				if(session != null)
				session.invalidate();
			}
		}
	}
	
	public void removeUserSession(String usr_name) {
		Enumeration<HttpSession> e = loginUsers.keys();
		HttpSession session = null;
		while(e.hasMoreElements()) {
			session = (HttpSession)e.nextElement();
			if(loginUsers.get(session).equalsIgnoreCase(usr_name)) {
				if(session != null)
				session.removeAttribute(usr_name);
			}
		}
	}
	
	//로그인이 일치하는지 확인
	public boolean loginIsValid(UserLoginDTO userLoginDto) {
		int userCheckCount = service.userLoginCountService(userLoginDto);
		if(userCheckCount == 1) {
			return true;
		}
		return false;
	}
	
	//이미 사용중인지 확인
	public boolean loginIsUsing(String usr_name) {
		return loginUsers.contains(usr_name);
	}
	
	//로그인 완료 후 세션 저장
	public void setSession(HttpSession session, String usr_name) {
		session.setAttribute(usr_name, this);
	}

	//입력된 세션으로 아이디 리턴
	public String getUsr_name(HttpSession session) {
		return (String)loginUsers.get(session);
	}
	
	//현재 접속 아아디 출력
	public void printLoginUsers() {
		Enumeration<HttpSession> e = loginUsers.keys();
		HttpSession session = null;
		System.out.println("========================================");
		int i = 0;
		while(e.hasMoreElements()) {
			session = (HttpSession)e.nextElement();
			System.out.println((++i) + ".접속자 : " + loginUsers.get(session));
		}
		System.out.println("========================================");
	}
	
	//현재 접속 사용자리스트 리턴
	public Collection<String> getUsers() {
		Collection<String> collection = loginUsers.values();
		return collection;
	}
}
