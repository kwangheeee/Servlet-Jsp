<%@page import="el.MyElClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		MyElClass m = new MyElClass();
		pageContext.setAttribute("myClass", m);
		pageContext.setAttribute("response", response);	
		
		pageContext.setAttribute("number", "123-123");
		
	%>	
	<h3>영역에 저장 후 메서드 호출</h3>
	980322-1111111 => ${myClass.getGender("980322-1111111")} <br>
	980322-2111111 => ${myClass.getGender("980322-2111111")} <br>
	980322-2111111 => ${m.getGender("980322-2111111")} 요건 안되네<br>
	
	${MyElClass.isNumber("10") } <br>
	${MyElClass.isNumber("문광희") } <br>
	
	${MyElClass.showGugudan(9) } <br>
	
	<h3>정적메서드 호출하기  - 쿠키 생성하기</h3>
	${CookieManager.makeCookie(response, "eck", "쿠키쿠키쿠키쿠키쿠키쿠키쿠키쿠키키ㅣㅋ키키", 1000)} <br>
	${cookie.eck.value }
	
	<h3>메서드 호출하기</h3>
	${number.replace("-", "")}
	<%-- ${"123-123".replace("-", "")} --%>
</body>
</html>