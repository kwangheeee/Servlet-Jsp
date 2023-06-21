<%@page import="dto.Member"%>
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
		// request영역에 객체를 생성 후 forward된 페이지에서 출력
		request.setAttribute("MemberObj", new Member("test","하니", "20","2023-06-19"));
		request.setAttribute("StringObj", "문자열");
		request.setAttribute("IntegerObj", new Integer(99));
	%>
	<h2>객체 매개변수</h2>
	<jsp:forward page="4ObjectResult.jsp">
		<jsp:param value="10" name="firstNum"/>
		<jsp:param value="20" name="secondNum"/>
	</jsp:forward>
</body>
</html>