<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage = "ErrorPage.jsp"%>
    <%@ page buffer="1kb" autoFlush="true" %>
    <!-- 버퍼의 크기를 늘려주거나 autoFlush를 true로 바꿔주면 오류가 해결 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		버퍼
		응답 결과를 웹 브라우저로 즉시 전송하지 않고,
		출력할 내용을 버퍼에서 저장해 두었따가 일정량이 차면 클라이언트로 전송
		
		(cpu나 메모리에 비해 IO 속도가 느리므로 응답결과를 버퍼에 저장해 두었다가 전종)
		
		BUFFER="none"으로 지정시 포워드, 에러페이지 등의 기능을 사용하지 못한다.
		크기를 줄일경우 jsp의 기능을 온전히 사용하지 못하므로 값을 변경하는 경우가 거의 없다.
		
		
		버퍼를 사용하는 이유
		- 성능향상
		- jsp 실행 도중 버퍼를 비우고 새로운 내용을 전송 가능 
	 	- 버퍼가 다 차기 전에, 응답 헤더를 변경 가능
	 	
	 	autoFlush
	 	true : 버퍼가 차면, 자동전송
	 	false : 버퍼가 차면, 예외 Exception 발생으로 실행 중지
	 -->
	 <%
	 	for(int i=0; i<100; i++){
	 		out.println("Aaaaaaaaaaa");
	 	}
	 out.print(out.getBufferSize());
	 out.print(out.isAutoFlush());
	 %>
</body>
</html>