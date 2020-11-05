package dto;

public class UserRankDTO {
	
	private int usr_id;
	private String usr_name;
	private java.math.BigInteger usr_points;
	private int usr_char;
	private int usr_level;
	private String level_img_path;
	
	public UserRankDTO() {
		
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

	public java.math.BigInteger getUsr_points() {
		return usr_points;
	}

	public void setUsr_points(java.math.BigInteger usr_points) {
		this.usr_points = usr_points;
	}

	public int getUsr_char() {
		return usr_char;
	}

	public void setUsr_char(int usr_char) {
		this.usr_char = usr_char;
	}

	public int getUsr_level() {
		return usr_level;
	}

	public void setUsr_level(int usr_level) {
		this.usr_level = usr_level;
	}

	public String getLevel_img_path() {
		return level_img_path;
	}

	public void setLevel_img_path(String level_img_path) {
		this.level_img_path = level_img_path;
	}
	
	

}
