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
		TLD(Tag Library Desciptor)
			jsp에서 사용되는 커스텀태그나 jstl의 태그들에 대한 설정파일
			web_inf 하위에 위치 작성해야 인식 가능
			
			prefix : EL에서 사용할 접두어
			uri : tld 파일의 경로
	 -->
	 <%@ taglib prefix="mytag" uri="/WEB-INF/MyTagLib.tld" %>
	 
	 <h3>TLD파일에 등록 후 정적 메서드 호출하기</h3>
	 <ul>
	 	<li>${mytag:isNumber("100") }</li>
	 	<li>${mytag:isNumber("백") }</li>
	 </ul>
</body>
</html>