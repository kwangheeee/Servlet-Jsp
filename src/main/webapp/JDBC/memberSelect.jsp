<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.ConnectionUtill"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

</style>
<title>Insert title here</title>
</head>
<body>
	<h2>회원목록 조회</h2>
	<%
		Connection con = ConnectionUtill.getConnection();
		String sql = "select id, name, regidate from member";
		
		PreparedStatement stmt =  con.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()){
			String id = rs.getString(1);
			String name = rs.getString(2);
			String regidate = rs.getString(3);
			
			out.print(String.format("<tr> <td %s</td> <td>%s</td> <td>%s</td> </tr>", id, name, regidate));
			
		}
		rs.close();
		stmt.close();
		con.close();
	%>
</body>
</html>