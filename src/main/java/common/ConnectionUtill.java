package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class ConnectionUtill {

	public ConnectionUtill() {
		
	}
	
	/*
	 * DB Connection을 반환
	 */
	public static Connection getConnection() {
		// 접속정보
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "jsp";
		String pw = "1234";
		
		Connection con = null;
		
		// 커넥션 생성
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. 커넥션 생성
			con = DriverManager.getConnection(url, id, pw);
		} catch (ClassNotFoundException e) {
			System.out.println("라이브러리 로드중 오류가 발생하였습니다.");
			System.out.println(e.getMessage());
		} catch(SQLException e){
			System.out.println(e.getMessage());
		}
		return con;
	}
	
	/**
	 * web.xml 파일의 컨텍스트 초기화 매개변수를 읽어서 
	 * DB접속정보를 설정
	 * @param application
	 * @return
	 */
	public static Connection getConnection2(ServletContext application) {
		Connection con = null;
		
		String id = application.getInitParameter("OracleId");
		String pw = application.getInitParameter("OraclePw");
		String url = application.getInitParameter("OracleUrl");
		String drive = application.getInitParameter("OracleDrive");

		/*
		 * System.out.println(id); 
		 * System.out.println(pw); 
		 * System.out.println(url);
		 * System.out.println(drive);
		 */
		try {
			Class.forName(drive);
			con = DriverManager.getConnection(url, id, pw);
		} catch (ClassNotFoundException e) {
			System.out.println("라이브러리 로드중 오류가 발생하였습니다.");
			System.out.println(e.getMessage());
		} catch(SQLException e){
			System.out.println(e.getMessage());
		}
		
		return con; 
	}
	
	
	public static void close(Connection con) {
		try{
			if(con != null && !con.isClosed()) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	public static void close(Connection con, Statement st) {
		try{
			if(st != null && !st.isClosed()) st.close();
			if(con != null && !con.isClosed()) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	public static void close(Connection con, Statement st, ResultSet rs) {
		try{
			if(rs != null && !rs.isClosed()) rs.close();
			if(st != null && !st.isClosed()) st.close();
			if(con != null && !con.isClosed()) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
	
	
	/*
	 * 커넥션 생성 테스트
	 */
	public static void main(String[] args) {
		String sql = "select * from member where id='test' and pass='1234'";
		try (Connection con = getConnection();
				PreparedStatement psmt =  con.prepareStatement(sql);){
			
			ResultSet rs = psmt.executeQuery(); // 쿼리문 실행
			rs.next();
			String today = rs.getString(1); //rs.getString("today");
			rs.close();
			System.out.println(today);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
