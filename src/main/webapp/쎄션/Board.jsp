<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
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
	request.setCharacterEncoding("utf-8");

	BoardDao dao = new BoardDao();
 	List<Board> list = dao.boradMain();
 	int totalCnt = dao.getTotalCount();
 	
 	String searchField = request.getParameter("searchField");
 	String searchWord = request.getParameter("searchWord");
 	if(searchWord == null){
 		searchWord = "";
 	}
%>
<jsp:include page="Link.jsp"></jsp:include>
	<h2>목록보기(List)</h2>
	총건수 : <%= totalCnt %>	
	<form method="post" action="search.jsp">
		<table border="1" width="90%">
			<tr>
				<td align="center">
				<select name = "searchField">
					<option value="user">사용자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
					<input type="text" name="searchWord" value="<%=searchWord%>">
					<input type="submit" value="검색하기">
				</td>
			</tr>
		</table>
	</form>
	
	<table border="1" width="90%">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>아이디</th>
			<th>게시날짜</th>
			<th>방문자수</th>
		</tr>
<%

		if(list.isEmpty()){
%>		
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>	
<%}else{
	for(Board bd : list){
%>
		<tr>
			<td><%= bd.getNum()%></td>
			<td><a href="<%=bd.getTitle()%>"><%=bd.getTitle()%></a></td>
			<td><%= bd.getId()%></td>
			<td><%= bd.getPostDate()%></td>
			<td><%= bd.getVisitConunt()%></td>
		</tr>
<% 
	}
}
%>





	</table>
	<form action="wirte.jsp">
		<table border="1" width="90%">
			<tr>
				<td align="right">
					<input type="submit" value="글쓰기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>