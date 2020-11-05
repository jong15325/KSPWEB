package api;

import java.util.Collection;
import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class GuildManager implements HttpSessionBindingListener{

	private static GuildManager guildManager = null;
	private static Hashtable<HttpSession, String> guildUsers = new Hashtable<HttpSession, String>();
	
	public static synchronized GuildManager getInstance() {
		if(guildManager == null) {
			guildManager = new GuildManager();
		}
		
		return guildManager;
		
	}

	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		guildUsers.put(event.getSession(), event.getName());
	}

	@Override
	public void valueUnbound(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		guildUsers.remove(event.getSession());
	}
	
	
	public void invalidateGuildSession(String guildNuser) {
		Enumeration<HttpSession> e = guildUsers.keys();
		HttpSession session = null;
		while(e.hasMoreElements()) {
			session = (HttpSession)e.nextElement();
			if(guildUsers.get(session).equals(guildNuser)) {
				if(session != null)
				session.invalidate();
			}
		}
	}
	
	public void removeGuildSession(String guildNuser) {
		Enumeration<HttpSession> e = guildUsers.keys();
		HttpSession session = null;
		while(e.hasMoreElements()) {
			session = (HttpSession)e.nextElement();
			if(guildUsers.get(session).equals(guildNuser)) {
				if(session != null)
				session.removeAttribute(guildNuser);
			}
		}
	}
	
	/*
	 * //로그인이 일치하는지 확인 public boolean loginIsValid(UserLoginDTO userLoginDto) { int
	 * userCheckCount = service.userLoginCountService(userLoginDto);
	 * if(userCheckCount == 1) { return true; } return false; }
	 */
	
	//길드세션에 있는지 확인
	public boolean guildIsUsing(String guildNuser) {
		return guildUsers.contains(guildNuser);
	}
	
	//길드 세션 저장
	public void setSession(HttpSession session, String guildNuser) {
		session.setAttribute(guildNuser, this);
	}

	//입력된 세션으로 아이디 리턴
	public String getUsr_name(HttpSession session) {
		return (String)guildUsers.get(session);
	}
	
	//현재 접속 길드원 출력
	public void printGuildUsers() {
		Enumeration<HttpSession> e = guildUsers.keys();
		HttpSession session = null;
		System.out.println("========================================");
		int i = 0;
		while(e.hasMoreElements()) {
			session = (HttpSession)e.nextElement();
			System.out.println((++i) + ".길드원 접속 : " + guildUsers.get(session));
		}
		System.out.println("========================================");
	}
	
	//현재 접속 사용자리스트 리턴
	public Collection<String> getUsers() {
		Collection<String> collection = guildUsers.values();
		return collection;
	}
}
