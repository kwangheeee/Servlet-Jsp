<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Session</title>
</head>
<body>
	<jsp:include page="Link.jsp" />
	<span style="color: red; font-size: 1.2em;"> </span>
	<%=  request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
	<%
    	if(session.getAttribute("userId") == null){
    %>
	<form action="LoginProcess.jsp" method="post" name="loginFrm"
		onsubmit="return validateForm(this);">
		아이디 : <input type="text" name="user_id" required="required" /><br />
		패스워드 : <input type="password" name="user_pw" required="required" /><br />
		<input type="submit" value="로그인하기" />
	</form>
	<% 
    	}else{
    		String name = "";
    		if(session.getAttribute("member")!=null){
    			Member member = (Member)session.getAttribute("member");
    			name = member.getName();
    		}
    		out.print(session.getAttribute("userId"));
    %>
    <h2>목록보기(List)</h2>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>아이디</th>
			<th>게시날짜</th>
			<th>방문자수</th>
		</tr>
		<tbody>
			<%
			List<Board> list = BoardDao.boradMain(); 
			
			for(Board bd : list){
			%>
			<tr>
				<td><%=bd.getNum() %></td>
				<td><%=bd.getTitle() %></td>
				<td><%=bd.getId() %></td>
				<td><%=bd.getPostDate()%></td>
				<td><%=bd.getVisitConunt() %></td>
			</tr>
			<% }%>
		</tbody>
	</table>
    
    <%
    	}
    %>
</body>
</html>