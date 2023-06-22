<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="num" value="1234"/>
	콤마 출력 <fmt:formatNumber value="${num }"/> <br>
	콤마 출력 안함 <fmt:formatNumber value="${num }" groupingUsed="false"/> <br>
	
	변수에 저장 <fmt:formatNumber value="${num }" var="saveVar" type="currency"/>
	변수에 저장된 값 출력 : ${saveVar }
	
	퍼센트 : <fmt:formatNumber value="0.03" type="percent" var="p"/> <br>
	퍼센트 값 출력 : ${p }
	
	<h4>패턴을 지정하여 숫자를 활용</h4>
	<c:set var="num1" value="12345.12345"/>
	0,# -> 자릿수를 의미
	0표현 : 자리에 수가 없으면 0으로 표시 - 자리수를 맞춰서 출력 하고 싶을때 <br>
	#표현 : 자리에 수가 없으면 공란으로 표시 <br>
	
	<fmt:formatNumber value="${num1 }"/> <br>
	<fmt:formatNumber value="${num1 }" pattern="0,00.0"/> <br>
	<fmt:formatNumber value="${num1 }" pattern="0,000,00.0"/> <br>
	<fmt:formatNumber value="${num1 }" pattern="###,###.0"/> <br>
	<fmt:formatNumber value="${num1 }" pattern="###,###.000000"/> <br>
	 
	<fmt:parseNumber value="${num1 }" integerOnly="true" var="saveVar1" /> <br>
	정수 부분만 : ${saveVar }
	
	<h4>날짜 포멧</h4>
	<c:set var="today" value="<%=new Date() %>"/>
	오늘날짜 : ${today } <br>
	
	<fmt:formatDate value="${today }" type="date" dateStyle="full"/><br>
	<fmt:formatDate value="${today }" type="date" dateStyle="short"/><br>
	<fmt:formatDate value="${today }" type="date" dateStyle="long"/><br>
	<fmt:formatDate value="${today }" type="date" dateStyle="default"/><br>
	<fmt:formatDate value="${today }" type="date" dateStyle="medium"/><br>

	<h4>시간 포멧</h4>
	<fmt:formatDate value="${today }" type="time" dateStyle="full"/><br>
	<fmt:formatDate value="${today }" type="time" dateStyle="short"/><br>
	<fmt:formatDate value="${today }" type="time" dateStyle="long"/><br>
	<fmt:formatDate value="${today }" type="time" dateStyle="default"/><br>
	<fmt:formatDate value="${today }" type="time" dateStyle="medium"/><br>
	
	<h4>날짜, 시간 표시</h4>
	<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full"/><br>
	
	
	
	<h4>pattern 지정후 출력</h4>
	<fmt:formatDate value="${today }" type="both" pattern="yyyy-MM-dd hh:mm:ss"/>
	
	<h4>타임존 설정</h4>
	<fmt:timeZone value="America/Chicago">
		<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full"/>
	</fmt:timeZone>
	
	<h4>로케일 설정</h4>
	
	<c:set var="today" value="<%= new java.util.Date() %>"/>
	
	한글로 설정 :
	<fmt:setLocale value="ko_kr"/>
	<fmt:formatNumber value="10000" type="currency"/>
	<fmt:formatDate value="${today }"/>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>