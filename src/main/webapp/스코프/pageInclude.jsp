<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "dto.Person" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <ul>
	 	<li>int : <%= pageContext.getAttribute("page_int") %></li>
	 	<li>String : <%= pageContext.getAttribute("page_str") %></li>
	 	<li>객체 : <%= pageContext.getAttribute("page_person") %></li>
	 </ul>
</body>
</html>