<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class="dto.Person" scope="request"></jsp:useBean>
	
	이름<jsp:getProperty property="name" name="person"/>
	나이<jsp:getProperty property="age" name="person"/>

	<h2>forward된 페이지에서 매개변수 확인!</h2>
	<%= request.getParameter("param1") %><br>
	<%= request.getParameter("param2") %><br>
	<%= request.getParameter("param3") %><br>
	
	<!-- jsp:include 액션태그를 이용해 다른 페이지를 불러올때
			jsp:parm 액션태그 이용시 파라메터를 전달 할 수 있다. -->
	<h2>jsp:include페이지에 파라메터 넘기기</h2>
	<jsp:include page="inc/ParamInclude.jsp"></jsp:include>
	<jsp:setProperty property="도봉동" name="loc1"/>
	<jsp:setProperty property="도봉동" name="loc2"/>
</body>
</html>