<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 첨부형 게시판 - 목록 보기(List)</h2>
	<h4> 총게시물수 : ${totalCnt }</h4>
	<form name="searchForm">
	<table border='1' width='90%'>
	<input type="hidden" type="pageNo">
		<tr>
			<td colspan='6' align='center'>
			<select name="searchField"> 
                <option value="title" >제목</option> 
                <option value="name" ${param.searchField eq "name" ? "selected" : ""}>작성자</option>
            </select>
            <input type="text" name="searchWord" value="${param.searchWord }" />
            <input type="submit" value="검색하기" />
			</td>
		</tr>
	</table>
	</form>	
	
	<!-- 목록 테이블 -->
	<table border='1' width='90%'>
	<c:set var="list" value="${requestScope.boardList }"/>
	<tr>
		<th width="10%">번호</th>
        <th width="*">제목</th>
        <th width="15%">작성자</th>
        <th width="10%">조회수</th>
        <th width="15%">작성일</th>
        <th width="8%">첨부</th>
	</tr>
	<c:if test="${empty list}" var="res">
			<tr>
				<td colspan='6' align='center'>등록된 게시물이 없습니다.</td>
			</tr>	
	</c:if>
	<c:if test="${not res }">
		<c:forEach items="${list }" var="boardList">
			<tr align='center'>
				<td>${boardList.idx }</td>
				<td><a href="../mvcboard/view.do?idx=${boardList.idx }">${boardList.title }</a></td>
				<td>${boardList.name }</td>
				<td>${boardList.visitcount }</td>
				<td>${boardList.postdate }</td>
				<td>
					<c:if test="${not empty boardList.ofile }">
					<a href="../mvcboard/download.do?ofile=${boardList.ofile }&sfile=${boardList.sfile }">[Down]</a> 
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</c:if>
	<tr align='center'>
		<td colspan='5'><%@include file="../MVCBoard/boardNavi.jsp" %></td>
		<td colspan='1'><button onclick="location.href='../mvcboard/write.do'">글쓰기</button> </td>
	</tr>
	</table>
</body>
</html>