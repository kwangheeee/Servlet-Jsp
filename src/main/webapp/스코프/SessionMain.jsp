<%@page import="java.util.ArrayList"%>
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
		session ID를 발급 -> 응답객체의 쿠키에 담아서 브라우저로 전송
		웹브라우저는 응답을 받아서 쿠키에 저장 -> 서버에 요청시 쿠키정보를 담아서 요청
		
		사용자가 웹브라우저를 열고 서버에 접근해서 웹브라우저를 닫을때 까지
		요청하는 모든 페이지는 세션 객체를 고융 할 수 있습니다.
		히ㅗ원인증 후 로그인 상태를 유지하는 처리에 사용된다.
		(로그인 상태에서 웹브라우저를 닫으면 로그아웃 되는 이유)
		
		웹브라우저를 닫았다가 다시 열면 세션객체에 저장된 값이 사라지는것을 확일할 수 있다.
	 -->
	 
	 <%
	 	session.setAttribute("person", new Person("서현", 22));
	 	ArrayList<String> list = new ArrayList<>();
		list.add("성현");	 
		list.add("시현");
	 	session.setAttribute("list", list);
	 %>
	 
	 <h2>페이지가 이동된 후 session 영역의 속성 읽기</h2>
	 <a href = "SessionLocation.jsp">SessionLocation.jsp 바로가기</a>
	 <a href = "SessionInvalidate.jsp">SessionInvalidate.jsp 바로가기</a>
</body>
</html>