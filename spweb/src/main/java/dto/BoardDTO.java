package dto;

import java.sql.Timestamp;
import java.util.List;

public class BoardDTO {

	private int article_no;
	private String article_title;
	private String article_content;
	private String article_writer;
	private Timestamp article_regdate;
	private int article_viewcnt;
	private int article_del;
	private int article_category;
	private String article_uuid;
	private List<ReplyDTO> replyList;
	private int reply_count;
	
	public BoardDTO() {

	}

	public int getArticle_no() {
		return article_no;
	}

	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}

	public String getArticle_title() {
		return article_title;
	}

	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}

	public String getArticle_content() {
		return article_content;
	}

	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}

	public String getArticle_writer() {
		return article_writer;
	}

	public void setArticle_writer(String article_writer) {
		this.article_writer = article_writer;
	}

	public Timestamp getArticle_regdate() {
		return article_regdate;
	}

	public void setArticle_regdate(Timestamp article_regdate) {
		this.article_regdate = article_regdate;
	}

	public int getArticle_viewcnt() {
		return article_viewcnt;
	}

	public void setArticle_viewcnt(int article_viewcnt) {
		this.article_viewcnt = article_viewcnt;
	}

	public Integer getArticle_del() {
		return article_del;
	}

	public void setArticle_del(Integer article_del) {
		this.article_del = article_del;
	}

	public int getArticle_category() {
		return article_category;
	}

	public void setArticle_category(int article_category) {
		this.article_category = article_category;
	}

	public String getArticle_uuid() {
		return article_uuid;
	}

	public void setArticle_uuid(String article_uuid) {
		this.article_uuid = article_uuid;
	}

	public void setArticle_del(int article_del) {
		this.article_del = article_del;
	}

	public List<ReplyDTO> getReplyList() {
		return replyList;
	}

	public void setReplyList(List<ReplyDTO> replyList) {
		this.replyList = replyList;
	}

	public int getReply_count() {
		return reply_count;
	}

	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}

	

	

}
