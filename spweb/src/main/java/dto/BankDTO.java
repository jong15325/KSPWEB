package dto;

import java.sql.Timestamp;

public class BankDTO {

	private int cb_id;
	private int usr_id;
	private String usr_name;
	private java.math.BigInteger deposit;
	private Timestamp update_date;
	
	public BankDTO() {
		
	}

	public int getCb_id() {
		return cb_id;
	}

	public void setCb_id(int cb_id) {
		this.cb_id = cb_id;
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

	public java.math.BigInteger getDeposit() {
		return deposit;
	}

	public void setDeposit(java.math.BigInteger deposit) {
		this.deposit = deposit;
	}

	public Timestamp getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Timestamp update_date) {
		this.update_date = update_date;
	}
	
	
}
