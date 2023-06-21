<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>기존 페이지는 출력되지 않고 전환된 페이지가 출력된다.</h1>
	
	<h2>각 영역에 저장된 속성 읽기</h2>
	<ul>
		<li>
			page 영역 - 
			${pageScope.scopeValue}
		</li>
		<li>
			request 영역 - 
			${requestScope.scopeValue}
		</li>
		<li>
			session 영역 - 
			${sessionScope.scopeValue}
		</li>
		<li>
			application 영역 - 
			${applicationScope.scopeValue}
		</li>
	</ul>
	
	<h2>영역 지정 없이 속성 읽기</h2>
	<ul>
		<li>${scopeValue }</li>
	</ul>
</body>
</html>