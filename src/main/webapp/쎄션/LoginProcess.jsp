<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Board"%>
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
	<%
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		MemberDao dao = new MemberDao();
		Member member = dao.login(id, pw);
		
		if(member != null){
			// 로그인 성공 -> 세션에 member객체를 저장
			session.setAttribute("userId", member.getId());
			session.setAttribute("member",member);
			
			response.sendRedirect("Board.jsp");
		}else{
			// 로그인 실패 -> loginForm 페이지로 이동
			request.setAttribute("LoginErrMsg", "아이디 / 비밀번호를 확인 해주세요.");
			// LoginForm.jsp로 이동 -> request영역을 공유하기 위해 forward사용
			request.getRequestDispatcher("LoginForm.jsp").forward(request, response); 
		}
	%>
	
</body>
</html>