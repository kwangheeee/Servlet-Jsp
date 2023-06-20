<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	Session
	=> 웹 컨테이너에서 클라이언트의 정보를 서버에 보관하는 기능
	로그인 / 쇼핑몰 장바구니 기능을 구현할 때 사용
	
		http통신은 요청과 응답으로 구성되어 있지만 1회성으로 연결 되는 http 프로토콜의 단점을 보안해 
		클라이언트와 서버 간 접속을 유지시켜 준다.
		
		
		
		클라이언트에서 서버로 페이지를 요청을 하면 서버는 페이지를 응답해주고 통신은 종료 된다.
		웹 서버는 웹 컨테이너의 상태를 유지하기 위한 정보를 저장하고, 저장한 정보는 브라우저를 닫을 떄, 일정 시간이 지났을때,
		서버에서 세션을 삭제했을 때 비로소 삭제가 이루어진다.
		사용자 컴퓨터에 저장되는 쿠키와는 달리 세션은 서버에 저장되어 관리되기 때문에 비교적 안전
		
		
		
		서버는 어떻게 로그인 상태를 유지 시켜 줄수 있을까요?  
		
		클라이언트에서 웹브라우저로 서버에 최초로 접근시 
			-> 웹서버는 웹브라우저에게 세션아이디를 발급 
			-> 세션아이디는 쿠키로 생성되어 응답객체의 쿠키에 담겨 클라이언트로 전송
				개발자도구의 쿠키를 확인해 보면 JSESESSIONID라는 값이 입력 되어 있습니다.
				여기 저장된 값이 세션아이디 입니다.
		(웹브라우져를 새로 열고 서버에 접근시 쿠키에 저장된 세션ID값이 변경된것을 
														확인 할 수 있습니다.)
		
		
	세션의 유지시간
		유지시간을 설정 하지 않으면 기본 30분(1800초)이며,
		유지시간이 만료되기전 새로운 요청이 들어오면 유지시간이 연장 됩니다.
		
		클라이언트가 유지시간내 요청이 없는경우 해당 세션은 서버에서 제거 됩니다.
		
		클라이언트에서 JSESESSION 쿠키를 제거 할 경우 서버에서는 
										서버는 새로운 세션아이디를 발급 합니다
	
	유지시간 설정 방법
		web.xml : 유지시간을 분단위로 설정 할 수 있습니다.
					유지시간 설정후 웹브라우저를 닫았다가 다시 열어야 확인이 가능!!!!
	 	session.setMaxInactiveInterval() : 유지시간을 초단위로 설정 할 수 있습니다.	
-->
	<%
//	  web.xml에 세션 유지시간을 설정할 수 있다. 	
//	  세션 유지시간을 분단위로 설정
//	  <session-config>
//	  	<session-timeout>20</session-timeout>
//	  </session-config>
	 	
//		유지시간 설정 -> web.xml에서 설정한 시간을 setMaxInactiveInterval을 통해 바꿀 수 있다.
		 /* session.setMaxInactiveInterval(100); */	
	 
	 	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss"); // 날짜 표시 형식
	 	
	 	long  createTime = session.getCreationTime(); // 최초 요청(세션 생성) 시간
	 	String createTimeStr = sdf.format(new Date(createTime));
	 	
	 	/* -------------------------------------------------------------------------- */
		
	 	long lastTime = session.getLastAccessedTime();	
	 	String lastTimeStr = sdf.format(new Date(lastTime));
	 %>
	<h2>session 설정 확인</h2>
	<ul>
		<li>최초 요청 시간 : <%= createTimeStr %></li>
		<li>마지막 요청 시간 : <%= lastTimeStr %></li>
		<li>세션 ID : <%= session.getId() %></li>
		<li>세션 유지 시간 : <%= session.getMaxInactiveInterval() %></li>
	</ul>
</body>
</html>