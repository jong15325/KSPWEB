package dto;

import java.sql.Timestamp;

public class UserGameActiveDTO {

	private String usr_name;
	private String usr_ip;
	private Timestamp connect_time;
	private int channelPort;
	private int room;
	private int connect_type;
	
	public UserGameActiveDTO() {
		
	}

	public String getUsr_name() {
		return usr_name;
	}

	public void setUsr_name(String usr_name) {
		this.usr_name = usr_name;
	}

	public String getUsr_ip() {
		return usr_ip;
	}

	public void setUsr_ip(String usr_ip) {
		this.usr_ip = usr_ip;
	}

	public Timestamp getConnect_time() {
		return connect_time;
	}

	public void setConnect_time(Timestamp connect_time) {
		this.connect_time = connect_time;
	}

	public int getChannelPort() {
		return channelPort;
	}

	public void setChannelPort(int channelPort) {
		this.channelPort = channelPort;
	}

	public int getRoom() {
		return room;
	}

	public void setRoom(int room) {
		this.room = room;
	}

	public int getConnect_type() {
		return connect_type;
	}

	public void setConnect_type(int connect_type) {
		this.connect_type = connect_type;
	}
	
	
}
