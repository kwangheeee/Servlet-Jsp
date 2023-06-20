package utill;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {
	// 쿠키 생성 메서드
	public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime) {
		Cookie cookie = new Cookie(cName, cValue);
		cookie.setMaxAge(cTime);
		response.addCookie(cookie);
	}
	
	// 쿠기 읽어오기 메서드
	public static String readCookie(HttpServletRequest request, String cName) {
		Cookie[] cookie = request.getCookies();
		String cValue = "";
		if(cookie != null) {
			for(Cookie ck : cookie) {
				if(ck.getName().equals(cName)) {
					cValue = ck.getValue();
					break;
				}
			}
		}
		return cValue;
	}
	
	// 쿠키 삭제 메서드
	public static void deletCookie(HttpServletResponse response, String cName) {
		makeCookie(response, cName, "", 0);
	}
	
}
