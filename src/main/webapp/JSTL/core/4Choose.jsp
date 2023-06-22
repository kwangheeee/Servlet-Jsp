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
	<h2>다중 조건문</h2>
	<h4>홀짝 판단하기</h4>
	<c:set var="number" value="100"></c:set>
	
	<!-- 다중조건문 사용하기 -->
	<c:choose>
		<c:when test="${number mod 2 eq 0 }">
			${number }는 짝수 입니다.
		</c:when>
		<c:otherwise>
			${number }는 홀수 입니다.
		</c:otherwise>
	</c:choose>
	<c:if test="${number mod 2 eq 0 }" var="result">
		${number }는 짝수입니다.
	</c:if>
	<c:if test="${not result }">
		${number }는 홀수입니다.
	</c:if>
	
	<h4>국 / 영 / 수 점수를 입력하면 평균을 내어 학점을 출력</h4>
	<form action="">
		국어 : <input type="text" name="kor">	
		영어 : <input type="text" name="eng">	
		수학 : <input type="text" name="mth">
		<input type="submit" value="학점구하기">	
	</form>
	
	<!-- 모든 과목의 점수가 입력되었는지 확인 -->
	<c:if test="${not(empty param.kor or empty param.eng or empty param.mth) }">
	<!-- 점수를 출력 -->	
		국어점수 : ${param.kor }<br>
		영어점수 : ${param.eng }<br>
		수학점수 : ${param.mth }<br>
	<!-- 평균점수 계산 -->
	<c:set var="avg" value="${(param.kor + param.eng + param.mth) div 3 }"/>
	평균점수는 ${avg } 입니다. <br>
	<c:choose>
		<c:when test="${avg ge 90 }">A학점~</c:when>
		<c:when test="${avg ge 80 }">B학점~</c:when>
		<c:when test="${avg ge 70 }">C학점~</c:when>
		<c:when test="${avg ge 60 }">D학점~</c:when>
		<c:otherwise>F학점~</c:otherwise>
	</c:choose>
	입니다. <br>
	</c:if>
</body>
</html>