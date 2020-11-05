package dto;

public class GuildPositionDTO {

	private int gposition_id;
	private int guild_id;
	private String guild_name;
	private String position_name;
	private Integer position_authority;
	private String p_member_yn;
	private String p_app_yn;
	private String p_position_yn;
	private String p_auth_yn;
	
	public GuildPositionDTO() {
		
	}

	public int getGposition_id() {
		return gposition_id;
	}

	public void setGposition_id(int gposition_id) {
		this.gposition_id = gposition_id;
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

	public String getPosition_name() {
		return position_name;
	}

	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}

	public Integer getPosition_authority() {
		return position_authority;
	}

	public void setPosition_authority(Integer position_authority) {
		this.position_authority = position_authority;
	}

	public String getP_member_yn() {
		return p_member_yn;
	}

	public void setP_member_yn(String p_member_yn) {
		this.p_member_yn = p_member_yn;
	}

	public String getP_app_yn() {
		return p_app_yn;
	}

	public void setP_app_yn(String p_app_yn) {
		this.p_app_yn = p_app_yn;
	}

	public String getP_position_yn() {
		return p_position_yn;
	}

	public void setP_position_yn(String p_position_yn) {
		this.p_position_yn = p_position_yn;
	}

	public String getP_auth_yn() {
		return p_auth_yn;
	}

	public void setP_auth_yn(String p_auth_yn) {
		this.p_auth_yn = p_auth_yn;
	}

	
}
