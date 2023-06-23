<%@page import="java.io.FileNotFoundException"%>
<%@page import="common.jspFunction"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
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
		// 업로드 파일이 저장된 경로
		String saveDirectory = "c:/upload";
		// 원본 파일이름
		String origialFileName = request.getParameter("oName");
		// 저장된 파일이름		
		String saveFileName = request.getParameter("sName");
		
		out.print(origialFileName);
		out.print(saveFileName);
		
	try{
		File file = new File(saveDirectory, saveFileName);
		out.print(file);
		
		// 파일 입력 스트림 생성
		InputStream inStream = new FileInputStream(file);
		
		String client = request.getHeader("User-Agent");
		if (client.indexOf("WOW64") == -1) {
			origialFileName = 
        		new String(origialFileName.getBytes("UTF-8"), "ISO-8859-1");
	    }
	    else {
	    	origialFileName = 
        		new String(origialFileName.getBytes("KSC5601"), "ISO-8859-1");
	    }
		
		// 파일 다운로드용 응답 헤더
		response.reset();
		
		// 파일 다운로드 창을 띄우기 위한 콘테츠 타입을 지정
		// octet-stream은 8비트 단위의 바이너리 데이터를 의미
		response.setContentType("application/octet-stream");
		
		// 원본 파일 이름으로 다운로드 받을 수 있게 설정하는 부분
		response.setHeader("Content-Disposition", "attachment; filename=\"" + origialFileName + "\"");
		response.setHeader("Content-Length", ""+file.length());
		
		// 출력 리스트 초기화
		out.clear();
		// response 내장 객체로 부터 새로운 출력 스트림 생성
		OutputStream outStream = response.getOutputStream();
		
		byte b[] = new byte[(int)file.length()];
		int readBuffer = 0;
	while((readBuffer = inStream.read(b)) > 0){
			outStream.write(b, 0, readBuffer);
		}
		inStream.close();
		outStream.close();
	}catch (FileNotFoundException e) {
		jspFunction.alertBack("파일을 찾을 수 없습니다.", out);
	}catch(Exception e){
		jspFunction.alertBack("실패", out);
	}
	%>
</body>
</html>