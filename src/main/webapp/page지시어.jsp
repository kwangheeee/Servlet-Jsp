<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.time.LocalDateTime"%>
<%@ page import =  "java.time.format.DateTimeFormatter"%>
<!-- java.jang 패키지에 속하지 않은
클래스를 jsp 문서에서 사용하기 위해 임포트가 필요합니다 -->  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>language</h3>
	<p>스크립팅언어(응용프로그램에서 사용되는 프로그램언어)를 지정</p>
	
	<h3>contentType</h3>
	<p>문서타입과 인코딩방식을 지정</p>
	
	<h3>pageEncoding</h3>
	<p>java.lang 패키지에 속하지 않은 클래스를 jsp 문서에서 사용하기 위해 임포트</p>
	
	<h3>import</h3>
	<p></p>
	<%
		LocalDateTime ldt = LocalDateTime.now();
		String date = ldt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss"));
	%>
	<%= date %>
	
	<!-- 생성한 JSP파일 확인하는 경로 -->
	<p>D:\workServlet\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\ROOT\org\apache\jsp</p>
</body>
</html>