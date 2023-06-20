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
		// name속성의 값을 매개값으로 넘겨주면 value속성의 값을 반환 합니다.
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpw");
		
		if("a".equals(id) && "a".equals(pw)){
			// 로그인 성공
			response.sendRedirect("responseLogin.jsp?name="+id);
		}else{
			// 로그인 실패
			response.sendRedirect("responseLogin.jsp?loginErr=1");
		}
	%>
</body>
</html>