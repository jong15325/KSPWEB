package dto;

public class GuildRankDTO {
	
	private int guild_id;
	private String guild_name;
	private String guild_leader;
	private java.math.BigInteger point;
	private int guild_rank;
	
	public GuildRankDTO() {
		
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
	
	public java.math.BigInteger getPoint() {
		return point;
	}

	public void setPoint(java.math.BigInteger point) {
		this.point = point;
	}

	public int getGuild_rank() {
		return guild_rank;
	}

	public void setGuild_rank(int guild_rank) {
		this.guild_rank = guild_rank;
	}
	
	
}
