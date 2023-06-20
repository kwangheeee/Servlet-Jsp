<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Arrays"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 한글깨짐 처리 -->
	<%
		// 한글깨짐 - web.xml에서 설정이 가능
		request.setCharacterEncoding("UTF-8");
	 	String id = request.getParameter("id");
	 	String sex = request.getParameter("sex");
	 	String intro = request.getParameter("intro");
	 	String[] favo = request.getParameterValues("favo");
	 	String favoStr = "";
	 	out.println(Arrays.toString(favo));
	%>
	<ul>
		<li>아이디 : <%= id %></li>
		<li>성별 : <%= sex %></li>
		<li>관심사항 : <%= Arrays.toString(favo) %></li>
		
		<!-- 줄바꿈처리 -->
		<li>자개소개 : <%= intro.replace("/r/n", "<br>") %></li>
	</ul>
</body>
</html>