<%@page import="common.jspFunction"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="fileUpload.FileDao"%>
<%@page import="fileUpload.FileDto"%>
<%-- <%@page import="com.oreilly.servlet.MultipartRequest"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <%
	// 저장할 디렉토리의 실제 경로
	String saveDirectory = "C:/upload";
	//webapp폴더 하위에 디렉토리를 생성	
	/* saveDirectory = "D:\\workServlet\\jsp_sty\\src\\main\\webapp\\upload";  */
	
	// 파일의 최대 크기
	int maxPostSize = 1024 * 1000;
	
	// 인코딩 방식
	String encoding = "utf-8";
	
	try{
		// 1. MultipartRequest 객체 생성
		// 		생성자의 매개변수로 저장경로, 파일 최대크기, 인코딩 방식을 지정
		//		객체가 정상적으로
		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
		
		
		
		// 2. 새로운 파일명 생성
		String fileName = mr.getFilesystemName("attachedFile");
		// 첨부파일의 확장자
		String ext = fileName.substring(fileName.lastIndexOf("."));
		
		// H : 0~23 / S : millisecond
		// 현재시간을 파일 이름으로 지정
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String ofileName = fileName.substring(0, fileName.lastIndexOf("."));
		
		String newFileName = ofileName + "_" + now + ext;

		// 3. 파일명 변경
		File oldFile = new File(saveDirectory + File.separator + fileName);
		File newFile = new File(saveDirectory + File.separator + newFileName); 
		oldFile.renameTo(newFile);
		
		
		
		// 폼 요소의 값 저장
		String name = mr.getParameter("name");
		String title = mr.getParameter("title");
		// 체크박스인 경우, 배열로 반환 받아서 문자열로 연결해서 저장
		String[] categoryArr = mr.getParameterValues("category");
		StringBuffer sb = new StringBuffer();
		if(categoryArr == null){
			sb.append("선택없음");
		}else{
			for(String category : categoryArr){
				sb.append(category+", ");
			}
		}
	
		
		// dto생성
		FileDto dto = new FileDto("", name, title, sb.toString(), fileName, newFileName,"");
		// dao를 통해 데이터 베이스에 등록
		FileDao dao = new FileDao();
		int res = dao.insertFile(dto);
		
		if(res > 0){
			out.print("<script>등록실패</script>");
			jspFunction.alertLocation("등록되었습니다.", "FileList.jsp", out);
		}else{
			out.print("<script>등록실패</script>");
			response.sendRedirect("FileUpload.jsp");
		}
		
	}catch(Exception e){
		e.printStackTrace();
		request.setAttribute("errorMsg", "파일 업로드 오류");
	}
%> --%>
</body>
</html>