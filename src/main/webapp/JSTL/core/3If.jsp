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
	<h2>jstl의 if 태그로 짝수/홀수 판단하기</h2>
	<c:set var="number" value="101"/>
	<!-- 
		test : if 문에서 사용할 조건 지정(표현언어 사용 가능)
		var : 조건의 결과를 저장할 변수명
		scope : 변수가 저장될 영역
	 -->
	 <c:if test="${number mod 2 eq 0 }" var="result">
	 	<!-- 조건이 참이 경우 실행됩니다. -->
	 	${number }는 짝수입니다.<br>
	 </c:if> 
	 result : ${result } <br>
	 
	 <h2>문자열 비교와 else 구문 흉내내기</h2>
	 <c:if test="${not result }" var="result2">
	 	${number }는 홀수입니다.<br>
	 </c:if>
	 
	 <h4>문자열 비교와 else 구문 흉내내기</h4>
	 <!-- 문자열 변수 선언 -->
	 <c:set var="str" value="JSP"/>
	 <c:if test="${str eq 'java' }" var="result3">
	 	문자열은 java 입니다. <br>
	 </c:if>
	 <c:if test="${not result3 }">
	 	'java'가 아닙니다. <br>
	 </c:if>
	 
	 <h4>조건식 주의사항</h4>
	 <!-- 표현언어(EL)를 사용하지 않는 경우 -->
	 <c:if test="100" var="result4">
	 	일반값을 입력 : false <br>
	 </c:if>
	 result4 : ${result4 }
	 
	 <c:if test="tRue" var="resul5">
	 	대소문자 구분 없이 "tRue"인 경우 true <br>
	 </c:if>
	 result5 : ${result5 } <br>
	 
	 <c:if test="${ture} " var="result6">
	 	EL공백이 삽입된 경우 false <br>
	 </c:if>
	 result6 : ${result6 }
</body>
</html>