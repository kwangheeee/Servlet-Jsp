package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/13서블릿/AnotationMapping.do")
public class AnotationMapping extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("message", "------ hi ------");
		req.getRequestDispatcher("HelloServlet.jsp").forward(req, resp);
	}
	
	public AnotationMapping() {
	}
}
