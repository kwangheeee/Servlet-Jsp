<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 리스트 생성 (Object로 지정 -> 어떤 타입이든지 저장 가능)
		List<Object> list = new ArrayList<>();
		list.add("짜장면");
		list.add(new Member("test", "탕수육", "200살", "2023/06/19"));
	
		// 페이지 영역에 리스트 객체 저장
		pageContext.setAttribute("list", list);
	%>

	<h2>list 컬렉션</h2>
	<ul>
		<!-- 영역을 지정하지 않았지만 페이지 영역에 저장된 list의 값이 출력 -->
		<li>0번쨰 요소 <p>${list[0] }</p> </li>
		<!-- 객체의 주소값 -->
		<li>1번째 요소 <p>${list[1] }</p> </li>
		<li>1번째 요소 <p>${list[1].id }</p> </li>
		<li>1번째 요소 <p>${list[1].name }</p> </li>
		<!-- 예외가 발생하지 않고 출력되지 않음 -->
		<li>2번째 요소 <p>${list[2] }</p> </li>
	</ul>
	
	<h2>map컬랙션</h2>
	<%
		Map<String ,String> map = new HashMap<String, String>();
		map.put("한국", "kor");
		map.put("eng", "영국");
		/* 생성을 했으면 이를 저장해야 한다. */
		pageContext.setAttribute("map", map);
	%>
	<ul>
		<li>${map['한국'] }</li>
		<li>${map["한국"] }</li>
		<li>\${map.한국 }</li>
		<li>${map.eng }</li>
		<li>${map['eng'] }</li>
		<li>${map["eng"] }</li>
		<li><%=map.get("eng") %></li>
	</ul>
		
</body>
</html>