<%@page import="utill.CookieManager"%>
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
		// 쿠키 생성 메서드 활용
		CookieManager.makeCookie(response, "close", "Y", 3600);
	%>
</body>
</html>