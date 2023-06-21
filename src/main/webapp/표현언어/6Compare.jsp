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
		int num1 = 3;
		pageContext.setAttribute("num2", 4);
		pageContext.setAttribute("num3", "5");
		pageContext.setAttribute("num4", "6");
	%>
	
	<h2>변수 선언 및 할당</h2>
	<!-- num1은 4개의 영역에 저장되지 않았으므로 출력되지 않는다 -->
	<h4>스크립트릿에서 선언한 변수 : ${num1 }</h4>
	<h4>페이지 영역에 저장된 변수 : ${num2 }</h4>
	
	<!-- 3.0부터 대입연산자(=)를 이용하여 값을 대입할 수 있다. -->
	<!-- 값을 대입 후 출력 -->
	<p>변수 할당 및 즉시출력 : ${num1 = 7 }</p>
	
	<!-- 값을 대입하고 출력하지 않음 -->
	<p>변수 할당 및 별도 출력 : ${num2 = 8;'' } => ${num2 }</p>
	
	num1=${num1 }, num2=${num2 }, num3=${num3 }, num4=${num4 }
	
	<h3>산술 연산자</h3>
	<!-- 표현언어(EL)을 이용하면 산술연산시 자동으로 숫자형으로 변환 -->
	num1 + num2 = ${num1 + num2 } <br>
	num1 - num2 = ${num1 - num2 } <br>
	num1 * num2 = ${num1 * num2 } <br>
	num1 / num2 = ${num1 / num2 } <br><br>
	<!-- div : 나누기(문자 형태의 연산자) -->
	num3 div num4 : ${num3 div num4 } <br>
	<!-- mod : 나머지(문자 형태의 연산자) -->
	num3 mod num4 : ${num3 mod num4 } <br>
	
	<h3>+ 연산자는 덧셈만 가능</h3>
	<!-- 숫자의 연산만 가능 -->
	num1 + "34" : ${num1 + "34" } <br>
	num1 + "한글" : \${num1 + "한글일 경우 err발생" } <br>
	
	<h3>비교연산자</h3>
	<!-- 문자 형태의 연산자 -->
	num4 > num3 : ${num4 gt num3 } <br>
	num1 < num3 : ${num1 lt num3 } <br>
	num2 >= num4 : ${num2 ge num4 } <br>
	num4 == num4 : ${num4 eq num4 } <br>
	
	<h2>논리 연산자</h2>
	num3 <= num4 && num3 == num4 : ${num3 le num4 and num3 eq num4 } <br>
	num3 >= num4 || num3 != num4 : ${num3 ge num4 or num3 ne num4 } <br>
</body>
</html>