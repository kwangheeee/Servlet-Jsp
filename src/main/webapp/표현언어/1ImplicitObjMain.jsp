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
/*
	표현언어 EL(Expression Language)
	변수의 값을 출력할 때 사용하는 스크립트 언어
	
	4가지 영역에 저장된 값을 출력 출력합니다.
	사용법이 간결하고 예외와 형변환에 관대 합니다.
	
	서블릿에서 처리된 결과는 영역을 통해 전달되고
	표현언어로 접근하여 쉽게 출력 할수 있습니다.
	
	- JSP 내장객체의 영역에 담긴 속성을 사용합니다.
	- 산술연산, 논리연산, 비교연산 이 가능 합니다.
	- 자바 클래스에 정의된 메서드를 호출 할 수 있습니다.
	
	기본사용법
	${ 영역.속성 }
	변수에 접근 하기 위해서는 영역을 지정 해주어야 합니다.
	
	페이지영역 		: pageScope
	요청영역 			: requestScope
	세션영역 			: sessionScope
	어플리케이션영역 	: applicationScope
	
	${requestScope.saveVar}
	
	요청 파라메터
	request.getParameter("매개변수명")
	${ param.매개변수명 }
	${ param["매개변수명"] }
	${ param['매개변수명'] }
	
	한글, 특수문자가 입력된 경우 대괄호([])를 이용해야 오류가 발생하지 않습니다.
	ex) ${param["user-agent"]}
		${param["한글"]}
		
*/
	
		pageContext.setAttribute("scopeValue", "page scope");			
		request.setAttribute("scopeValue", "request scope");		
		session.setAttribute("scopeValue", "session scope");			
		application.setAttribute("scopeValue", "application scope");			
	%>
	
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
	
	<jsp:forward page="1ImplicitForward.jsp"></jsp:forward>
</body>
</html>