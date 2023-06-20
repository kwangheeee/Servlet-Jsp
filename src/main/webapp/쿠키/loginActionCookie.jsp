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
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
		String idCheck = request.getParameter("check");
		
		
		if("a".equals(id) && "a".equals(pw)){
			// 아이디 저장 체크값에 따라 쿠키 생성 결정
			if("Y".equals(idCheck)){
				// 쿠키 생성
				Cookie cookie = new Cookie("userid", id);
				// 쿠키 유지시간 지정(단위 : 초)
				cookie.setMaxAge(3600);
				// 생성된 쿠키 응답객체에 추가
				response.addCookie(cookie);
				response.sendRedirect("loginCookie.jsp?loginSuccess="+id);
			}else{
				response.sendRedirect("loginCookie.jsp?loginSuccess="+id);
			}
		}else{
			response.sendRedirect("loginCookie.jsp?isLogin=fail");
		}
	%>
</body>
</html>