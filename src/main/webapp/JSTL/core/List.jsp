<%@page import="dto.Criteria"%>
<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.newBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
	
	Criteria cr = new Criteria(searchField, searchWord, pageNo);
	
	newBoardDao dao = new newBoardDao();
	List<Board> board = dao.boardList(cr);
%>
	${param.param1 }
	<%@include file="../../쎄션/Link.jsp" %>
    <h2>목록 보기(List)</h2>
    <!-- 검색폼 --> 
    <form method="get">  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <!-- 게시물 목록 테이블(표) --> 
    <table border="1" width="90%">
        <!-- 각 칼럼의 이름 --> 
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>
        
        
    <!-- 목록의 내용 --> 
	<c:set var='board' value="<%=board %>"/>
	<c:if test="${empty board }" var='res'>
		<tr>
			<td colspan='5'>게시물이 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${not res }">
		<c:forEach items='${board }' var="board">
		<tr align="center">
            <td>${board.rn }</td>  <!--게시물 번호-->
            <td align="left">  <!--제목(+ 하이퍼링크)-->
               <a href="../8게시판/View.jsp?number=${board.num }&pageNo=<%=cr.getPageNo()%>">${board.title }</a>
            </td>
            <td align="center">${board.id }</td>          <!--작성자 아이디-->
            <td align="center">${board.visitConunt }</td>  <!--조회수-->
            <td align="center">${board.postDate }</td>    <!--작성일-->
        </tr>
		</c:forEach>
	</c:if>	
    </table>
    
    
    <!--목록 하단의 [글쓰기] 버튼-->
    <c:if test="${sessionScope.UserId ne null }">
    <table border="1" width="90%">
        <tr align="right">
			<td>
            <button type="button" onclick="location.href='Write.jsp'">글쓰기</button>
            </td>
        </tr>
    </table>
    </c:if>
    
    
</body>
</html>
