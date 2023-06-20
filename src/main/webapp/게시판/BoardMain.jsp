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
<%@ include file= "Head.jsp" %>
<%@ include file= "css/BoardCss.jsp" %>

<%
 	BoardDao dao = new BoardDao();
	List<Board> Boardlist = dao.boardList();
%>
<h1 class="con">게시글 목록</h1>
        <section class="article-list table-common con">
            <table border="1">
                <thead>
                    <tr>
                        <th>번 호</th>
                        <th>제 목</th>
                        <th>아이디</th>
                        <th>작성 날짜</th>
                        <th>방문자 수</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    for(Board list : Boardlist){
                    	if(list.getId() == null){
                    %>
                    <tr>
                        <td><%= list.getRn()%></td>
                        <td><%= list.getTitle()%></td>
                        <td><%= list.getId()%></td>
                        <td><%= list.getPostDate()%></td>
                        <td><%= list.getVisitConunt()%></td>
                    </tr>
						<% }else{%>
					<tr>
                        <td colspan='5' align='center'>등록된 게시물이 없습니다.</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
					<%
						break;
						}
                    }
                    %>                    	
                </tbody>
            </table>
        </section>
</body>
</html>