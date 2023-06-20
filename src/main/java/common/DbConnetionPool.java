package common;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbConnetionPool {

	public DbConnetionPool() {
		// TODO Auto-generated constructor stub
	}
	
	public static Connection getConnection() {
		Connection conn = null;
		
		// 커넥션 풀 생성
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
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
}
