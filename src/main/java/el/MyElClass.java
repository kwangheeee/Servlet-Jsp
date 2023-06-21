package el;

public class MyElClass {

	public MyElClass() {
		// TODO Auto-generated constructor stub
	}

	// 주민번호를 입력받아 성별을 반환 하는 메서드
	public static String getGender(String jumin) {
		return jumin.charAt(7)=='1'||jumin.charAt(6)=='3' ? "남자" : "여자";
	}
	
	// 입력받은 문자열이 숫자인지 판별하는 정적 메서드
	public static boolean isNumber(String value) {
		
		try{
			Integer.parseInt(value);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	
	// 입력받은 정수까지 구구단을 html 테이블로 출력합니다.
	// 1~9단까지 출력
	public static String showGugudan(int limitDan) {
		StringBuffer sb = new StringBuffer();
		sb.append("<table border='1'>");
		for(int i=2; i<=limitDan; i++) {
			sb.append("<tr>");
			for(int j=1; j<=9; j++) {
				sb.append("<td>");
					sb.append((i + "*" + j + "=" + i*j));
				sb.append("</td>");
			}
			sb.append("</tr>");
		}
		sb.append("</table>");
		return sb.toString();
	}
}
