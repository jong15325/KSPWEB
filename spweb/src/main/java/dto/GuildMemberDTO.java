package dto;

import java.sql.Timestamp;

public class GuildMemberDTO {

	private int gmember_id;
	private int guild_id;
	private String guild_name;
	private int usr_id;
	private String usr_name;
	private Timestamp join_date;
	private int contribution_point;
	private String lately_online;
	private int online_state;
	private String member_level_img;
	private int usr_level;
	private int total_member_count;
	
	public GuildMemberDTO() {
		
	}

	public int getGmember_id() {
		return gmember_id;
	}

	public void setGmember_id(int gmember_id) {
		this.gmember_id = gmember_id;
	}

	public int getGuild_id() {
		return guild_id;
	}

	public void setGuild_id(int guild_id) {
		this.guild_id = guild_id;
	}

	public String getGuild_name() {
		return guild_name;
	}

	public void setGuild_name(String guild_name) {
		this.guild_name = guild_name;
	}

	public int getUsr_id() {
		return usr_id;
	}

	public void setUsr_id(int usr_id) {
		this.usr_id = usr_id;
	}

	public String getUsr_name() {
		return usr_name;
	}

	public void setUsr_name(String usr_name) {
		this.usr_name = usr_name;
	}

	public Timestamp getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}

	public int getContribution_point() {
		return contribution_point;
	}

	public void setContribution_point(int contribution_point) {
		this.contribution_point = contribution_point;
	}

	public String getLately_online() {
		return lately_online;
	}

	public void setLately_online(String lately_online) {
		this.lately_online = lately_online;
	}

	public int getOnline_state() {
		return online_state;
	}

	public void setOnline_state(int online_state) {
		this.online_state = online_state;
	}

	public String getMember_level_img() {
		return member_level_img;
	}

	public void setMember_level_img(String member_level_img) {
		this.member_level_img = member_level_img;
	}

	public int getUsr_level() {
		return usr_level;
	}

	public void setUsr_level(int usr_level) {
		this.usr_level = usr_level;
	}

	public int getTotal_member_count() {
		return total_member_count;
	}

	public void setTotal_member_count(int total_member_count) {
		this.total_member_count = total_member_count;
	}
	
}
