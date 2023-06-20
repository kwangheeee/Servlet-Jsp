<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dto.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		Application영역
		
		웹서버가 실행시 실행되는 영역
		클라이언트가 요청하는 모든 페이지가 application영역을 공유
		웹서버를 종료할 떄 소멸
	 -->
	 <h2>Application 영역의 공유</h2>
	 <%
 	 Map<String, Person> maps = new HashMap<>();
	 maps.put("actor1", new Person("가가", 20));
	 maps.put("actor2", new Person("나나", 30));
	 
	 application.setAttribute("maps", maps);
	 
	 %>
	 
	 application 영역에 속성이 저장되었습니다.<br> <br>
	 <a href="applicationResult.jsp">application확인</a>
</body>
</html>