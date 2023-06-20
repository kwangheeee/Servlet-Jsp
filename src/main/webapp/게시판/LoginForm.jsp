<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file= "Head.jsp" %>
<%@ include file="css/LoginCss.jsp"%>
	<%= request.getAttribute("loginErrMsg") == null ? "" : request.getAttribute("loginErrMsg") %>
	<%
		
		String storeId = "";
		if(session.getAttribute("userId") != null){
			storeId = (String)session.getAttribute("userId");
		}
		if(storeId == null) {storeId = "";}
	%>
	<div class="login-wrapper">
        <h2>Login</h2>
        <form method="post" action="LoginProcess.jsp" id="login-form">
            <input type="text" name="userId" placeholder="ID or Email" value="<%= storeId%>">
            <input type="password" name="userPw" placeholder="Password">
            <label for="remember-check">
                <input type="checkbox" id="remember-check" name="storeId" value="Y">아이디 저장하기
            </label>
            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>