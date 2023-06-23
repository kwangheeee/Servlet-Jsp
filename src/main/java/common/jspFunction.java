package common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;

import org.apache.catalina.connector.Response;

public class jspFunction {

	public jspFunction() {
	}
	
	/**
	 * 알림창을 띄운 후 명시한 URL로 이동합니다.
	 * @param msg
	 * @param url
	 * @param out
	 */
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
		String script = ""
						+"<script>"
						+ 	"alert('"+msg+"');"
						+ 	"location.href='"+url+"';"
						+ "</script>";
			out.print(script);
			// 화면에 출력
			// 자바스크립트 코드를 out내장 객체로 출력
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 알림창을 띄운후 이전 페이지로 이동
	 * @param mas
	 * @param out
	 */
	public static void alertBack(String msg, JspWriter out) {
		try {
		String script = ""
						+"<script>"
						+ 	"alert('"+msg+"');"
						+ 	"history.go(-1);"
						+ "</script>";
			out.print(script);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void alertBack(HttpServletResponse resp, String msg) {
		resp.setContentType("text/html;charset=utf-8");
		try {
			String script = ""
					+"<script>"
					+ 	"alert('"+msg+"');"
					+ 	"history.go(-1);"
					+ "</script>";
			PrintWriter writer = resp.getWriter();
			writer.print(script);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	public static void alertLocation(HttpServletResponse resp, String msg, String url) {
		resp.setContentType("text/html;charset=utf-8");
		try {
			String script = ""
					+"<script>"
					+ 	"alert('"+msg+"');"
					+ 	"location.href='"+url+"';"
					+ "</script>";
			PrintWriter writer = resp.getWriter();
			writer.print(script);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
