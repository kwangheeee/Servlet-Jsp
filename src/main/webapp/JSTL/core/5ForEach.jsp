<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
	<h4>일반 for문 형태의 forEach문</h4>
	<!-- 
		forEach 태그를 활용한 반복문
			begin : 시작값
			end : 종료값
			step : 증가값
			var : 변수
	 -->
	 <c:forEach begin='1' end='10' step='1' var='i'>
	 	<p>${i}</p>
	 </c:forEach>
	 
	 <h4>varStatus 속성 살펴보기</h4>
	 <!-- 
	 	varStatus 루프의 현재 상태를 알려주는 변수 이름
	 		current : var에 지정한 현재 루프의 변수값
	 		index : var에 지정한 현재 루프의 변수값
	 		count : 실제 반복횟수(1부터 시작)
	 		first : 루프의 처음일때 true
	 		last : 루프의 마지막일떄 true
	  -->
	  
    <table border="1">
    <c:forEach begin="3" end="5" var="i" varStatus="loop">
    	<tr>
    		<td>i : ${i }</td>
    		<td>current : ${loop.current }</td>
    		<td>index : ${loop.index }</td>
    		<td>count : ${loop.count }</td>
    		<td>first : ${loop.first }</td>
    		<td>last : ${loop.last }</td>
    	</tr>
    </c:forEach>
	</table>
	  
	  <h4>1~100까지 정수중 홀수의 합</h4>
	  <c:forEach begin='1' end='100' var='num' >
	  <c:if test="${not(num mod 2 eq 0) }">
		<c:set var='res' value='${res + num}'></c:set>
	  </c:if>
	  </c:forEach>
	  홀수의 합 : ${res }
	  
	  <h4>향상된 for문</h4>
	  <%
	  	String[] rgba = {"red", "blue", "green"};
	  %>
	  <table border='1'>
	  <c:forEach items="<%=rgba %>" var='c' varStatus='loop'>
		<tr>
	  		<td><span style="color:${c }">${c }</span></td>
	  		<td>current : ${loop.current }</td>
	  		<td>index : ${loop.index }</td>
	  		<td>count : ${loop.count }</td>
	  		<td>first : ${loop.first }</td>
	  		<td>last : ${loop.last }</td>
	  	</tr>
	  </c:forEach>
	  </table>
	  
	  
	  <h4>list 컬렉션 사용하기</h4>
	  <%
	  	List<Member> list = new ArrayList<>();
	  	list.add(new Member("id1", "pw1","",""));
	  	list.add(new Member("id2", "pw2","",""));
	  	list.add(new Member("id3", "pw3","",""));
	  	list.add(new Member("id4", "pw4","",""));
	  %>
	  <c:set var="st" value="<%=list %>"></c:set>
	  <c:forEach items="${st }" var="mem">
	  	<ul>
	  		<li>아이디 : ${mem.id }, 비밀번호 : ${mem.pw }</li>
	  	</ul>
	  </c:forEach>
	  
	  
	  <h4>map컬랙션 사용하기</h4>
	  <%
	  	Map<String, Member> map = new HashMap<String,Member>();
	  	map.put("1st", new Member("id5","pw5","",""));
	  	map.put("2nd", new Member("id6","pw6","",""));
	  	map.put("3rd", new Member("id7","pw7","",""));
	  %>
	  <c:set var="mp" value="<%=map %>"/>
	  <c:forEach items="${mp }" var="map">
	  	<ul>
	  		<li>key : ${map.key } </li>
	  		<li>value : ${map.value } </li>
	  		<li>value : ${map.value.id } </li>
	  		<li>value : ${map.value.pw } </li>
	  	</ul>
	  </c:forEach>
	  
	  
	  <h4>forTokens 태그 사용</h4>
	  <%
	  	String rgb = "Red, Green, Blue, Black";
	  %>
	  <!-- 
	  	Token : 문법적으로 의미 있는 최소단위
	  			구분자를 기준으로 문자열을 나눠 토큰의 갯수만큼 반복
	  			
	  	items : 문자열(문자열만 사용가능)
	  	delims : 구분자
	  	var : 변수명		
	  -->
	  
	  <c:forTokens items="<%=rgb %>" delims="," var="color">
	  	<span style="color:${color }">${color }</span>
	  </c:forTokens>
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  
</body>
</html>