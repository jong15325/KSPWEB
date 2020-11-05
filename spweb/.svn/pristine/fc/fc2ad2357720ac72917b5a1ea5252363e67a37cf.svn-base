package api;

import items.AvatarCard;
import items.GoldForceCard;
import items.PCharacterCard;
import items.PetCard;
import items.SPCard;
import items.SilverCard;

public class CardInfoManager {

	public CardInfoManager() {

	}

	public String cardTypeInfo(int itm_type, boolean isSprit) {
		if(isSprit == false) {
			System.out.println("isSprit : "+isSprit);
			if(itm_type > 9999) {
				itm_type = itm_type % 10000;
				System.out.println("itm_type : "+itm_type);
			}
		}
		int card_main_type = itm_type / 1000;
		int card_type = (itm_type / 100) % 10;
		String result = "";
		if (itm_type > 9999) {
			result = "정령";
		} else {
			if (card_main_type == SPCard.USER_CARD) {
				if (card_type == SPCard.MAGIC) {
					result = "마법";
				} else if (card_type == SPCard.WEAPON) {
					result = "무기";
				} else if (card_type == SPCard.ACCESSORY) {
					result = "방어구";
				}
			} else if (card_main_type == SPCard.SILVER_CARD) {
				result = "실버";
			} else if (card_main_type == SPCard.GOLD_CARD) {
				result = "골드포스";
			} else if (card_main_type == SPCard.AVATAR_CARD) {
				result = "아바타";
			} else if (card_main_type == SPCard.PET_CARD) {
				result = "펫";
			} else {
				result = "??";
			}
		}
		System.out.println("type result : " + result);
		return result;
	}

	public String cardNameInfo(int itm_type, boolean isSprit) {
		if(isSprit == false) {
			System.out.println("isSprit : "+isSprit);
			if(itm_type > 9999) {
				itm_type = itm_type % 10000;
				System.out.println("itm_type : "+itm_type);
			}
		}
		int card_main_type = itm_type / 1000;
		int card_type = (itm_type / 100) % 10;
		int card_subType = itm_type % 10;
		String result = "";
		if (itm_type > 9999) {
			if (itm_type > 9999 && itm_type < 20000) {
				result = "물 원소정령";
			} else if (itm_type > 19999 && itm_type < 30000) {
				result = "불 원소정령";
			} else if (itm_type > 29999 && itm_type < 40000) {
				result = "흙 원소정령";
			} else {
				result = "바람 원소정령";
			}
		} else {
			if (card_main_type == SPCard.USER_CARD) {
				if (card_type == SPCard.MAGIC) {
					result = "마법";
				} else if (card_type == SPCard.WEAPON) {
					switch (card_subType) {
					case SPCard.AXE:
						result = "도끼";
						break;
					case SPCard.SWORD:
						result = "검";
						break;
					case SPCard.STAFF:
						result = "지팡이";
						break;
					case SPCard.BOW:
						result = "활";
						break;
					}
				} else if (card_type == SPCard.ACCESSORY) {
					switch (card_subType) {
					case SPCard.SHIELD:
						result = "방패";
						break;
					case SPCard.PENDANT:
						result = "펜던트";
						break;
					case SPCard.ARMOR:
						result = "갑옷";
						break;
					case SPCard.BOOTS:
						result = "부츠";
						break;
					}
				}
			} else if (card_main_type == SPCard.SILVER_CARD) {
				switch (itm_type) {
				case SilverCard.MASTER:
					result = "마스터";
					break;
				case SilverCard.USERSHOP:
					result = "유저 상점";
					break;
				case SilverCard.ANGEL_EYE:
					result = "엔젤 아이";
					break;
				case SilverCard.QUEST_LIFE:
					result = "퀘스트 라이프";
					break;
				case SilverCard.CARD_SLOT6:
					result = "카드슬롯 6";
					break;
				case SilverCard.CARD_SLOT12:
					result = "카드슬롯 12";
					break;
				case SilverCard.VISIT_BONUS:
					result = "방문 보너스x2";
					break;
				case SilverCard.SKULL_BOOSTER:
					result = "해골 부스터";
					break;
				case SilverCard.STAR_BOOSTER:
					result = "별 부스터";
					break;
				case SilverCard.USERSHOP2:
					result = "유저 상점2";
					break;
				case SilverCard.TIME_BONUS:
					result = "타임 보너스x2";
					break;
				case SilverCard.USERSHOP2_AGAIN:
					result = "유저 상점2";
					break;
				case SilverCard.MOON_BOOSTER:
					result = "달 부스터";
					break;
				case SilverCard.LEVEL_FUSION:
					result = "레벨 합성";
					break;
				case SilverCard.SKILL_FUSION:
					result = "스킬 합성";
					break;
				case SilverCard.SKILL1_FUSION:
					result = "1번 스킬 합성";
					break;
				case SilverCard.SKILL2_FUSION:
					result = "2번 스킬 합성";
					break;
				case SilverCard.ELEMENTAL_BONUS:
					result = "평일정령보너스x3";
					break;
				case SilverCard.SKILL_1_1_FUSION:
					result = "1-1번 스킬 합성";
					break;
				case SilverCard.SKILL_2_1_FUSION:
					result = "2-1번 스킬 합성";
					break;
				case SilverCard.SKILL_2_2_FUSION:
					result = "2-2번 스킬 합성";
					break;
				case SilverCard.CHARACTER_SET:
					result = "캐릭터셋";
					break;
				case SilverCard.CHARACTER_MASTER_SET:
					result = "캐릭터마스터셋";
					break;
				case SilverCard.SUPER_SILVER_WATER:
					result = "슈퍼실버";
					break;
				case SilverCard.SUPER_SILVER_FIRE:
					result = "슈퍼실버";
					break;
				case SilverCard.SUPER_SILVER_EARTH:
					result = "슈퍼실버";
					break;
				case SilverCard.SUPER_SLIVER_WIND:
					result = "슈퍼실버";
					break;
				case PCharacterCard.XYRHO:
					result = "프리미엄 자이로";
					break;
				case PCharacterCard.SHAMOO:
					result = "프리미엄 샤무";
					break;
				case PCharacterCard.SVEN:
					result = "프리미엄 스벤";
					break;
				case PCharacterCard.CREAM:
					result = "프리미엄 크림";
					break;
				case PCharacterCard.ROLAND:
					result = "프리미엄 롤랑";
					break;
				case PCharacterCard.AURELLI:
					result = "프리미엄 오렐리";
					break;
				case PCharacterCard.HAWK:
					result = "프리미엄 호크";
					break;
				case PCharacterCard.HAZEL:
					result = "프리미엄 헤이즐";
					break;
				case PCharacterCard.KARA:
					result = "프리미엄 카라";
					break;
				case PCharacterCard.WARREN:
					result = "프리미엄 워렌";
					break;
				case PCharacterCard.LUCY:
					result = "프리미엄 루시";
					break;
				case PCharacterCard.WILL:
					result = "프리미엄 윌";
					break;
				}
			} else if (card_main_type == SPCard.GOLD_CARD) {
				switch (itm_type) {
				case GoldForceCard.MAGIC_FORCE_365:
					result = "마법 골드포스 365";
					break;
				case GoldForceCard.MAGIC_FORCE_30:
					result = "마법 골드포스 30";
					break;
				case GoldForceCard.BOW_FORCE_365:
					result = "활 골드포스 365";
					break;
				case GoldForceCard.BOW_FORCE_30:
					result = "활 골드포스 30";
					break;
				case GoldForceCard.SWORD_FORCE_365:
					result = "검 골드포스 365";
					break;
				case GoldForceCard.SWORD_FORCE_30:
					result = "검 골드포스 30";
					break;
				case GoldForceCard.AXE_FORCE_365:
					result = "도끼 골드포스 365";
					break;
				case GoldForceCard.AXE_FORCE_30:
					result = "도끼 골드포스 30";
					break;
				case GoldForceCard.WAND_FORCE_365:
					result = "지팡이 골드포스 365";
					break;
				case GoldForceCard.WAND_FORCE_30:
					result = "지팡이 골드포스 30";
					break;
				case GoldForceCard.SHIELD_FORCE_365:
					result = "방패 골드포스 365";
					break;
				case GoldForceCard.SHIELD_FORCE_30:
					result = "방패 골드포스 30";
					break;
				case GoldForceCard.PENDENT_FORCE_365:
					result = "펜던트 골드포스 365";
					break;
				case GoldForceCard.PENDENT_FORCE_30:
					result = "펜던트 골드포스 30";
					break;
				case GoldForceCard.ARMOR_FORCE_365:
					result = "갑옷 골드포스 365";
					break;
				case GoldForceCard.ARMOR_FORCE_30:
					result = "갑옷 골드포스 30";
					break;
				case GoldForceCard.BOOTS_FORCE_365:
					result = "부츠 골드포스 365";
					break;
				case GoldForceCard.BOOTS_FORCE_30:
					result = "부츠 골드포스 30";
					break;
				}
			} else if (card_main_type == SPCard.AVATAR_CARD) {
				switch (itm_type) {
				case AvatarCard.ARME_BLANCHE:
					result = "기병창";
					break;
				case AvatarCard.LONG_SWORD:
					result = "장검";
					break;
				case AvatarCard.MAGIC_WAND:
					result = "마법봉";
					break;
				case AvatarCard.HAND_CANNON:
					result = "손대포";
					break;
				case AvatarCard.SMALL_CROSSBOW:
					result = "스몰석궁";
					break;
				case AvatarCard.SHORT_CROW:
					result = "쇼트크로우";
					break;
				case AvatarCard.IRON_HELM:
					result = "아이언투구";
					break;
				case AvatarCard.BROWN_GOGGLE:
					result = "브라운고글";
					break;
				case AvatarCard.MAGIC_CAP:
					result = "마법모자";
					break;
				case AvatarCard.PANDA_HELMET:
					result = "팬더투구";
					break;
				case AvatarCard.SANTA_MAGIC_CAP:
					result = "산타모자";
					break;
				case AvatarCard.PLATE_ARMOR:
					result = "판금갑옷";
					break;
				case AvatarCard.HIGH_LEATHER_ARMOR:
					result = "하이레더갑옷";
					break;
				case AvatarCard.MAGIC_ROBE:
					result = "마법로브";
					break;
				case AvatarCard.STEEL_BOOTS:
					result = "강철부츠";
					break;
				case AvatarCard.SILVER_BOOTS:
					result = "실버부츠";
					break;
				case AvatarCard.LEATHER_BOOTS:
					result = "레더부츠";
					break;
				case AvatarCard.YELLOW_HAIR:
					result = "옐로우 헤어";
					break;
				case AvatarCard.RED_HAIR:
					result = "레드 헤어";
					break;
				case AvatarCard.GRAY_HAIR:
					result = "그레이 헤어";
					break;
				case AvatarCard.SERIOUS_FACE:
					result = "진지한 얼굴";
					break;
				case AvatarCard.SLEEPING_FACE:
					result = "진지한 얼굴";
					break;
				case AvatarCard.SMILING_FACE:
					result = "웃는 얼굴";
					break;
				}
			} else if (card_main_type == SPCard.PET_CARD) {
				switch (itm_type) {
				case PetCard.GREEN_SLIME:
					result = "그린 슬라임";
					break;
				case PetCard.PURPLE_SLIME:
					result = "퍼플 슬라임";
					break;
				case PetCard.BLUE_SLIME:
					result = "블루 슬라임";
					break;
				case PetCard.SKULL_MAGE:
					result = "해골 메이지";
					break;
				case PetCard.GOBLIN_SHAMAN:
					result = "고블린 사면";
					break;
				case PetCard.MAGMA_GOLEM:
					result = "마그마 골렘";
					break;
				case PetCard.STONE_GOLEM:
					result = "스톤 골렘";
					break;
				case PetCard.SANTA_CLAUS:
					result = "산타클로스";
					break;
				case PetCard.SNOW_MAN:
					result = "눈사람";
					break;
				case PetCard.BIGGLE:
					result = "비글";
					break;
				case PetCard.REO_KOREA:
					result = "레오(한국)";
					break;
				case PetCard.REO:
					result = "레오";
					break;
				case PetCard.RED_DRAGON:
					result = "레드 드래곤";
					break;
				case PetCard.MINI_PIG:
					result = "미니피그";
					break;
				case PetCard.MAGIC_PENGUIN:
					result = "마법펭귄";
					break;
				}
			} else {
				result = "??";
			}
		}

		System.out.println("result type2 : " + result);
		return result;
	}

	public String cardChannel_info(int itm_type, int itm_level) {
		String result = "";
		int card_main_type = itm_type / 1000;
		if (itm_type > 9999) {
			result = "제한없음";
		} else {
			if (card_main_type == SPCard.USER_CARD) {
				if (itm_level <= 3) { // 1~4
					result = "초보채널 이상";
				} else if (itm_level >= 4 && itm_level <= 5) { // 5~6
					result = "중수채널 이상";
				} else {
					result = "고수채널 이상";
				}
			} else if (card_main_type == SPCard.SILVER_CARD) {
				result = "제한없음";
			} else if (card_main_type == SPCard.GOLD_CARD) {
				result = "제한없음";
			} else if (card_main_type == SPCard.AVATAR_CARD) {
				result = "제한없음";
			} else if (card_main_type == SPCard.PET_CARD) {
				result = "제한없음";
			} else {
				result = "??";
			}
		}
		System.out.println("result type3 : " + result + "itm_level : " + itm_level);
		return result;
	}

	public String cardElement(int itm_type, boolean isSprit) {
		if(isSprit == false) {
			System.out.println("isSprit : "+isSprit);
			if(itm_type > 9999) {
				itm_type = itm_type % 10000;
				System.out.println("itm_type : "+itm_type);
			}
		}
		int card_main_type = itm_type / 1000;
		int card_element = (itm_type / 10) % 10;
		String result = "";
		if (itm_type > 9999) {
			if (itm_type > 9999 && itm_type < 20000) {
				result = "물";
			} else if (itm_type > 19999 && itm_type < 30000) {
				result = "불";
			} else if (itm_type > 29999 && itm_type < 40000) {
				result = "흙";
			} else {
				result = "바람";
			}
		} else {
			if (card_main_type == SPCard.USER_CARD) {
				if (card_element == SPCard.WATER) {
					result = "물";
				} else if (card_element == SPCard.FIRE) {
					result = "불";
				} else if (card_element == SPCard.EARTH) {
					result = "흙";
				} else {
					result = "바람";
				}
			} else if (card_main_type == SPCard.SILVER_CARD) {
				switch (itm_type) {
				case SilverCard.SUPER_SILVER_WATER:
					result = "물";
					break;
				case SilverCard.SUPER_SILVER_FIRE:
					result = "불";
					break;
				case SilverCard.SUPER_SILVER_EARTH:
					result = "흙";
					break;
				case SilverCard.SUPER_SLIVER_WIND:
					result = "바람";
					break;
				default:
					result = "무속성";
					break;
				}
			} else if (card_main_type == SPCard.GOLD_CARD) {
				result = "무속성";
			} else if (card_main_type == SPCard.AVATAR_CARD) {
				result = "무속성";
			} else if (card_main_type == SPCard.PET_CARD) {
				result = "무속성";
			} else {
				result = "??";
			}
		}

		System.out.println("result type4 : " + result);
		return result;
	}

	public String card_date(int itm_type, int itm_trans_gf, int itm_level, boolean isSprit) {
		if(isSprit == false) {
			System.out.println("isSprit : "+isSprit);
			if(itm_type > 9999) {
				itm_type = itm_type % 10000;
				System.out.println("itm_type : "+itm_type);
			}
		}
		String result = "";
		int card_main_type = itm_type / 1000;
		if (itm_type > 9999) {
			result = "제한없음";
		} else {
			if (card_main_type == SPCard.USER_CARD) {
				result = String.valueOf(String.format("%03d", itm_trans_gf));
			} else if (card_main_type == SPCard.SILVER_CARD) {
				if (itm_trans_gf > 1500) { // 없음
					if(itm_level > 0) { // 횟수
						switch (itm_type) {
						case SilverCard.USERSHOP2:
						case SilverCard.USERSHOP2_AGAIN:
						case SilverCard.LEVEL_FUSION:
						case SilverCard.SKILL_FUSION:
						case SilverCard.SKILL1_FUSION:
						case SilverCard.SKILL2_FUSION:
						case SilverCard.SKILL_1_1_FUSION:
						case SilverCard.SKILL_2_1_FUSION:
						case SilverCard.SKILL_2_2_FUSION:
							result = String.valueOf(itm_level);
							break;
						default:
							result = "??";
							break;
						}
					}else { // 횟수없음
						result = "제한없음";
					}
				} else { //일수잇음
					result = String.valueOf(String.format("%03d", itm_trans_gf));
				}
			} else if (card_main_type == SPCard.GOLD_CARD) {
				switch (itm_type) {
				case GoldForceCard.MAGIC_FORCE_365:
				case GoldForceCard.BOW_FORCE_365:
				case GoldForceCard.SWORD_FORCE_365:
				case GoldForceCard.AXE_FORCE_365:
				case GoldForceCard.WAND_FORCE_365:
				case GoldForceCard.SHIELD_FORCE_365:
				case GoldForceCard.PENDENT_FORCE_365:
				case GoldForceCard.ARMOR_FORCE_365:
				case GoldForceCard.BOOTS_FORCE_365:
					result = "365";
					break;
				case GoldForceCard.MAGIC_FORCE_30:
				case GoldForceCard.BOW_FORCE_30:
				case GoldForceCard.SWORD_FORCE_30:
				case GoldForceCard.AXE_FORCE_30:
				case GoldForceCard.WAND_FORCE_30:
				case GoldForceCard.SHIELD_FORCE_30:
				case GoldForceCard.PENDENT_FORCE_30:
				case GoldForceCard.ARMOR_FORCE_30:
				case GoldForceCard.BOOTS_FORCE_30:
					result = "30";
					break;
				}
			} else if (card_main_type == SPCard.AVATAR_CARD) {
				result = "제한없음";
			} else if (card_main_type == SPCard.PET_CARD) {
				result = "제한없음";
			} else {
				result = "??";
			}
		}
		System.out.println("result type5 : " + result);
		return result;
	}

	public String card_skill1(int itm_skill, int itm_level) {
		String result = "";
		int itm_levelPlus = itm_level + 1;
		int firstOption = 0;
		if (itm_skill != 0) {
			firstOption = (itm_skill / 1000) % 1000;
		}
		int percent = 0;
		if (firstOption != 0) {
			percent = itm_skill / 1000000;
		}
		System.out.println("firstOption : " + firstOption);
		switch (firstOption) {
		case 121:
			result = "공격 데미지 " + 2 * itm_levelPlus + "% 증가";
			break;
		case 120:
			result = "공격 데미지 " + 3 * itm_levelPlus + "% 증가";
			break;
		case 119:
			result = "공격 데미지 " + 4 * itm_levelPlus + "% 증가";
			break;
		case 118:
			result = "공격 데미지 " + 5 * itm_levelPlus + "% 증가";
			break;
		case 100:
			result = "공격 데미지 " + 6 * itm_levelPlus + "% 증가";
			break;
		case 122:
			result = "공격 밀림 " + 6.5 * itm_levelPlus + "% 증가";
			break;
		case 123:
			result = "공격 밀림 " + 7 * itm_levelPlus + "% 증가";
			break;
		case 124:
			result = "공격 밀림 " + 7.5 * itm_levelPlus + "% 증가";
			break;
		case 125:
			result = "공격 밀림 " + 8 * itm_levelPlus + "% 증가";
			break;
		case 126:
			result = "공격 밀림 " + 8.5 * itm_levelPlus + "% 증가";
			break;
		case 127:
			result = "공격 시간 " + 1 * itm_levelPlus + "% 감소";
			break;
		case 128:
			result = "공격 시간 " + 1 * itm_levelPlus + "% 감소";
			break;
		case 129:
			result = "공격 시간 " + 1 * itm_levelPlus + "% 감소";
			break;
		case 130:
			result = "공격 시간 " + 2 * itm_levelPlus + "% 감소";
			break;
		case 131:
			result = "공격 시간 " + 3 * itm_levelPlus + "% 감소";
			break;
		case 132:
			result = "MP 소모 " + 4.5 * itm_levelPlus + "% 감소";
			break;
		case 133:
			result = "MP 소모 " + 4.5 * itm_levelPlus + "% 감소";
			break;
		case 134:
			result = "MP 소모 " + 5 * itm_levelPlus + "% 감소";
			break;
		case 135:
			result = "MP 소모 " + 5.5 * itm_levelPlus + "% 감소";
			break;
		case 136:
			result = "MP 소모 " + 6 * itm_levelPlus + "% 감소";
			break;
		case 101:
			result = "크리데미지 " + 30 + "% 증가";
			break;
		case 138:
			result = "크리데미지 " + 35 + "% 증가";
			break;
		case 139:
			result = "크리데미지 " + 40 + "% 증가";
			break;
		case 140:
			result = "크리데미지 " + 45 + "% 증가";
			break;
		case 141:
			result = "크리데미지 " + 50 + "% 증가";
			break;
		case 142:
			result = "방어 시간 " + 1.5 * itm_levelPlus + "% 증가";
			break;
		case 143:
			result = "방어 시간 " + 2.5 * itm_levelPlus + "% 증가";
			break;
		case 103:
			result = "방어 시간 " + 3 * itm_levelPlus + "% 증가";
			break;
		case 106:
			result = "데미지 " + 1 * itm_levelPlus + "% 감소";
			break;
		case 144:
			result = "데미지 " + 1.5 * itm_levelPlus + "% 감소";
			break;
		case 186:
			result = "데미지 " + 1.5 * itm_levelPlus + "% 감소";
			break;
		case 187:
			result = "데미지 " + 2 * itm_levelPlus + "% 감소";
			break;
		case 145:
			result = "데미지 " + 2.5 * itm_levelPlus + "% 감소";
			break;
		case 102:
			result = "데미지 " + 3 * itm_levelPlus + "% 감소";
			break;
		case 146:
			result = "방어후 지연 " + 1.5 * itm_levelPlus + "% 감소";
			break;
		case 189:
			result = "방어후 지연 " + 2 * itm_levelPlus + "% 감소";
			break;
		case 147:
			result = "방어후 지연 " + 2.5 * itm_levelPlus + "% 감소";
			break;
		case 104:
			result = "방어후 지연 " + 3 * itm_levelPlus + "% 감소";
			break;
		case 148:
			result = "흔들림 " + 1.5 * itm_levelPlus + "% 감소";
			break;
		case 149:
			result = "흔들림 " + 2.5 * itm_levelPlus + "% 감소";
			break;
		case 105:
			result = "흔들림 " + 3 * itm_levelPlus + "% 감소";
			break;
		case 108:
			result = "흔들림 " + 3 * itm_levelPlus + "% 감소";
			break;
		case 150:
			result = "타격후 지연 " + 1 * itm_levelPlus + "% 감소";
			break;
		case 192:
			result = "타격후 지연 " + 1 * itm_levelPlus + "% 감소";
			break;
		case 193:
			result = "타격후 지연 " + 1 * itm_levelPlus + "% 감소";
			break;
		case 151:
			result = "타격후 지연 " + 2 * itm_levelPlus + "% 감소";
			break;
		case 107:
			result = "타격후 지연 " + 3 * itm_levelPlus + "% 감소";
			break;
		case 152:
			result = "흔들림 " + 1.5 * itm_levelPlus + "% 감소";
			break;
		case 153:
			result = "흔들림 " + 2 * itm_levelPlus + "% 감소";
			break;
		case 190:
			result = "흔들림 " + 1.5 * itm_levelPlus + "% 감소";
			break;
		case 191:
			result = "흔들림 " + 2 * itm_levelPlus + "% 감소";
			break;
		case 109:
			result = "타격후지연" + 2 * itm_levelPlus + "%,흔들림" + 2 * itm_levelPlus + "%감소";
			break;
		case 154:
			result = "타격후지연" + 1 * itm_levelPlus + "%,흔들림" + 1 * itm_levelPlus + "%감소";
			break;
		case 155:
			result = "타격후지연" + 1 * itm_levelPlus + "%,흔들림" + 2 * itm_levelPlus + "%감소";
			break;
		case 156:
			result = "가속도 " + 3 * itm_levelPlus + "% 증가";
			break;
		case 110:
			result = "가속도 " + 3.5 * itm_levelPlus + "% 증가";
			break;
		case 157:
			result = "가속도 " + 4 * itm_levelPlus + "% 증가";
			break;
		case 158:
			result = "가속도 " + 4.5 * itm_levelPlus + "% 증가";
			break;
		case 159:
			result = "가속도 " + 5 * itm_levelPlus + "% 증가";
			break;
		case 160:
			result = "최대속도 " + 1 * itm_levelPlus + "% 증가";
			break;
		case 161:
			result = "최대속도 " + 2 * itm_levelPlus + "% 증가";
			break;
		case 162:
			result = "최대속도 " + 3 * itm_levelPlus + "% 증가";
			break;
		case 163:
			result = "최대속도 " + 4 * itm_levelPlus + "% 증가";
			break;
		case 111:
			result = "최대속도 " + 5 * itm_levelPlus + "% 증가";
			break;
		case 164:
			result = "BP 소모 " + 3 * itm_levelPlus + "% 감소";
			break;
		case 165:
			result = "BP 소모 " + 3.5 * itm_levelPlus + "% 감소";
			break;
		case 112:
			result = "BP 소모 " + 4 * itm_levelPlus + "% 감소";
			break;
		case 166:
			result = "BP 소모 " + 4.5 * itm_levelPlus + "% 감소";
			break;
		case 167:
			result = "BP 소모 " + 5 * itm_levelPlus + "% 감소";
			break;
		case 113:
			result = "가속도" + 1 * itm_levelPlus + "%증가,BP소모" + 1 * itm_levelPlus + "%감소";
			break;
		case 168:
			result = "가속도" + 1 * itm_levelPlus + "%증가,BP소모" + 2 * itm_levelPlus + "%감소";
			break;
		case 169:
			result = "가속도" + 2 * itm_levelPlus + "%증가,BP소모" + 2 * itm_levelPlus + "%감소";
			break;
		case 170:
			result = "가속도" + 2 * itm_levelPlus + "%증가,BP소모" + 3 * itm_levelPlus + "%감소";
			break;
		case 171:
			result = "가속도" + 3 * itm_levelPlus + "%증가,BP소모" + 3 * itm_levelPlus + "%감소";
			break;
		case 114:
			result = "HP 회복 " + 3 * itm_levelPlus + "% 증가";
			break;
		case 172:
			result = "HP 회복 " + 2 * itm_levelPlus + "% 증가";
			break;
		case 173:
			result = "HP 회복 " + 2.5 * itm_levelPlus + "% 증가";
			break;
		case 115:
			result = "MP 회복 " + 3 * itm_levelPlus + "% 증가";
			break;
		case 174:
			result = "MP 회복 " + 2 * itm_levelPlus + "% 증가";
			break;
		case 175:
			result = "MP 회복 " + 2.5 * itm_levelPlus + "% 증가";
			break;
		case 116:
			result = "BP 회복 " + 3 * itm_levelPlus + "% 증가";
			break;
		case 176:
			result = "BP 회복 " + 2 * itm_levelPlus + "% 증가";
			break;
		case 177:
			result = "BP 회복 " + 2.5 * itm_levelPlus + "% 증가";
			break;
		case 117:
			result = "HP,BP,MP 회복 각 " + 1 * itm_levelPlus + "% 증가";
			break;
		case 178:
			result = "HP,BP,MP 회복 각 " + 1 * itm_levelPlus + "% 증가";
			break;
		case 179:
			result = "HP,BP,MP 회복 각 " + 2 * itm_levelPlus + "% 증가";
			break;
		case 180:
			result = "데미지 " + 2 * itm_levelPlus + "% 증가";
			break;
		case 181:
			result = "데미지 " + 2 * itm_levelPlus + "% 증가";
			break;
		case 182:
			result = "최대속도 " + 4 * itm_levelPlus + "% 감소";
			break;
		case 183:
			result = "HP 회복 " + 2 * itm_levelPlus + "% 감소";
			break;
		case 184:
			result = "방어 시간 " + 1.5 * itm_levelPlus + "% 증가";
			break;
		case 185:
			result = "방어 시간 " + 2 * itm_levelPlus + "% 증가";
			break;
		case 188:
			result = "방어후 지연 " + 1.5 * itm_levelPlus + "% 증가";
			break;
		case 196:
			result = "타격후지연" + 1 * itm_levelPlus + "%,흔들림" + 1 * itm_levelPlus + "%감소";
			break;
		case 197:
			result = "타격후지연" + 1 * itm_levelPlus + "%,흔들림" + 1 * itm_levelPlus + "%감소";
			break;
		case 200:
			result = "디펜스 무시 (" + percent + "%)";
			break;
		case 201:
			result = "넉백 (" + percent + "%)";
			break;
		case 202:
			result = "트리플샷 (" + percent + "%)";
			break;
		case 203:
			result = "고스트샷 (" + percent + "%)";
			break;
		case 204:
			result = "골렘스킨 (" + percent + "%)";
			break;
		case 205:
			result = "데미지 반사 (" + percent + "%)";
			break;
		case 206:
			result = "데미지 반사 (" + percent + "%)";
			break;
		case 207:
			result = "데미지 반사 (" + percent + "%)";
			break;
		case 208:
			result = "데미지 반사 (" + percent + "%)";
			break;
		case 209:
			result = "데미지 반사 (" + percent + "%)";
			break;
		case 309:
			result = "텔레포트 (" + percent + "%)";
			break;
		case 316:
			result = "독 데미지 초당 -4 (" + percent + "%)";
			break;
		case 317:
			result = "독 데미지 초당 -5 (" + percent + "%)";
			break;
		case 318:
			result = "독 데미지 초당 -6 (" + percent + "%)";
			break;
		case 319:
			result = "독 데미지 초당 -7 (" + percent + "%)";
			break;
		case 320:
			result = "독 데미지 초당 -8 (" + percent + "%)";
			break;
		case 321:
			result = "부스터 불가 5초 (" + percent + "%)";
			break;
		case 322:
			result = "부스터 불가 5.5초 (" + percent + "%)";
			break;
		case 300:
			result = "부스터 불가 6초 (" + percent + "%)";
			break;
		case 323:
			result = "부스터 불가 6.5초 (" + percent + "%)";
			break;
		case 324:
			result = "부스터 불가 7초 (" + percent + "%)";
			break;
		case 325:
			result = "공격1 불가 1초 (" + percent + "%)";
			break;
		case 326:
			result = "공격1 불가 1.5초 (" + percent + "%)";
			break;
		case 301:
			result = "공격1 불가 2초 (" + percent + "%)";
			break;
		case 327:
			result = "공격1 불가 2.5초 (" + percent + "%)";
			break;
		case 328:
			result = "공격1 불가 3초 (" + percent + "%)";
			break;
		case 329:
			result = "디펜스 불가 0.5초 (" + percent + "%)";
			break;
		case 330:
			result = "디펜스 불가 1초 (" + percent + "%)";
			break;
		case 302:
			result = "디펜스 불가 1.5초 (" + percent + "%)";
			break;
		case 331:
			result = "디펜스 불가 2초 (" + percent + "%)";
			break;
		case 332:
			result = "디펜스 불가 2.5초 (" + percent + "%)";
			break;
		case 333:
			result = "회전 2초 (" + percent + "%)";
			break;
		case 334:
			result = "회전 3초 (" + percent + "%)";
			break;
		case 303:
			result = "회전 4초 (" + percent + "%)";
			break;
		case 335:
			result = "회전 5초 (" + percent + "%)";
			break;
		case 336:
			result = "회전 6초 (" + percent + "%)";
			break;
		case 337:
			result = "빙글빙글 1초 (" + percent + "%)";
			break;
		case 338:
			result = "빙글빙글 1.5초 (" + percent + "%)";
			break;
		case 304:
			result = "빙글빙글 2초 (" + percent + "%)";
			break;
		case 339:
			result = "빙글빙글 2.5초 (" + percent + "%)";
			break;
		case 340:
			result = "빙글빙글 3초 (" + percent + "%)";
			break;
		case 341:
			result = "회전 불가 2초 (" + percent + "%)";
			break;
		case 342:
			result = "회전 불가 2.5초 (" + percent + "%)";
			break;
		case 305:
			result = "회전 불가 3초 (" + percent + "%)";
			break;
		case 343:
			result = "회전 불가 3.5초 (" + percent + "%)";
			break;
		case 344:
			result = "회전 불가 4초 (" + percent + "%)";
			break;
		case 345:
			result = "공격2 불가 0.5초 (" + percent + "%)";
			break;
		case 346:
			result = "공격2 불가 1초 (" + percent + "%)";
			break;
		case 306:
			result = "공격2 불가 1.5초 (" + percent + "%)";
			break;
		case 347:
			result = "공격2 불가 2초 (" + percent + "%)";
			break;
		case 348:
			result = "공격2 불가 2.5초 (" + percent + "%)";
			break;
		case 349:
			result = "인비져블 1초 (" + percent + "%)";
			break;
		case 350:
			result = "인비져블 1.5초 (" + percent + "%)";
			break;
		case 310:
			result = "인비져블 2초 (" + percent + "%)";
			break;
		case 351:
			result = "인비져블 2.5초 (" + percent + "%)";
			break;
		case 352:
			result = "인비져블 3초 (" + percent + "%)";
			break;
		case 353:
			result = "흡수방패 1초 (" + percent + "%)";
			break;
		case 354:
			result = "흡수방패 2초 (" + percent + "%)";
			break;
		case 307:
			result = "흡수방패 3초 (" + percent + "%)";
			break;
		case 355:
			result = "흡수방패 4초 (" + percent + "%)";
			break;
		case 356:
			result = "흡수방패 5초 (" + percent + "%)";
			break;
		case 308:
			result = "프로텍트 0.5초 (" + percent + "%)";
			break;
		case 357:
			result = "프로텍트 0.5초 (" + percent + "%)";
			break;
		case 358:
			result = "프로텍트 0.5초 (" + percent + "%)";
			break;
		case 359:
			result = "프로텍트 1초 (" + percent + "%)";
			break;
		case 360:
			result = "프로텍트 1.5초 (" + percent + "%)";
			break;
		case 361:
			result = "이빌아이 6초 (" + percent + "%)";
			break;
		case 362:
			result = "이빌아이 6.5초 (" + percent + "%)";
			break;
		case 311:
			result = "이빌아이 7초 (" + percent + "%)";
			break;
		case 363:
			result = "이빌아이 7.5초 (" + percent + "%)";
			break;
		case 364:
			result = "이빌아이 8초 (" + percent + "%)";
			break;
		case 365:
			result = "나침반 8초 (" + percent + "%)";
			break;
		case 366:
			result = "나침반 8.5초 (" + percent + "%)";
			break;
		case 312:
			result = "나침반 9초 (" + percent + "%)";
			break;
		case 367:
			result = "나침반 9.5초 (" + percent + "%)";
			break;
		case 368:
			result = "나침반 10초 (" + percent + "%)";
			break;
		case 369:
			result = "가속신발 2초 (" + percent + "%)";
			break;
		case 370:
			result = "가속신발 3초 (" + percent + "%)";
			break;
		case 313:
			result = "가속신발 4초 (" + percent + "%)";
			break;
		case 371:
			result = "가속신발 5초 (" + percent + "%)";
			break;
		case 372:
			result = "가속신발 6초 (" + percent + "%)";
			break;
		case 314:
			result = "회복 불가 5초 (" + percent + "%)";
			break;
		case 373:
			result = "회복 불가 5.5초 (" + percent + "%)";
			break;
		case 374:
			result = "회복 불가 6초 (" + percent + "%)";
			break;
		case 375:
			result = "회복 불가 6.5초 (" + percent + "%)";
			break;
		case 376:
			result = "회복 불가 7초 (" + percent + "%)";
			break;
		case 377:
			result = "정지 5초 (" + percent + "%)";
			break;
		case 378:
			result = "정지 5.5초 (" + percent + "%)";
			break;
		case 315:
			result = "정지 6초 (" + percent + "%)";
			break;
		case 379:
			result = "정지 6.5초 (" + percent + "%)";
			break;
		case 380:
			result = "정지 7초 (" + percent + "%)";
			break;
		case 381:
			result = "공격 둔화 5초 (" + percent + "%)";
			break;
		case 382:
			result = "공격 둔화 5.5초 (" + percent + "%)";
			break;
		case 383:
			result = "공격 둔화 6초 (" + percent + "%)";
			break;
		case 384:
			result = "공격 둔화 6.5초 (" + percent + "%)";
			break;
		case 385:
			result = "공격 둔화 7초 (" + percent + "%)";
			break;
		case 386:
			result = "특수스킬 발동불가 11초 (" + percent + "%)";
			break;
		case 387:
			result = "특수스킬 발동불가 11.5초 (" + percent + "%)";
			break;
		case 388:
			result = "특수스킬 발동불가 12초 (" + percent + "%)";
			break;
		case 389:
			result = "특수스킬 발동불가 12.5초 (" + percent + "%)";
			break;
		case 390:
			result = "특수스킬 발동불가 13초 (" + percent + "%)";
			break;
		case 391:
			result = "도끼카드 발동불가 11초 (" + percent + "%)";
			break;
		case 392:
			result = "도끼카드 발동불가 11.5초 (" + percent + "%)";
			break;
		case 393:
			result = "도끼카드 발동불가 12초 (" + percent + "%)";
			break;
		case 394:
			result = "도끼카드 발동불가 12.5초 (" + percent + "%)";
			break;
		case 395:
			result = "도끼카드 발동불가 13초 (" + percent + "%)";
			break;
		case 396:
			result = "검카드 발동불가 11초 (" + percent + "%)";
			break;
		case 397:
			result = "검카드 발동불가 11.5초 (" + percent + "%)";
			break;
		case 398:
			result = "검카드 발동불가 12초 (" + percent + "%)";
			break;
		case 399:
			result = "검카드 발동불가 12.5초 (" + percent + "%)";
			break;
		case 400:
			result = "검카드 발동불가 13초 (" + percent + "%)";
			break;
		case 401:
			result = "활카드 발동불가 11초 (" + percent + "%)";
			break;
		case 402:
			result = "활카드 발동불가 11.5초 (" + percent + "%)";
			break;
		case 403:
			result = "활카드 발동불가 12초 (" + percent + "%)";
			break;
		case 404:
			result = "활카드 발동불가 12.5초 (" + percent + "%)";
			break;
		case 405:
			result = "활카드 발동불가 13초 (" + percent + "%)";
			break;
		case 411:
			result = "방패카드 발동불가 11초 (" + percent + "%)";
			break;
		case 412:
			result = "방패카드 발동불가 11.5초 (" + percent + "%)";
			break;
		case 413:
			result = "방패카드 발동불가 12초 (" + percent + "%)";
			break;
		case 414:
			result = "방패카드 발동불가 12.5초 (" + percent + "%)";
			break;
		case 415:
			result = "방패카드 발동불가 13초 (" + percent + "%)";
			break;
		case 406:
			result = "지팡이카드 발동불가 11초 (" + percent + "%)";
			break;
		case 407:
			result = "지팡이카드 발동불가 11.5초 (" + percent + "%)";
			break;
		case 408:
			result = "지팡이카드 발동불가 12초 (" + percent + "%)";
			break;
		case 409:
			result = "지팡이카드 발동불가 12.5초 (" + percent + "%)";
			break;
		case 410:
			result = "지팡이카드 발동불가 13초 (" + percent + "%)";
			break;
		case 416:
			result = "갑옷카드 발동불가 11초 (" + percent + "%)";
			break;
		case 417:
			result = "갑옷카드 발동불가 11.5초 (" + percent + "%)";
			break;
		case 418:
			result = "갑옷카드 발동불가 12초 (" + percent + "%)";
			break;
		case 419:
			result = "갑옷카드 발동불가 12.5초 (" + percent + "%)";
			break;
		case 420:
			result = "갑옷카드 발동불가 13초 (" + percent + "%)";
			break;
		case 421:
			result = "펜던트카드 발동불가 11초 (" + percent + "%)";
			break;
		case 422:
			result = "펜던트카드 발동불가 11.5초 (" + percent + "%)";
			break;
		case 423:
			result = "펜던트카드 발동불가 12초 (" + percent + "%)";
			break;
		case 424:
			result = "펜던트카드 발동불가 12.5초 (" + percent + "%)";
			break;
		case 425:
			result = "펜던트카드 발동불가 13초 (" + percent + "%)";
			break;
		case 426:
			result = "부츠카드 발동불가 11초 (" + percent + "%)";
			break;
		case 427:
			result = "부츠카드 발동불가 11.5초 (" + percent + "%)";
			break;
		case 428:
			result = "부츠카드 발동불가 12초 (" + percent + "%)";
			break;
		case 429:
			result = "부츠카드 발동불가 12.5초 (" + percent + "%)";
			break;
		case 430:
			result = "부츠카드 발동불가 13초 (" + percent + "%)";
			break;
		case 431:
			result = "마법카드 발동불가 11초 (" + percent + "%)";
			break;
		case 432:
			result = "마법카드 발동불가 11.5초 (" + percent + "%)";
			break;
		case 433:
			result = "마법카드 발동불가 12초 (" + percent + "%)";
			break;
		case 434:
			result = "마법카드 발동불가 12.5초 (" + percent + "%)";
			break;
		case 435:
			result = "마법카드 발동불가 13초 (" + percent + "%)";
			break;
		default:
			result = "";
			break;
		}
		result = result.replace(".0", "");
		return result;
	}

	public String card_skill2(int itm_skill) {
		String result = "";
		int secondOption = 0;
		if (itm_skill != 0) {
			secondOption = itm_skill % 1000;
		}
		int percent = 0;
		if (secondOption != 0) {
			percent = itm_skill / 1000000;
		}
		System.out.println("secondOption : " + secondOption);
		switch (secondOption) {
		case 200:
			result = "디펜스 무시 (" + percent + "%)";
			break;
		case 201:
			result = "넉백 (" + percent + "%)";
			break;
		case 202:
			result = "트리플샷 (" + percent + "%)";
			break;
		case 203:
			result = "고스트샷 (" + percent + "%)";
			break;
		case 204:
			result = "골렘스킨 (" + percent + "%)";
			break;
		case 205:
			result = "데미지 반사 (" + percent + "%)";
			break;
		case 206:
			result = "데미지 반사 (" + percent + "%)";
			break;
		case 207:
			result = "데미지 반사 (" + percent + "%)";
			break;
		case 208:
			result = "데미지 반사 (" + percent + "%)";
			break;
		case 209:
			result = "데미지 반사 (" + percent + "%)";
			break;
		case 309:
			result = "텔레포트 (" + percent + "%)";
			break;
		case 316:
			result = "독 데미지 초당 -4 (" + percent + "%)";
			break;
		case 317:
			result = "독 데미지 초당 -5 (" + percent + "%)";
			break;
		case 318:
			result = "독 데미지 초당 -6 (" + percent + "%)";
			break;
		case 319:
			result = "독 데미지 초당 -7 (" + percent + "%)";
			break;
		case 320:
			result = "독 데미지 초당 -8 (" + percent + "%)";
			break;
		case 321:
			result = "부스터 불가 5초 (" + percent + "%)";
			break;
		case 322:
			result = "부스터 불가 5.5초 (" + percent + "%)";
			break;
		case 300:
			result = "부스터 불가 6초 (" + percent + "%)";
			break;
		case 323:
			result = "부스터 불가 6.5초 (" + percent + "%)";
			break;
		case 324:
			result = "부스터 불가 7초 (" + percent + "%)";
			break;
		case 325:
			result = "공격1 불가 1초 (" + percent + "%)";
			break;
		case 326:
			result = "공격1 불가 1.5초 (" + percent + "%)";
			break;
		case 301:
			result = "공격1 불가 2초 (" + percent + "%)";
			break;
		case 327:
			result = "공격1 불가 2.5초 (" + percent + "%)";
			break;
		case 328:
			result = "공격1 불가 3초 (" + percent + "%)";
			break;
		case 329:
			result = "디펜스 불가 0.5초 (" + percent + "%)";
			break;
		case 330:
			result = "디펜스 불가 1초 (" + percent + "%)";
			break;
		case 302:
			result = "디펜스 불가 1.5초 (" + percent + "%)";
			break;
		case 331:
			result = "디펜스 불가 2초 (" + percent + "%)";
			break;
		case 332:
			result = "디펜스 불가 2.5초 (" + percent + "%)";
			break;
		case 333:
			result = "회전 2초 (" + percent + "%)";
			break;
		case 334:
			result = "회전 3초 (" + percent + "%)";
			break;
		case 303:
			result = "회전 4초 (" + percent + "%)";
			break;
		case 335:
			result = "회전 5초 (" + percent + "%)";
			break;
		case 336:
			result = "회전 6초 (" + percent + "%)";
			break;
		case 337:
			result = "빙글빙글 1초 (" + percent + "%)";
			break;
		case 338:
			result = "빙글빙글 1.5초 (" + percent + "%)";
			break;
		case 304:
			result = "빙글빙글 2초 (" + percent + "%)";
			break;
		case 339:
			result = "빙글빙글 2.5초 (" + percent + "%)";
			break;
		case 340:
			result = "빙글빙글 3초 (" + percent + "%)";
			break;
		case 341:
			result = "회전 불가 2초 (" + percent + "%)";
			break;
		case 342:
			result = "회전 불가 2.5초 (" + percent + "%)";
			break;
		case 305:
			result = "회전 불가 3초 (" + percent + "%)";
			break;
		case 343:
			result = "회전 불가 3.5초 (" + percent + "%)";
			break;
		case 344:
			result = "회전 불가 4초 (" + percent + "%)";
			break;
		case 345:
			result = "공격2 불가 0.5초 (" + percent + "%)";
			break;
		case 346:
			result = "공격2 불가 1초 (" + percent + "%)";
			break;
		case 306:
			result = "공격2 불가 1.5초 (" + percent + "%)";
			break;
		case 347:
			result = "공격2 불가 2초 (" + percent + "%)";
			break;
		case 348:
			result = "공격2 불가 2.5초 (" + percent + "%)";
			break;
		case 349:
			result = "인비져블 1초 (" + percent + "%)";
			break;
		case 350:
			result = "인비져블 1.5초 (" + percent + "%)";
			break;
		case 310:
			result = "인비져블 2초 (" + percent + "%)";
			break;
		case 351:
			result = "인비져블 2.5초 (" + percent + "%)";
			break;
		case 352:
			result = "인비져블 3초 (" + percent + "%)";
			break;
		case 353:
			result = "흡수방패 1초 (" + percent + "%)";
			break;
		case 354:
			result = "흡수방패 2초 (" + percent + "%)";
			break;
		case 307:
			result = "흡수방패 3초 (" + percent + "%)";
			break;
		case 355:
			result = "흡수방패 4초 (" + percent + "%)";
			break;
		case 356:
			result = "흡수방패 5초 (" + percent + "%)";
			break;
		case 308:
			result = "프로텍트 0.5초 (" + percent + "%)";
			break;
		case 357:
			result = "프로텍트 0.5초 (" + percent + "%)";
			break;
		case 358:
			result = "프로텍트 0.5초 (" + percent + "%)";
			break;
		case 359:
			result = "프로텍트 1초 (" + percent + "%)";
			break;
		case 360:
			result = "프로텍트 1.5초 (" + percent + "%)";
			break;
		case 361:
			result = "이빌아이 6초 (" + percent + "%)";
			break;
		case 362:
			result = "이빌아이 6.5초 (" + percent + "%)";
			break;
		case 311:
			result = "이빌아이 7초 (" + percent + "%)";
			break;
		case 363:
			result = "이빌아이 7.5초 (" + percent + "%)";
			break;
		case 364:
			result = "이빌아이 8초 (" + percent + "%)";
			break;
		case 365:
			result = "나침반 8초 (" + percent + "%)";
			break;
		case 366:
			result = "나침반 8.5초 (" + percent + "%)";
			break;
		case 312:
			result = "나침반 9초 (" + percent + "%)";
			break;
		case 367:
			result = "나침반 9.5초 (" + percent + "%)";
			break;
		case 368:
			result = "나침반 10초 (" + percent + "%)";
			break;
		case 369:
			result = "가속신발 2초 (" + percent + "%)";
			break;
		case 370:
			result = "가속신발 3초 (" + percent + "%)";
			break;
		case 313:
			result = "가속신발 4초 (" + percent + "%)";
			break;
		case 371:
			result = "가속신발 5초 (" + percent + "%)";
			break;
		case 372:
			result = "가속신발 6초 (" + percent + "%)";
			break;
		case 314:
			result = "회복 불가 5초 (" + percent + "%)";
			break;
		case 373:
			result = "회복 불가 5.5초 (" + percent + "%)";
			break;
		case 374:
			result = "회복 불가 6초 (" + percent + "%)";
			break;
		case 375:
			result = "회복 불가 6.5초 (" + percent + "%)";
			break;
		case 376:
			result = "회복 불가 7초 (" + percent + "%)";
			break;
		case 377:
			result = "정지 5초 (" + percent + "%)";
			break;
		case 378:
			result = "정지 5.5초 (" + percent + "%)";
			break;
		case 315:
			result = "정지 6초 (" + percent + "%)";
			break;
		case 379:
			result = "정지 6.5초 (" + percent + "%)";
			break;
		case 380:
			result = "정지 7초 (" + percent + "%)";
			break;
		case 381:
			result = "공격 둔화 5초 (" + percent + "%)";
			break;
		case 382:
			result = "공격 둔화 5.5초 (" + percent + "%)";
			break;
		case 383:
			result = "공격 둔화 6초 (" + percent + "%)";
			break;
		case 384:
			result = "공격 둔화 6.5초 (" + percent + "%)";
			break;
		case 385:
			result = "공격 둔화 7초 (" + percent + "%)";
			break;
		case 386:
			result = "특수스킬 발동불가 11초 (" + percent + "%)";
			break;
		case 387:
			result = "특수스킬 발동불가 11.5초 (" + percent + "%)";
			break;
		case 388:
			result = "특수스킬 발동불가 12초 (" + percent + "%)";
			break;
		case 389:
			result = "특수스킬 발동불가 12.5초 (" + percent + "%)";
			break;
		case 390:
			result = "특수스킬 발동불가 13초 (" + percent + "%)";
			break;
		case 391:
			result = "도끼카드 발동불가 11초 (" + percent + "%)";
			break;
		case 392:
			result = "도끼카드 발동불가 11.5초 (" + percent + "%)";
			break;
		case 393:
			result = "도끼카드 발동불가 12초 (" + percent + "%)";
			break;
		case 394:
			result = "도끼카드 발동불가 12.5초 (" + percent + "%)";
			break;
		case 395:
			result = "도끼카드 발동불가 13초 (" + percent + "%)";
			break;
		case 396:
			result = "검카드 발동불가 11초 (" + percent + "%)";
			break;
		case 397:
			result = "검카드 발동불가 11.5초 (" + percent + "%)";
			break;
		case 398:
			result = "검카드 발동불가 12초 (" + percent + "%)";
			break;
		case 399:
			result = "검카드 발동불가 12.5초 (" + percent + "%)";
			break;
		case 400:
			result = "검카드 발동불가 13초 (" + percent + "%)";
			break;
		case 401:
			result = "활카드 발동불가 11초 (" + percent + "%)";
			break;
		case 402:
			result = "활카드 발동불가 11.5초 (" + percent + "%)";
			break;
		case 403:
			result = "활카드 발동불가 12초 (" + percent + "%)";
			break;
		case 404:
			result = "활카드 발동불가 12.5초 (" + percent + "%)";
			break;
		case 405:
			result = "활카드 발동불가 13초 (" + percent + "%)";
			break;
		case 411:
			result = "방패카드 발동불가 11초 (" + percent + "%)";
			break;
		case 412:
			result = "방패카드 발동불가 11.5초 (" + percent + "%)";
			break;
		case 413:
			result = "방패카드 발동불가 12초 (" + percent + "%)";
			break;
		case 414:
			result = "방패카드 발동불가 12.5초 (" + percent + "%)";
			break;
		case 415:
			result = "방패카드 발동불가 13초 (" + percent + "%)";
			break;
		case 406:
			result = "지팡이카드 발동불가 11초 (" + percent + "%)";
			break;
		case 407:
			result = "지팡이카드 발동불가 11.5초 (" + percent + "%)";
			break;
		case 408:
			result = "지팡이카드 발동불가 12초 (" + percent + "%)";
			break;
		case 409:
			result = "지팡이카드 발동불가 12.5초 (" + percent + "%)";
			break;
		case 410:
			result = "지팡이카드 발동불가 13초 (" + percent + "%)";
			break;
		case 416:
			result = "갑옷카드 발동불가 11초 (" + percent + "%)";
			break;
		case 417:
			result = "갑옷카드 발동불가 11.5초 (" + percent + "%)";
			break;
		case 418:
			result = "갑옷카드 발동불가 12초 (" + percent + "%)";
			break;
		case 419:
			result = "갑옷카드 발동불가 12.5초 (" + percent + "%)";
			break;
		case 420:
			result = "갑옷카드 발동불가 13초 (" + percent + "%)";
			break;
		case 421:
			result = "펜던트카드 발동불가 11초 (" + percent + "%)";
			break;
		case 422:
			result = "펜던트카드 발동불가 11.5초 (" + percent + "%)";
			break;
		case 423:
			result = "펜던트카드 발동불가 12초 (" + percent + "%)";
			break;
		case 424:
			result = "펜던트카드 발동불가 12.5초 (" + percent + "%)";
			break;
		case 425:
			result = "펜던트카드 발동불가 13초 (" + percent + "%)";
			break;
		case 426:
			result = "부츠카드 발동불가 11초 (" + percent + "%)";
			break;
		case 427:
			result = "부츠카드 발동불가 11.5초 (" + percent + "%)";
			break;
		case 428:
			result = "부츠카드 발동불가 12초 (" + percent + "%)";
			break;
		case 429:
			result = "부츠카드 발동불가 12.5초 (" + percent + "%)";
			break;
		case 430:
			result = "부츠카드 발동불가 13초 (" + percent + "%)";
			break;
		case 431:
			result = "마법카드 발동불가 11초 (" + percent + "%)";
			break;
		case 432:
			result = "마법카드 발동불가 11.5초 (" + percent + "%)";
			break;
		case 433:
			result = "마법카드 발동불가 12초 (" + percent + "%)";
			break;
		case 434:
			result = "마법카드 발동불가 12.5초 (" + percent + "%)";
			break;
		case 435:
			result = "마법카드 발동불가 13초 (" + percent + "%)";
			break;
		default:
			result = "";
			break;
		}
		result = result.replace(".0", "");
		return result;
	}
	
	public int search_shop_type(String search_shop_type) {
		int result = -1;
		if(search_shop_type.equals("--")) {
			result = -1;
		}else if(search_shop_type.equals("방패")) {
			result = 21;
		}else if(search_shop_type.equals("갑옷")) {
			result = 23;
		}else if(search_shop_type.equals("펜던트")) {
			result = 22;
		}else if(search_shop_type.equals("부츠")) {
			result = 24;
		}else if(search_shop_type.equals("칼")) {
			result = 13;
		}else if(search_shop_type.equals("도끼")) {
			result = 11;
		}else if(search_shop_type.equals("지팡이")) {
			result = 12;
		}else if(search_shop_type.equals("활")) {
			result = 14;
		}else if(search_shop_type.equals("마법")) {
			result = 31;
		}else if(search_shop_type.equals("정령")) {
			result = 0;
		}else if(search_shop_type.equals("실버")) {
			result = 90;
		}else if(search_shop_type.equals("아바타")) {
			result = 92;
		}else if(search_shop_type.equals("골드포스")) {
			result = 91;
		}else {
			result = -1;
		}
		return result;
	}
	
	public int search_shop_element(String search_shop_element) {
		int result = -1;
		if(search_shop_element.equals("--")) {
			result = -1;
		}else if(search_shop_element.equals("물")) {
			result = 1;
		}else if(search_shop_element.equals("불")) {
			result = 2;
		}else if(search_shop_element.equals("흙")) {
			result = 3;
		}else if(search_shop_element.equals("바람")) {
			result = 4;
		}else {
			result = -1;
		}
		return result;
		
	}
	
	public int search_card_level(String search_card_level) {
		int result = -1;
		if(search_card_level.equals("--")) {
			result = -1;
		}else if(search_card_level.equals("1")) {
			result = 0;
		}else if(search_card_level.equals("2")) {
			result = 1;
		}else if(search_card_level.equals("3")) {
			result = 2;
		}else if(search_card_level.equals("4")) {
			result = 3;
		}else if(search_card_level.equals("5")) {
			result = 4;
		}else if(search_card_level.equals("6")) {
			result = 5;
		}else if(search_card_level.equals("7")) {
			result = 6;
		}else if(search_card_level.equals("8")) {
			result = 7;
		}else if(search_card_level.equals("9")) {
			result = 8;
		}else {
			result = -1;
		}
		return result;

	}

}
