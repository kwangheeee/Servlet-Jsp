<%@page import="dto.Criteria"%>
<%@page import="java.util.List"%>
<%@page import="fileUpload.FileDao"%>
<%@page import="fileUpload.FileDto"%>
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
	 <%-- <%List<FileDto> list = FileDao.getFileList();%> --%>
	<table border='1'>
		<tr>
			<th>No</th>
			<th>작성자</th>
			<th>제목</th>
			<th>카테고리</th>
			<th>원본파일</th>
			<th>저장된 파일명</th>
			<th>작성일</th>
			<th>-</th>
		</tr>
	<c:set var="list" value="${requestScope.list }"/>
	<c:if test="${empty list }" var="res">
		<tr>
			<td colspan='8'>등록된 게시물이 없습니다.</td>
		</tr>		
	</c:if>
	<c:if test="${not res }">
		<c:forEach items='${list }' var="FileList">
			<tr>
				<td>${FileList.idx }</td>
				<td>${FileList.name }</td>
				<td>${FileList.title }</td>
				<td>${FileList.cate }</td>
				<td>${FileList.ofile }</td>
				<td>${FileList.sfile }</td>
				<td>${FileList.postdate }</td>
				<td><a href="Download.jsp?oName=${FileList.ofile }&sName=${FileList.sfile }">click..</a></td>
			</tr>		
		</c:forEach>
	</c:if>
	<tr>
		<td colspan='8' align='center'>
<%-- 	<% 
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
		Criteria cr = new Criteria(searchField, searchWord, pageNo);
    	BoardDao dd = new BoardDao();
    	int totalCnt = dd.getTotalCnt(cr);		
	    PageDto pageDto = new PageDto(totalCnt, cr); 
    %> --%>
	<%-- <%@include file="../게시판/listPageNavi3.jsp"%> --%>
		</td>
	</tr>
	</table>
</body>
</html>