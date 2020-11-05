package api;

import items.AvatarCard;
import items.GoldForceCard;
import items.PetCard;
import items.SPCard;
import items.SilverCard;

public class UserCardImgManager {

	public static final int WEAPON = 1;
	public static final int ACCESSORY = 2;
	public static final int MAGIC = 3;

	public static final int AXE = 1;
	public static final int STAFF = 2;
	public static final int SWORD = 3;
	public static final int BOW = 4;

	public static final int SHIELD = 1;
	public static final int PENDANT = 2;
	public static final int ARMOR = 3;
	public static final int BOOTS = 4;

	public static final int WATER = 1;
	public static final int FIRE = 2;
	public static final int EARTH = 3;
	public static final int WIND = 4;
	public PetCard Pet;

	public UserCardImgManager() {

	}

	public String userSPCardImg(int itm_type, int itm_level, boolean isSprit) {
		if(isSprit == false) {
			System.out.println("isSprit : "+isSprit);
			if(itm_type > 9999) {
				itm_type = itm_type % 10000;
				System.out.println("itm_type : "+itm_type);
			}
		}
		String imgMainPath = "img/CARD/";
		String imgPath = "";
		String imgSubPath = "";
		boolean notLevel = false;
		int imgNotFound = 0;
		int card_main_type = itm_type / 1000;
		int card_type = (itm_type / 100) % 10;
		int card_element = (itm_type / 10) % 10;
		int card_subType = itm_type % 10;
		if (itm_type > 9999) {
			notLevel = true;
			imgSubPath = "SPIRITCARD/";
			if (itm_type > 9999 && itm_type < 20000) {
				imgSubPath = imgSubPath + "water_spirit";
			} else if (itm_type > 19999 && itm_type < 30000) {
				imgSubPath = imgSubPath + "fire_spirit";
			} else if (itm_type > 29999 && itm_type < 40000) {
				imgSubPath = imgSubPath + "earth_spirit";
			} else {
				imgSubPath = imgSubPath + "wind_spirit";
			}
		} else {
			if (card_main_type == SPCard.USER_CARD) {
				itm_level++;
				imgSubPath = "SPCARD/";
				if (card_element == WATER) {
					imgSubPath = imgSubPath + "water_";
					if (card_type == MAGIC) {
						imgSubPath = imgSubPath + "magic_";
					} else if (card_type == WEAPON) {
						switch (card_subType) {
						case AXE:
							imgSubPath = imgSubPath + "axe_";
							break;
						case SWORD:
							imgSubPath = imgSubPath + "sword_";
							break;
						case STAFF:
							imgSubPath = imgSubPath + "wand_";
							break;
						case BOW:
							imgSubPath = imgSubPath + "bow_";
							break;
						}
					} else if (card_type == ACCESSORY) {
						switch (card_subType) {
						case SHIELD:
							imgSubPath = imgSubPath + "shield_";
							break;
						case PENDANT:
							imgSubPath = imgSubPath + "pen_";
							break;
						case ARMOR:
							imgSubPath = imgSubPath + "armor_";
							break;
						case BOOTS:
							imgSubPath = imgSubPath + "boots_";
							break;
						}
					}
				} else if (card_element == FIRE) {
					imgSubPath = imgSubPath + "fire_";
					if (card_type == MAGIC) {
						imgSubPath = imgSubPath + "magic_";
					} else if (card_type == WEAPON) {
						switch (card_subType) {
						case AXE:
							imgSubPath = imgSubPath + "axe_";
							break;
						case SWORD:
							imgSubPath = imgSubPath + "sword_";
							break;
						case STAFF:
							imgSubPath = imgSubPath + "wand_";
							break;
						case BOW:
							imgSubPath = imgSubPath + "bow_";
							break;
						}
					} else if (card_type == ACCESSORY) {
						switch (card_subType) {
						case SHIELD:
							imgSubPath = imgSubPath + "shield_";
							break;
						case PENDANT:
							imgSubPath = imgSubPath + "pen_";
							break;
						case ARMOR:
							imgSubPath = imgSubPath + "armor_";
							break;
						case BOOTS:
							imgSubPath = imgSubPath + "boots_";
							break;
						}
					}
				} else if (card_element == EARTH) {
					imgSubPath = imgSubPath + "earth_";
					if (card_type == MAGIC) {
						imgSubPath = imgSubPath + "magic_";
					} else if (card_type == WEAPON) {
						switch (card_subType) {
						case AXE:
							imgSubPath = imgSubPath + "axe_";
							break;
						case SWORD:
							imgSubPath = imgSubPath + "sword_";
							break;
						case STAFF:
							imgSubPath = imgSubPath + "wand_";
							break;
						case BOW:
							imgSubPath = imgSubPath + "bow_";
							break;
						}
					} else if (card_type == ACCESSORY) {
						switch (card_subType) {
						case SHIELD:
							imgSubPath = imgSubPath + "shield_";
							break;
						case PENDANT:
							imgSubPath = imgSubPath + "pen_";
							break;
						case ARMOR:
							imgSubPath = imgSubPath + "armor_";
							break;
						case BOOTS:
							imgSubPath = imgSubPath + "boots_";
							break;
						}
					}
				} else if (card_element == WIND) {
					imgSubPath = imgSubPath + "wind_";
					if (card_type == MAGIC) {
						imgSubPath = imgSubPath + "magic_";
					} else if (card_type == WEAPON) {
						switch (card_subType) {
						case AXE:
							imgSubPath = imgSubPath + "axe_";
							break;
						case SWORD:
							imgSubPath = imgSubPath + "sword_";
							break;
						case STAFF:
							imgSubPath = imgSubPath + "wand_";
							break;
						case BOW:
							imgSubPath = imgSubPath + "bow_";
							break;
						}
					} else if (card_type == ACCESSORY) {
						switch (card_subType) {
						case SHIELD:
							imgSubPath = imgSubPath + "shield_";
							break;
						case PENDANT:
							imgSubPath = imgSubPath + "pen_";
							break;
						case ARMOR:
							imgSubPath = imgSubPath + "armor_";
							break;
						case BOOTS:
							imgSubPath = imgSubPath + "boots_";
							break;
						}
					}
				}
			} else if (card_main_type == SPCard.SILVER_CARD) {
				imgSubPath = "SILVERCARD/";
				switch (itm_type) {
				case SilverCard.MASTER:
					notLevel = true;
					imgSubPath = imgSubPath + "MASTER";
					break;
				case SilverCard.USERSHOP:
					notLevel = true;
					imgSubPath = imgSubPath + "USERSHOP";
					break;
				case SilverCard.ANGEL_EYE:
					notLevel = true;
					imgSubPath = imgSubPath + "ANGEL_EYE";
					break;
				case SilverCard.QUEST_LIFE:
					notLevel = true;
					imgSubPath = imgSubPath + "QUEST_LIFE";
					break;
				case SilverCard.CARD_SLOT6:
					notLevel = true;
					imgSubPath = imgSubPath + "CARD_SLOT6";
					break;
				case SilverCard.CARD_SLOT12:
					notLevel = true;
					imgSubPath = imgSubPath + "CARD_SLOT12";
					break;
				case SilverCard.VISIT_BONUS:
					notLevel = true;
					imgSubPath = imgSubPath + "VISIT_BONUS";
					break;
				case SilverCard.SKULL_BOOSTER:
					notLevel = true;
					imgSubPath = imgSubPath + "SKULL_BOOSTER";
					break;
				case SilverCard.STAR_BOOSTER:
					notLevel = true;
					imgSubPath = imgSubPath + "STAR_BOOSTER";
					break;
				case SilverCard.USERSHOP2:
					imgSubPath = imgSubPath + "USERSHOP2_";
					break;
				case SilverCard.TIME_BONUS:
					notLevel = true;
					imgSubPath = imgSubPath + "TIME_BONUS";
					break;
				case SilverCard.USERSHOP2_AGAIN:
					imgSubPath = imgSubPath + "USERSHOP2_AGAIN_";
					break;
				case SilverCard.MOON_BOOSTER:
					notLevel = true;
					imgSubPath = imgSubPath + "MOON_BOOSTER";
					break;
				case SilverCard.LEVEL_FUSION:
					imgSubPath = imgSubPath + "LEVEL_FUSION_";
					break;
				case SilverCard.SKILL_FUSION:
					imgSubPath = imgSubPath + "SKILL_FUSION_";
					break;
				case SilverCard.SKILL1_FUSION:
					imgSubPath = imgSubPath + "SKILL1_FUSION_";
					break;
				case SilverCard.SKILL2_FUSION:
					imgSubPath = imgSubPath + "SKILL2_FUSION_";
					break;
				case SilverCard.ELEMENTAL_BONUS:
					notLevel = true;
					imgSubPath = imgSubPath + "ELEMENTAL_BONUS";
					break;
				case SilverCard.SKILL_1_1_FUSION:
					imgSubPath = imgSubPath + "SKILL_1_1_FUSION_";
					break;
				case SilverCard.SKILL_2_1_FUSION:
					imgSubPath = imgSubPath + "SKILL_2_1_FUSION_";
					break;
				case SilverCard.SKILL_2_2_FUSION:
					imgSubPath = imgSubPath + "SKILL_2_2_FUSION_";
					break;
				case SilverCard.PREMIUM_EVENT:
					notLevel = true;
					imgSubPath = imgSubPath + "PREMIUM_EVENT";
					break;
				case SilverCard.CHARACTER_SET:
					notLevel = true;
					imgSubPath = imgSubPath + "CHARACTER_SET";
					break;
				case SilverCard.CHARACTER_MASTER_SET:
					notLevel = true;
					imgSubPath = imgSubPath + "CHARACTER_MASTER_SET";
					break;
				case SilverCard.SUPER_SILVER_WATER:
					notLevel = true;
					imgSubPath = imgSubPath + "SUPER_SILVER_WATER";
					break;
				case SilverCard.SUPER_SILVER_FIRE:
					notLevel = true;
					imgSubPath = imgSubPath + "SUPER_SILVER_FIRE";
					break;
				case SilverCard.SUPER_SILVER_EARTH:
					notLevel = true;
					imgSubPath = imgSubPath + "SUPER_SILVER_EARTH";
					break;
				case SilverCard.SUPER_SLIVER_WIND:
					notLevel = true;
					imgSubPath = imgSubPath + "SUPER_SLIVER_WIND";
					break;
				case SilverCard.XYRHO:
					notLevel = true;
					imgSubPath = imgSubPath + "XYRHO";
					break;
				case SilverCard.SHAMOO:
					notLevel = true;
					imgSubPath = imgSubPath + "SHAMOO";
					break;
				case SilverCard.SVEN:
					notLevel = true;
					imgSubPath = imgSubPath + "SVEN";
					break;
				case SilverCard.CREAM:
					notLevel = true;
					imgSubPath = imgSubPath + "CREAM";
					break;
				case SilverCard.ROLAND:
					notLevel = true;
					imgSubPath = imgSubPath + "ROLAND";
					break;
				case SilverCard.AURELLI:
					notLevel = true;
					imgSubPath = imgSubPath + "AURELLI";
					break;
				case SilverCard.HAWK:
					notLevel = true;
					imgSubPath = imgSubPath + "HAWK";
					break;
				case SilverCard.HAZEL:
					notLevel = true;
					imgSubPath = imgSubPath + "HAZEL";
					break;
				case SilverCard.KARA:
					notLevel = true;
					imgSubPath = imgSubPath + "KARA";
					break;
				case SilverCard.WARREN:
					notLevel = true;
					imgSubPath = imgSubPath + "WARREN";
					break;
				case SilverCard.LUCY:
					notLevel = true;
					imgSubPath = imgSubPath + "LUCY";
					break;
				case SilverCard.WILL:
					notLevel = true;
					imgSubPath = imgSubPath + "WILL";
					break;
				default:
					imgNotFound = 1;
					break;
				}
			} else if (card_main_type == SPCard.GOLD_CARD) {
				notLevel = true;
				imgSubPath = "GOLDFORCE/";
				switch (itm_type) {
				case GoldForceCard.MAGIC_FORCE_365:
					imgSubPath = imgSubPath + "MAGIC_FORCE_365";
					break;
				case GoldForceCard.BOW_FORCE_365:
					imgSubPath = imgSubPath + "BOW_FORCE_365";
					break;
				case GoldForceCard.SWORD_FORCE_365:
					imgSubPath = imgSubPath + "SWORD_FORCE_365";
					break;
				case GoldForceCard.AXE_FORCE_365:
					imgSubPath = imgSubPath + "AXE_FORCE_365";
					break;
				case GoldForceCard.WAND_FORCE_365:
					imgSubPath = imgSubPath + "WAND_FORCE_365";
					break;
				case GoldForceCard.SHIELD_FORCE_365:
					imgSubPath = imgSubPath + "SHIELD_FORCE_365";
					break;
				case GoldForceCard.PENDENT_FORCE_365:
					imgSubPath = imgSubPath + "PENDENT_FORCE_365";
					break;
				case GoldForceCard.ARMOR_FORCE_365:
					imgSubPath = imgSubPath + "ARMOR_FORCE_365";
					break;
				case GoldForceCard.BOOTS_FORCE_365:
					imgSubPath = imgSubPath + "BOOTS_FORCE_365";
					break;
				case GoldForceCard.MAGIC_FORCE_30:
					imgSubPath = imgSubPath + "MAGIC_FORCE_30";
					break;
				case GoldForceCard.BOW_FORCE_30:
					imgSubPath = imgSubPath + "BOW_FORCE_30";
					break;
				case GoldForceCard.SWORD_FORCE_30:
					imgSubPath = imgSubPath + "SWORD_FORCE_30";
					break;
				case GoldForceCard.AXE_FORCE_30:
					imgSubPath = imgSubPath + "AXE_FORCE_30";
					break;
				case GoldForceCard.WAND_FORCE_30:
					imgSubPath = imgSubPath + "WAND_FORCE_30";
					break;
				case GoldForceCard.SHIELD_FORCE_30:
					imgSubPath = imgSubPath + "SHIELD_FORCE_30";
					break;
				case GoldForceCard.PENDENT_FORCE_30:
					imgSubPath = imgSubPath + "PENDENT_FORCE_30";
					break;
				case GoldForceCard.ARMOR_FORCE_30:
					imgSubPath = imgSubPath + "ARMOR_FORCE_30";
					break;
				case GoldForceCard.BOOTS_FORCE_30:
					imgSubPath = imgSubPath + "BOOTS_FORCE_30";
					break;
				default:
					imgNotFound = 1;
					break;
				}
			} else if (card_main_type == SPCard.AVATAR_CARD) {
				notLevel = true;
				imgSubPath = "AVATARCARD/";
				switch (itm_type) {
				case AvatarCard.ARME_BLANCHE:
					imgSubPath = imgSubPath + "ARME_BLANCHE";
					break;
				case AvatarCard.LONG_SWORD:
					imgSubPath = imgSubPath + "LONG_SWORD";
					break;
				case AvatarCard.MAGIC_WAND:
					imgSubPath = imgSubPath + "MAGIC_WAND";
					break;
				case AvatarCard.HAND_CANNON:
					imgSubPath = imgSubPath + "HAND_CANNON";
					break;
				case AvatarCard.SMALL_CROSSBOW:
					imgSubPath = imgSubPath + "SMALL_CROSSBOW";
					break;
				case AvatarCard.SHORT_CROW:
					imgSubPath = imgSubPath + "SHORT_CROW";
					break;
				case AvatarCard.IRON_HELM:
					imgSubPath = imgSubPath + "IRON_HELM";
					break;
				case AvatarCard.BROWN_GOGGLE:
					imgSubPath = imgSubPath + "BROWN_GOGGLE";
					break;
				case AvatarCard.MAGIC_CAP:
					imgSubPath = imgSubPath + "MAGIC_CAP";
					break;
				case AvatarCard.PANDA_HELMET:
					imgSubPath = imgSubPath + "PANDA_HELMET";
					break;
				case AvatarCard.SANTA_MAGIC_CAP:
					imgSubPath = imgSubPath + "SANTA_MAGIC_CAP";
					break;
				case AvatarCard.PLATE_ARMOR:
					imgSubPath = imgSubPath + "PLATE_ARMOR";
					break;
				case AvatarCard.HIGH_LEATHER_ARMOR:
					imgSubPath = imgSubPath + "HIGH_LEATHER_ARMOR";
					break;
				case AvatarCard.MAGIC_ROBE:
					imgSubPath = imgSubPath + "MAGIC_ROBE";
					break;
				case AvatarCard.STEEL_BOOTS:
					imgSubPath = imgSubPath + "STEEL_BOOTS";
					break;
				case AvatarCard.SILVER_BOOTS:
					imgSubPath = imgSubPath + "SILVER_BOOTS";
					break;
				case AvatarCard.LEATHER_BOOTS:
					imgSubPath = imgSubPath + "LEATHER_BOOTS";
					break;
				case AvatarCard.YELLOW_HAIR:
					imgSubPath = imgSubPath + "YELLOW_HAIR";
					break;
				case AvatarCard.RED_HAIR:
					imgSubPath = imgSubPath + "RED_HAIR";
					break;
				case AvatarCard.GRAY_HAIR:
					imgSubPath = imgSubPath + "GRAY_HAIR";
					break;
				case AvatarCard.SERIOUS_FACE:
					imgSubPath = imgSubPath + "SERIOUS_FACE";
					break;
				case AvatarCard.SLEEPING_FACE:
					imgSubPath = imgSubPath + "SLEEPING_FACE";
					break;
				case AvatarCard.SMILING_FACE:
					imgSubPath = imgSubPath + "SMILING_FACE";
					break;
				default:
					imgNotFound = 1;
					break;
				}
			} else if (card_main_type == SPCard.PET_CARD) {
				notLevel = true;
				imgSubPath = "PETCARD/";
				switch (itm_type) {
				case PetCard.GREEN_SLIME:
					imgSubPath = imgSubPath + "green_slime";
					break;
				case PetCard.PURPLE_SLIME:
					imgSubPath = imgSubPath + "purple_slime";
					break;
				case PetCard.BLUE_SLIME:
					imgSubPath = imgSubPath + "blue_slime";
					break;
				case PetCard.SKULL_MAGE:
					imgSubPath = imgSubPath + "skull_mage";
					break;
				case PetCard.GOBLIN_SHAMAN:
					imgSubPath = imgSubPath + "goblin_shaman";
					break;
				case PetCard.MAGMA_GOLEM:
					imgSubPath = imgSubPath + "magma_golem";
					break;
				case PetCard.STONE_GOLEM:
					imgSubPath = imgSubPath + "stone_golem";
					break;
				case PetCard.BIGGLE:
					imgSubPath = imgSubPath + "biggle";
					break;
				case PetCard.SANTA_CLAUS:
					imgSubPath = imgSubPath + "santa_claus";
					break;
				case PetCard.REO_KOREA:
					imgSubPath = imgSubPath + "reo_korea";
					break;
				case PetCard.REO:
					imgSubPath = imgSubPath + "reo";
					break;
				case PetCard.RED_DRAGON:
					imgSubPath = imgSubPath + "red_dragon";
					break;
				case PetCard.MINI_PIG:
					imgSubPath = imgSubPath + "mini_pig";
					break;
				case PetCard.MAGIC_PENGUIN:
					imgSubPath = imgSubPath + "magic_penguin";
					break;
				case PetCard.SNOW_MAN:
					imgSubPath = imgSubPath + "snow_man";
					break;
				default:
					imgNotFound = 1;
					break;
				}
			} else {
				imgNotFound = 1;
			}
		}
		if (imgNotFound == 1)
			imgPath = "";
		else {
			if (notLevel == true) {
				imgPath = imgMainPath + imgSubPath + ".png";
			} else {
				String level = String.valueOf(itm_level);
				imgPath = imgMainPath + imgSubPath + level + ".png";
			}
		}
		System.out.println("cardimgPath : " + imgPath);
		return imgPath;
	}

	public String userPetCardImg(int itm_type) {
		System.out.println("itm_type : " + itm_type);
		String imgMainPath = "img/CARD/PETCARD/";
		String imgSubPath = "";
		String imgPath = "";
		int imgNotFound = 0;
		switch (itm_type) {
		case PetCard.GREEN_SLIME:
			imgSubPath = "green_slime";
			break;
		case PetCard.PURPLE_SLIME:
			imgSubPath = "purple_slime";
			break;
		case PetCard.BLUE_SLIME:
			imgSubPath = "blue_slime";
			break;
		case PetCard.SKULL_MAGE:
			imgSubPath = "skull_mage";
			break;
		case PetCard.GOBLIN_SHAMAN:
			imgSubPath = "goblin_shaman";
			break;
		case PetCard.MAGMA_GOLEM:
			imgSubPath = "magma_golem";
			break;
		case PetCard.STONE_GOLEM:
			imgSubPath = "stone_golem";
			break;
		case PetCard.BIGGLE:
			imgSubPath = "biggle";
			break;
		case PetCard.SANTA_CLAUS:
			imgSubPath = "santa_claus";
			break;
		case PetCard.REO_KOREA:
			imgSubPath = "reo_korea";
			break;
		case PetCard.REO:
			imgSubPath = "reo";
			break;
		case PetCard.RED_DRAGON:
			imgSubPath = "red_dragon";
			break;
		case PetCard.MINI_PIG:
			imgSubPath = "mini_pig";
			break;
		case PetCard.MAGIC_PENGUIN:
			imgSubPath = "magic_penguin";
			break;
		case PetCard.SNOW_MAN:
			imgSubPath = "snow_man";
			break;
		default:
			imgNotFound = 1;
			break;
		}
		if (imgNotFound == 1)
			imgPath = "";
		else
			imgPath = imgMainPath + imgSubPath + ".png";
		System.out.println("cardimgPath : " + imgPath);
		return imgPath;
	}
}
