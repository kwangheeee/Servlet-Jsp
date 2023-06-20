<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage = "true"
    trimDirectiveWhitespaces = "true"
    %>     
    <!-- isErrorPage : true지정 -> 오류페이지라고 설정하는 것 -->
    <!-- trimDirectiveWhitespaces = true 지정 -> page지시어로 생성된 불필요한 공백을 제거 -->
<!DOCTYPE html>	
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>서비스 중 일시적인 오류가 발생하였습니다.</h1>
	<p>
		오류코드 : E404 <br>
		<mark>관리자에게 문의해 주세요</mark> <br>
		오류내용 : <%= exception.getClass().getName()%>  <br>
		오류메세지 : <%= exception.getMessage()%> 
	</p>
</body>
</html>