<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Member"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	JSTL(JSP Standard Tag Library)
		JSP의 표준태그라이브러리를 이용하면 스크립틀릿을 사용하지 않고 태그를 사용하여 
		제어문, 반복문등을 사용 할 수 있습니다
		
		기본태그가 아닌 확장태그 이므로 사용하기 위해서는 별도의 라이브러리가 필요합니다.
		메이븐리파지토리로 접근하여 jstl-1.2.jar파일을 다운로드 받고 lib폴더에 추가합니다.
		
	JSTL 종류
		Core태그 		: 변수선언, 조건문/반복문, URL처리 
		접두어 		: c
		
		Formatting 태그 : 숫자, 날짜, 시간 포맷 지정
		접두어 		: fmt
		
	JSTL을 사용하기 방법
		1. 라이브러리 추가
		2. taglib 지시어 추가
	 -->

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	

	<!--
	 	1. 변수선언
	 		var : 변수명
	 		value : 값
	 		scope : 저장영역
	  -->
	<c:set var="directVar" value="100" />
	<c:set var="elVar" value="${directVar mod 5 }" />
	<c:set var="expVar value=<%=new Date() %>" />
	<c:set var="betweenVar">변수값 요렇게 설정</c:set>

	<h4>EL을 이용해 변수 출력</h4>
	<ul>
		<li>directVar : ${pageScope.directVar }</li>
		<li>elVar : ${elVar }</li>
		<li>expVar : ${expVar }</li>
		<li>betweenVar : ${betweenVar }</li>
	</ul>
	
	<h4>자바빈즈 생성1 - 생성자 사용</h4>
	<c:set var="personVal1" value='<%=new Member("id", "하니", "20", "2023-06-20") %>' scope="request"/>
	
	<ul>
		<li>personVal1 : ${personVal1.id }</li>
		<li>personVal1 : ${requestScope.personVal1.name }</li>
	</ul>
	
	<h3>자바빈즈 생성후 값을 변경하기</h3>
	<h4>자바빈즈 생성1 - target, property 사용</h4>
	<!-- 
		target : 자바빈즈 변수명
		property : 자바빈즈 속성명(멤버변수명)
		value : 값 지정
	 -->
	 
	 <c:set var="personVal2" value='<%=new Member("hani", "하 니?", "22", "22") %>'/>
	 <ul>
	 	<li>${personVal2.id }</li>
	 	<li>${personVal2.name }</li>
	 </ul>
	 
	 <c:set target="${personVal2 }" property="id" value="hani1234"></c:set>
	 <c:set target="${personVal2 }" property="name" value="1234"></c:set>
	 <ul>
	 	<li>${personVal2.id }</li>
	 	<li>${personVal2.name }</li>
	 </ul>
	 
	 <h4>list 컬렉션 이용하기</h4>
	 <%
	 	ArrayList<Member> list = new ArrayList<>();
	 	list.add(new Member("hani", "", "하니", ""));
	 	list.add(new Member("nami", "", "나미", ""));
	 %>
	 <c:set var="pList" value="<%=list %>" scope="request"/>
	 <ul>
	 	<li>${pList[0].id }</li>
	 	<li>${requestScope.pList[0].name }</li>
	 </ul>
	 	 <ul>
	 	<li>${pList[1].id }</li>
	 	<li>${requestScope.pList[1].name }</li>
	 </ul>
	 
	 <%
	 	Map<String, Member> map = new HashMap<String, Member>();
	 	map.put("p1", new Member("id1","","루피",""));
	 	map.put("p2", new Member("id2","","조로",""));
	 %>
	 <c:set var="m" value="<%=map %>" scope="request"/>
	 <ul>
	 	<li>아이디 : ${m.p1.id }</li>
	 	<li>이름 : ${requestScope.m.p1.name }</li>
	 </ul>
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
</body>
</html>