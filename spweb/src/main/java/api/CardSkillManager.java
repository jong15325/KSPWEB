package api;

public class CardSkillManager {
	
	public CardSkillManager() {
		
	}
	
	public int cardSkillPercent(int card_skill) {
		int percent = 0;
		if(card_skill != 0) {
			percent = card_skill / 1000000;
		}
		return percent;
	}
	
	public int cardSkillFirstOption(int card_skill) {
		int firstOption = 0;
		if(card_skill != 0) {
			firstOption = (card_skill / 1000) % 1000;
		}
		return firstOption;
	}
	
	public int cardSkillSecondOption(int card_skill) {
		int secondOption = 0;
		if(card_skill != 0) {
			secondOption = card_skill % 1000;
		}
		
		return secondOption;
	}
}
