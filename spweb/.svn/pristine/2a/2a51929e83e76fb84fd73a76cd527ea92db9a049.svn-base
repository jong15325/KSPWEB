package api;

public class GetStringByteManager {

	public static int getStringByte(String str) {
		int en = 0;
		int ko = 0;
		int etc = 0;

		char[] string = str.toCharArray();

		for (int j = 0; j < string.length; j++) {
			if (string[j] >= 48 && string[j] <= 57) {
				en++;
			} else if (string[j] >= 65 && string[j] <= 122) {
				etc++;
			} else {
				ko++;
				ko++;
			}
		}

		return (en + ko + etc);
	}
}
