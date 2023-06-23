package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileUpload.FileDao;
import fileUpload.FileDto;

public class FileListServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<FileDto> list = FileDao.getFileList();
		req.setAttribute("list", list);
		req.getRequestDispatcher("/111파일업로드/FileList.jsp").forward(req, resp);
	}
	
	public FileListServlet() {
	}
}
