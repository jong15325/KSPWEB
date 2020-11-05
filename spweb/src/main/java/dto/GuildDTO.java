package dto;

import java.sql.Timestamp;

public class GuildDTO {

	private int guild_id;
	private String guild_name;
	private String guild_leader;
	private int guild_slots;
	private String guild_mark;
	private int guild_ideology;
	private Timestamp ideology_date;
	private java.math.BigInteger guild_condition;
	private Timestamp condition_date;
	private Timestamp create_date;
	private String guild_banner;
	private String guild_greetings;
	private int guild_like;
	private int member_count;
	private String guild_introduce;
	private int guildTotalRank;
	
	public GuildDTO() {

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

	public String getGuild_leader() {
		return guild_leader;
	}

	public void setGuild_leader(String guild_leader) {
		this.guild_leader = guild_leader;
	}

	public int getGuild_slots() {
		return guild_slots;
	}

	public void setGuild_slots(int guild_slots) {
		this.guild_slots = guild_slots;
	}

	public String getGuild_mark() {
		return guild_mark;
	}

	public void setGuild_mark(String guild_mark) {
		this.guild_mark = guild_mark;
	}

	public int getGuild_ideology() {
		return guild_ideology;
	}

	public void setGuild_ideology(int guild_ideology) {
		this.guild_ideology = guild_ideology;
	}

	public Timestamp getIdeology_date() {
		return ideology_date;
	}

	public void setIdeology_date(Timestamp ideology_date) {
		this.ideology_date = ideology_date;
	}

	public java.math.BigInteger getGuild_condition() {
		return guild_condition;
	}

	public void setGuild_condition(java.math.BigInteger guild_condition) {
		this.guild_condition = guild_condition;
	}

	public Timestamp getCondition_date() {
		return condition_date;
	}

	public void setCondition_date(Timestamp condition_date) {
		this.condition_date = condition_date;
	}

	public Timestamp getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Timestamp create_date) {
		this.create_date = create_date;
	}

	public String getGuild_banner() {
		return guild_banner;
	}

	public void setGuild_banner(String guild_banner) {
		this.guild_banner = guild_banner;
	}

	public String getGuild_greetings() {
		return guild_greetings;
	}

	public void setGuild_greetings(String guild_greetings) {
		this.guild_greetings = guild_greetings;
	}

	public int getGuild_like() {
		return guild_like;
	}

	public void setGuild_like(int guild_like) {
		this.guild_like = guild_like;
	}

	public int getMember_count() {
		return member_count;
	}

	public void setMember_count(int member_count) {
		this.member_count = member_count;
	}

	public String getGuild_introduce() {
		return guild_introduce;
	}

	public void setGuild_introduce(String guild_introduce) {
		this.guild_introduce = guild_introduce;
	}

	public int getGuildTotalRank() {
		return guildTotalRank;
	}

	public void setGuildTotalRank(int guildTotalRank) {
		this.guildTotalRank = guildTotalRank;
	}
	
}
