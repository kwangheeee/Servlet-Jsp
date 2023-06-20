<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="loginActionCookie.jsp" method="post">
<%
	// 생성된 쿠키값 받아오기
	Cookie[] cookie = request.getCookies();
	String cookieId = "";
	if(cookie != null){
		for(Cookie ck : cookie){
			// 쿠키값이 웹페이지에 있을경우(체크박스를 체크해 로그인 했을 경우) 아이디 표시
			if("userid".equals(ck.getName())){
				cookieId = ck.getValue();
				break;
			}
		}
	}
	
	// 로그인 실패 했을때
 	String isLogin = request.getParameter("isLogin");
	if("fail".equals(isLogin)){
		out.print("<script>alert('아이디/비밀번호를 확인해 주세요')</script>");
	} 
	
	// 로그인 성공했을떄 
	String loginSuccess = request.getParameter("loginSuccess");
	if(loginSuccess != null){
		out.print("<h1>" + loginSuccess + "님 환영합니다.</h1>");
	}else{
%>
		<div class='loginbox'>
			<div id='login'>
				<input type="text" name="userid" id="userid" placeholder='ID를 입력해주세요.' required="required" value="<%= cookieId%>"><br>
				<input type="password" name="userpw" id="userpw" placeholder='PW를 입력해주세요.'><br> 
				<input type="checkbox" name="check" value="Y">아이디 저장하기<br>
			</div>
			<div id='button'>
				<input type="submit" value="로그인">
			</div>
		</div>
		<div id='info'>
			<a href="">회원가입</a>
			<a href="">ID찾기</a> 
			<a href="">PW찾기</a>
		</div>
	</form>
<% } %>
</body>
</html>