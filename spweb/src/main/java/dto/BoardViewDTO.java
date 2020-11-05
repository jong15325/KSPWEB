package dto;

public class BoardViewDTO {

	private int view_id;
	private int view_category;
	private int view_article_no;
	private String view_usr_name;
	private String view_usr_ip;
	
	public BoardViewDTO() {

	}

	public int getView_id() {
		return view_id;
	}

	public void setView_id(int view_id) {
		this.view_id = view_id;
	}

	public int getView_category() {
		return view_category;
	}

	public void setView_category(int view_category) {
		this.view_category = view_category;
	}

	public int getView_article_no() {
		return view_article_no;
	}

	public void setView_article_no(int view_article_no) {
		this.view_article_no = view_article_no;
	}

	public String getView_usr_name() {
		return view_usr_name;
	}

	public void setView_usr_name(String view_usr_name) {
		this.view_usr_name = view_usr_name;
	}

	public String getView_usr_ip() {
		return view_usr_ip;
	}

	public void setView_usr_ip(String view_usr_ip) {
		this.view_usr_ip = view_usr_ip;
	}
	
	
}

