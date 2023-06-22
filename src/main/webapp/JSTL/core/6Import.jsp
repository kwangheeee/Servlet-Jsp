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
	<!-- 
	import : 외부파일을 현재 위치에 삽입
	
		url 	: 외부파일 파일 경로
		scope 	: 영역
		var 	: 변수명
					변수명을 사용하면 선언과 삽입을 분리 할수 있습니다.
	
	외부파일에 매개변수 넣기
		- url의 쿼리스트링으로 전달하기
		- c:param 태그를 이용하기
	
	-->
	<c:import url="/8게시판/List.jsp" var='link'>
		<c:param name="param1" value="헤더영역"></c:param>
	</c:import>
	
	<h4>다른 문서 삽입하기</h4>
	${link }
	
	<h4>iframe을 이용한 외부자원 삽입하기</h4>
	<iframe src="inc/GoldPage.jsp" style="width:100%; height:600px"></iframe>
	
	<c:set var="iTag">
		i태그는 <i>기울임</i>을 표현합니다.
	</c:set>
	
	<h4>el출력</h4>
	${iTag }
	<h4>out태그 기본 사용</h4>
	<c:out value="${iTag }"></c:out>
	
	<h4>escapeXml 속성</h4>
	<c:out value="${iTag }" escapeXml="false"></c:out>
	
	<h4>default 속성</h4>
	<c:out value="${param.name }" default="이름없음"></c:out>
	<c:out value="" default="빈 문자열도 값입니다."></c:out>



	<h4>redirect</h4>
	<!-- request영역이 공유되지 않는다. -->
	<c:set var="requestVar" value="request" scope="request"></c:set>
<%--  	<c:redirect url="/JSTL/inc/OtherPage.jsp">
		<c:param name="user_param1" value="출판사"></c:param>
		<c:param name="user_param2" value="아구몬"></c:param>
	</c:redirect>  --%>

	
	<h4>url 태그를 이용해서 링크 걸기</h4>
	<!-- 
		c:url
			지정한 경로와 매개변수를 이용해서 컨텍스트루트를 포함한 url을 생성
			a태그의 href속성이나 form태그의 action속성에 이용할 수 있따.
			
			value :  경로
			var : 변수명
	 -->
	 <a href="../JSTL/inc/OtherPage.jsp">페이지 바로가기</a>
	 <c:url value="/JSTL/inc/OtherPage.jsp" var="url"></c:url>
	 <a href="${url }">url 태그를 이용한 바로가기</a>
	 <form action="${url }">
	 	<input type="submit" value="버튼">
	 </form>
	 
	 
	 <h4>예외처리</h4>
	 <!-- 
	 	c:catch
	 	예외가 발생하면 지정한 변수에 에러 메세지가 저장되어 전달
	  -->
	  <c:catch var="eMsg">
	  	<%
	  		int res = 10/0;	
	  	%>
	  </c:catch>
	예외내용 : ${eMsg }
	
	<h4>el에서 예외처리</h4>
	<c:catch var="em">
		<c:forEach begin='0' end='-1' step='1' var='i'>
			i => ${i }
		</c:forEach>
	</c:catch>
	예외내용 : ${em }



























	
</body>
</html>