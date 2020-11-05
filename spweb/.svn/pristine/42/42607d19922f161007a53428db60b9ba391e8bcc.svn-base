package dto;

public class UserNowEquipDTO {

	private int itm_id;
	private int itm_type;
	private int itm_gf;
	private int itm_level;
	private int itm_skill;
	private String itm_img_path;
	private int equip_index;
	private boolean skill_flag;
	private String card_date;

	public int WEAPON = 1;
	public int ACCESSORY = 2;
	public int MAGIC = 3;

	public UserNowEquipDTO() {

	}

	public int getItm_id() {
		return itm_id;
	}

	public void setItm_id(int itm_id) {
		this.itm_id = itm_id;
	}

	public int getItm_type() {
		return itm_type;
	}

	public void setItm_type(int itm_type) {
		this.itm_type = itm_type;
	}

	public int getItm_gf() {
		return itm_gf;
	}

	public void setItm_gf(int itm_gf) {
		this.itm_gf = itm_gf;
	}

	public int getItm_level() {
		return itm_level;
	}

	public void setItm_level(int itm_level) {
		this.itm_level = itm_level;
	}

	public int getItm_skill() {
		return itm_skill;
	}

	public void setItm_skill(int itm_skill) {
		this.itm_skill = itm_skill;
		boolean flag = false;
		if (itm_skill != 0)
			flag = true;
		else
			flag = false;
		setSkill_flag(flag);
	}

	public String getItm_img_path() {
		return itm_img_path;
	}

	public void setItm_img_path(String itm_img_path) {
		this.itm_img_path = itm_img_path;
	}

	public int getEquip_index() {
		return equip_index;
	}

	public void setEquip_index(int itm_type) {
		int index = 0;
		int card_type = (itm_type / 100) % 10;

		if (card_type == MAGIC) {
			index = 0;
		} else if (card_type == WEAPON) {
			index = 1;
		} else if (card_type == ACCESSORY) {
			index = 2;
		} else {
			index = 3;
		}
		this.equip_index = index;
	}

	public boolean isSkill_flag() {
		return skill_flag;
	}

	public void setSkill_flag(boolean skill_flag) {
		this.skill_flag = skill_flag;
	}

	public String getCard_date() {
		return card_date;
	}

	public void setCard_date(String card_date) {
		this.card_date = card_date;
	}

}
