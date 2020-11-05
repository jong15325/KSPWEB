package dto;

import java.sql.Timestamp;

public class GuestBookDTO {

	private int gb_id;
	private int guest_category;
	private int type_id; //상대
	private String guest_writer; //남기는 사람
	private String tag_name;
	private String guest_content;
	private Timestamp guest_date;
	private String guest_profile_path;
	private int guest_count;
	
	public GuestBookDTO() {
		
	}

	public int getGb_id() {
		return gb_id;
	}

	public void setGb_id(int gb_id) {
		this.gb_id = gb_id;
	}

	public int getGuest_category() {
		return guest_category;
	}

	public void setGuest_category(int guest_category) {
		this.guest_category = guest_category;
	}

	public int getType_id() {
		return type_id;
	}

	public void setType_id(int type_id) {
		this.type_id = type_id;
	}

	public String getGuest_writer() {
		return guest_writer;
	}

	public void setGuest_writer(String guest_writer) {
		this.guest_writer = guest_writer;
	}

	public String getTag_name() {
		return tag_name;
	}

	public void setTag_name(String tag_name) {
		this.tag_name = tag_name;
	}

	public String getGuest_content() {
		return guest_content;
	}

	public void setGuest_content(String guest_content) {
		this.guest_content = guest_content;
	}

	public Timestamp getGuest_date() {
		return guest_date;
	}

	public void setGuest_date(Timestamp guest_date) {
		this.guest_date = guest_date;
	}

	public String getGuest_profile_path() {
		return guest_profile_path;
	}

	public void setGuest_profile_path(String guest_profile_path) {
		this.guest_profile_path = guest_profile_path;
	}

	public int getGuest_count() {
		return guest_count;
	}

	public void setGuest_count(int guest_count) {
		this.guest_count = guest_count;
	}
	
	
	
}
