<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
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
	<%
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		String storeId = request.getParameter("storeId");
		
		MemberDao dao = new MemberDao();
		Member member = dao.login(id, pw);
		
		if(member != null){
			// 로그인 성공
				session.setAttribute("userId", member.getId());
				session.setAttribute("member", member);
				response.sendRedirect("BoardMain.jsp");
		}else{
			// 로그인 실패
			request.setAttribute("loginErrMsg", "아이디/비밀번호가 일치하지 않습니다.");
			request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
		}
		
		if("Y".equalsIgnoreCase(storeId)){
			session.setAttribute("storeId", member.getId());
		}
	%>
	
</body>
</html>