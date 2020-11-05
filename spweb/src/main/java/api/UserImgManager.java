package api;

public class UserImgManager {

	public UserImgManager() {
		
	}
	
	public String userMainCharacterImg(int usr_char) {
		System.out.println("usr_char : "+usr_char);
		String imgPath = "";
		switch (usr_char) {
		case 10:
			imgPath = "img/character/d_Xyrho.jpg";
			break;
		case 20:
			imgPath = "img/character/d_Shamoo.jpg";
			break;
		case 30:
			imgPath = "img/character/d_Sven.jpg";
			break;
		case 40:
			imgPath = "img/character/d_Cream.jpg";
			break;
		case 50:
			imgPath = "img/character/d_Roland.jpg";
			break;
		case 60:
			imgPath = "img/character/d_Aurelli.jpg";
			break;
		case 70:
			imgPath = "img/character/d_Hawk.jpg";
			break;
		case 80:
			imgPath = "img/character/d_Hazel.jpg";
			break;
		case 90:
			imgPath = "img/character/d_Cara.jpg";
			break;
		case 100:
			imgPath = "img/character/d_Warren.jpg";
			break;
		case 110:
			imgPath = "img/character/d_Lucy.jpg";
			break;
		case 120:
			imgPath = "img/character/d_Will.jpg";
			break;
		case 130:
			imgPath = "img/character/p_Xyrho.jpg";
			break;
		case 140:
			imgPath = "img/character/p_Shamoo.jpg";
			break;
		case 150:
			imgPath = "img/character/p_Sven.jpg";
			break;
		case 160:
			imgPath = "img/character/p_Cream.jpg";
			break;
		case 170:
			imgPath = "img/character/p_Roland.jpg";
			break;
		case 180:
			imgPath = "img/character/p_Aurelli.jpg";
			break;
		case 190:
			imgPath = "img/character/p_Hawk.jpg";
			break;
		case 200:
			imgPath = "img/character/p_Hazel.jpg";
			break;
		case 210:
			imgPath = "img/character/p_Cara.jpg";
			break;
		case 220:
			imgPath = "img/character/p_Warren.jpg";
			break;
		case 230:
			imgPath = "img/character/p_Lucy.jpg";
			break;
		case 240:
			imgPath = "img/character/p_Will.jpg";
			break;
		case 250:
		case 260:
		case 270:
		case 280:
			imgPath = "img/character/p_Will.jpg";
			break;
		default:
			imgPath = "img/character/p_Will.jpg";
			break;
		}
		System.out.println("imgPath : "+imgPath);
		return imgPath;
	}
	
	public String userLevelImg(int level) {
		System.out.println("level : "+level);
		String imgPath = "";
		switch (level) {
		case 0:
			imgPath = "img/spimg/1.stone.png";
			break;
		case 1:
			imgPath = "img/spimg/2.jade1.png";
			break;
		case 2:
			imgPath = "img/spimg/2.jade2.png";
			break;
		case 3:
			imgPath = "img/spimg/2.jade3.png";
			break;
		case 4:
			imgPath = "img/spimg/2.jade4.png";
			break;
		case 5:
			imgPath = "img/spimg/3.topaz1.png";
			break;
		case 6:
			imgPath = "img/spimg/3.topaz2.png";
			break;
		case 7:
			imgPath = "img/spimg/3.topaz3.png";
			break;
		case 8:
			imgPath = "img/spimg/3.topaz4.png";
			break;
		case 9:
			imgPath = "img/spimg/4.opal1.png";
			break;
		case 10:
			imgPath = "img/spimg/4.opal2.png";
			break;
		case 11:
			imgPath = "img/spimg/4.opal3.png";
			break;
		case 12:
			imgPath = "img/spimg/4.opal4.png";
			break;
		case 13:
			imgPath = "img/spimg/5.gold1.png";
			break;
		case 14:
			imgPath = "img/spimg/5.gold2.png";
			break;
		case 15:
			imgPath = "img/spimg/5.gold3.png";
			break;
		case 16:
			imgPath = "img/spimg/5.gold4.png";
			break;
		case 17:
			imgPath = "img/spimg/6.star1.png";
			break;
		case 18:
			imgPath = "img/spimg/6.star2.png";
			break;
		case 19:
			imgPath = "img/spimg/6.star3.png";
			break;
		case 20:
			imgPath = "img/spimg/6.star4.png";
			break;
		case 21:
			imgPath = "img/spimg/7.moon1.png";
			break;
		case 22:
			imgPath = "img/spimg/7.moon2.png";
			break;
		case 23:
			imgPath = "img/spimg/7.moon3.png";
			break;
		case 24:
			imgPath = "img/spimg/7.moon4.png";
			break;
		case 25:
			imgPath = "img/spimg/8.sun1.png";
			break;
		case 26:
			imgPath = "img/spimg/8.sun2.png";
			break;
		case 27:
			imgPath = "img/spimg/8.sun3.png";
			break;
		case 28:
			imgPath = "img/spimg/8.sun4.png";
			break;
		case 29:
			imgPath = "img/spimg/9.soul1.png";
			break;
		case 30:
			imgPath = "img/spimg/9.soul2.png";
			break;
		case 31:
			imgPath = "img/spimg/9.soul3.png";
			break;
		case 32:
			imgPath = "img/spimg/9.soul4.png";
			break;
		default:
			imgPath = "img/spimg/9.soul4.png";
			break;
		}
		System.out.println("levelimgPath : "+imgPath);
		return imgPath;
	}
}
