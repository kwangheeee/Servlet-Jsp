<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    div#popup {
        position: absolute; top:100px; left:50px; color:yellow;  
        width:270px; height:100px; background-color:gray;
    }
    div#popup>div {
        position: relative; background-color:#ffffff; top:0px;
        border:1px solid gray; padding:10px; color:black;
    }
</style>
<script>
window.onload = function() {
	if (typeof closeBtn != 'undefined') {
		closeBtn.onclick = function() {
			if (document.querySelector("#inactiveToday").checked) {
				popFrm.submit();
			} else {
				popup.style.display = 'none';
			}
		}
	}
}
</script>
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie[] cookie = request.getCookies();
		String cookieValue = "";
		if(cookie != null){
			for(Cookie ck : cookie){
				if("popupClose".equals(ck.getName())){
				cookieValue = ck.getValue();
				}
			}
		}
		
		if(!cookieValue.equals("Y")){
	%>
	<div id="popup">
		<h2 align="center">공지사항 팝업입니다.</h2>
		<div align="right">
			<form name="popFrm" action="popupActionCookie.jsp">
				<input type="checkbox" id="inactiveToday" value="Y" /> 하루 동안 열지 않음
				<input type="button" value="닫기" id="closeBtn" />
			</form>
		</div>
	</div>
	<%
		}
	%>
</body>
</html>