package dto;

import java.util.Date;

public class GuildApplicationDTO {

	private int gapplication_id;
	private int guild_id;
	private int usr_id;
	private String usr_name;
	private Date application_date;
	private String lately_online;
	private String app_level_img;
	private int usr_level;
	private int total_app_count;
	
	public GuildApplicationDTO() {
		
	}

	public int getGapplication_id() {
		return gapplication_id;
	}

	public void setGapplication_id(int gapplication_id) {
		this.gapplication_id = gapplication_id;
	}

	public int getGuild_id() {
		return guild_id;
	}

	public void setGuild_id(int guild_id) {
		this.guild_id = guild_id;
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


	public Date getApplication_date() {
		return application_date;
	}

	public void setApplication_date(Date application_date) {
		this.application_date = application_date;
	}

	public String getApp_level_img() {
		return app_level_img;
	}

	public void setApp_level_img(String app_level_img) {
		this.app_level_img = app_level_img;
	}

	public int getUsr_level() {
		return usr_level;
	}

	public void setUsr_level(int usr_level) {
		this.usr_level = usr_level;
	}

	public int getTotal_app_count() {
		return total_app_count;
	}

	public void setTotal_app_count(int total_app_count) {
		this.total_app_count = total_app_count;
	}

	public String getLately_online() {
		return lately_online;
	}

	public void setLately_online(String lately_online) {
		this.lately_online = lately_online;
	}
	
	
}
