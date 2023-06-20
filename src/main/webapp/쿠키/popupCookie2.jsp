<%@page import="utill.CookieManager"%>
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
    /* 팝업창을 가려주는 클래스 생성 */
 	.off{
    	display: none;
    }
</style>
<script>
window.onload = function(){
	closeBtn.onclick = function(){
		popup.style.display="none";
		
		var chkVal = document.querySelector("input[id=inactiveToday]:checked");
		// 체크박스의 체크 여부에 따라 fetch를 통해 쿠키 생성여부 결정
		if(chkVal != null && chkVal.value == "Y"){
			fetch('popupActionCookie2.jsp')
			// 쿠키 생성 확인 
			.then((data) => data.json)
			.then((json)=>{
				console.log("popupActionCookie2.jsp호출");
			});
		}
	}
}
</script>
<title>Insert title here</title>
</head>
<body>
	<%
		String cValue = CookieManager.readCookie(request, "close");
		// 생성된 쿠키의 값의 여부에 따라
		// 태그에 클래스 속성을 추가확인 조건식 작성
		String off = "Y".equalsIgnoreCase(cValue)? "off" : "";
	%>
	<!-- 추가 하고자 하는 태그를 자바의 변수로 선언하여 값을 넣어준다. -->
	<div id="popup" class="<%=off%>">
		<h2 align="center">공지사항 팝업입니다.</h2>
		<div align="right">
			<form name="popFrm" action="popupActionCookie.jsp">
				<input type="checkbox" id="inactiveToday" value="Y" /> 하루 동안 열지 않음
				<input type="button" value="닫기" id="closeBtn" />
			</form>
		</div>
	</div>
</body>
</html>