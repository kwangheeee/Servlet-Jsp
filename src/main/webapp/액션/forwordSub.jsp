<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<h2>포워드 결과 확인</h2>
	<ul>
		<li>
			page영역 <br>
			
			<!-- page영역은 받아오지 못한다. -> null값 -->
			-> <%= pageContext.getAttribute("pAttr") %> <br>
			<!-- request영역은 받아 온다. -->
			-> <%= request.getParameter("pAttr") %> <br>
		</li>
		<li>
			request영역
			-> <%= request.getAttribute("rAttr") %> <br>
		</li>
	</ul>
</body>
</html>