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
		Cookie cookie = new Cookie("popupClose", "Y");
		cookie.setMaxAge(3600);
		response.addCookie(cookie);
		
	%>
</body>
</html>