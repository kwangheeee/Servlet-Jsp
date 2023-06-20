<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%
	String err = request.getParameter("loginErr");
	if ("1".equals(err)) {
		out.print("<script>alert('login fail..............')</script>");
	}
	%>
	<%
	String name = request.getParameter("name");
	if (name != null) {
		/* out.print("<script>alert('환영합니다!!')</script>"); */
		out.print("<h1>" + name + "님 환영합니다</h1>");
	} else {
	%>
	<aside id='rightside'>
		<div class='side1'>
			<!-- form태그 안에 있는 요소들을 파라메터로 가지고 간다. -> 페이지를 요청한다. -->
			<form action="responseLoginAction.jsp" method="post">
				<!-- 로그인 실패 : 메세지 처리 -->
				<!-- 로그인 성공 : 로그인 박스를 보여주지 않음  / a님 환영합니다. 출력-->
				<div class='loginbox'>
					<div id='login'>
						<!-- 유효성 검사(validation check) : 사용자의 입력값이 유효한지 체크  -->
						<input type="text" name="userid" id="userid"
							placeholder='ID를 입력해주세요.' required="required">
						<input type="password" name="userpw" id="userpw"
							placeholder='PW를 입력해주세요.' required="required">
					</div>
					<div id='button'>
						<input type="submit" value="로그인">
					</div>
				</div>

				<div id='info'>
					<a href="">회원가입</a> <a href="">ID찾기</a> <a href="">PW찾기</a>
				</div>
			</form>
			<%
			}
			%>
		</div>
	</aside>
</body>
</html>