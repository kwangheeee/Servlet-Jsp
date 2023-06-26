<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="css/BoardCss.jsp"%>

	<header class="top-menu con row" width='90%'>
        <div class="cell-right">
       
	<%
		if(session.getAttribute("userId") == null){
	%>
        <a href="LoginForm.jsp">로그인</a>
    <%}else{%>
    	<a href="Logout.jsp">로그아웃</a>
    <%}%>	
            <a href="#">회원가입</a>
            <a href="#">글 목록</a>
            <a href="#">글 작성</a>
        </div>
    </header>
</body>
</html>