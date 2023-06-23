package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

// httpServlet을 상속받은 HelloServlet을 '서블릿'이라 부른다!
public class HelloServlet extends HttpServlet{

	// 요녀석은 web.xml에 등록을 해줘야함
	
	@Override
	// 사용자의 요청을 받아오는
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setAttribute("message", "서블릿 호출!");
		
		// PrintWriter out = res.getWriter(); out.print("서블릿 호출");
		// res.getWriter().print("서블릿 호 출");
		
		
		// request영역이 공유가 안됨
		/* res.sendRedirect("HelloServlet.jsp"); */
		
		// request영역이 공유
		req.getRequestDispatcher("HelloServlet.jsp").forward(req, res); 
	}
	
	public HelloServlet() {
	
	}
	
}
