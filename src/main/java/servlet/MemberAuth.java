package servlet;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dto.Member;

public class MemberAuth extends HttpServlet{

	MemberDao dao;
	
	@Override
	public void init() throws ServletException {
		 dao = new MemberDao();
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String admin_id = this.getInitParameter("admin_id");
		
		String id = req.getParameter("userId");
		String pw = req.getParameter("userPw");
		Member member = dao.login(id, pw);
		if(member != null) {
			req.setAttribute("authMessage", member.getName() + "님 반갑!");
			if(member.getId().equals(admin_id)) {
				req.setAttribute("authMessage", admin_id+"관리자님 ㅎㅇ~");
			}
		}else {
			req.setAttribute("authMessage", "로그인 실패~");
		}
		
		 req.getRequestDispatcher("/13서블릿/MemberAuth.jsp").forward(req, resp);
		/*
		 * String url = URLEncoder.encode("/13서블릿/MemberAuth.jsp");
		 * resp.sendRedirect(url);
		 */
	}
	
	public MemberAuth() {
		// TODO Auto-generated constructor stub
	}

}
