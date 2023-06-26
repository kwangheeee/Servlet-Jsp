<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>mvc 패턴으로 회원 인증</h2>
	<a href="MemberAuth.mvc?userId=test&userPw=1234">연 ~ 결</a>
	<p>${authMessage }</p>
</body>
</html>