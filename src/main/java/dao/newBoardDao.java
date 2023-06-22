package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DbConnetionPool;
import dto.Board;
import dto.Criteria;

public class newBoardDao {

	public newBoardDao() {
	
	}
	
	/**
	 * 게시물 조회
	 * @return
	 */
	/*
	 * public static List<Board> boardList(Criteria criteria){ List<Board> list =
	 * new ArrayList<>(); String sql =
	 * "select num, title, content, id ,decode(trunc(sysdate), trunc(postdate), to_char(postdate, 'hh24:mi:ss'), to_char(postdate, 'yyyy-mm-dd')), visitcount from board"
	 * ;
	 * 
	 * // 검색어가 입력된 경우 검색조건을 추가합니다. if(criteria.getSearchWord() != null &&
	 * !"".equals(criteria.getSearchWord())) { sql +=
	 * " where "+criteria.getSearchField()+" like '%"+criteria.getSearchWord()+"%'";
	 * }
	 * 
	 * try { Connection con = DbConnetionPool.getConnection(); PreparedStatement st
	 * = con.prepareStatement(sql); ResultSet rs = st.executeQuery();
	 * 
	 * while(rs.next()) { Board b = new Board(); b.setNum(rs.getString(1));
	 * b.setTitle(rs.getString(2)); b.setContent(rs.getString(3));
	 * b.setId(rs.getString(4)); b.setPostDate(rs.getString(5));
	 * b.setVisitConunt(rs.getString(6)); list.add(b);
	 * 
	 * } } catch (SQLException e) { e.printStackTrace(); } return list; }
	 */
	
	public static List<Board> boardList(Criteria criteria){
		List<Board> list = new ArrayList<>();
		String sql = "select * from(select rownum rn, t.* from(select num, title, content, id ,decode(trunc(sysdate), trunc(postdate), to_char(postdate, 'hh24:mi:ss'), to_char(postdate, 'yyyy-mm-dd')), visitcount from board";
		
		// 검색어가 입력된 경우 검색조건을 추가합니다.
		if(criteria.getSearchWord() != null && !"".equals(criteria.getSearchWord())) {
			 sql += " where "+criteria.getSearchField()+" like '%"+criteria.getSearchWord()+"%'";
		}
		sql += " order by num desc)t)where rn between "+criteria.getStartNo()+" and "+criteria.getEndNo()+"";
		try {
			Connection con = DbConnetionPool.getConnection();
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				Board b = new Board();
				b.setRn(rs.getString(1));
				b.setNum(rs.getString(2));
				b.setTitle(rs.getString(3));
				b.setContent(rs.getString(4));
				b.setId(rs.getString(5));
				b.setPostDate(rs.getString(6));
				b.setVisitConunt(rs.getString(7));
				list.add(b);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public static int insertBoard(String title, String content) {
		int res = 0;
		String sql = "insert into board VALUES(seq_board_num.NEXTVAL, ?, ?, 'qwe', sysdate, 0)";
		
		try (Connection con = DbConnetionPool.getConnection();
				PreparedStatement st = con.prepareStatement(sql);){
			
			st.setString(1, title);
			st.setString(2, content);
			
			res = st.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	
	public static Board selectOn(String num){
		Board b = null;
		String sql = "select * from board where num = "+num;
		try {
			Connection con = DbConnetionPool.getConnection();
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				b = new Board();
				b.setNum(rs.getString(1));
				b.setTitle(rs.getString(2));
				b.setContent(rs.getString(3));
				b.setId(rs.getString(4));
				b.setPostDate(rs.getString(5));
				b.setVisitConunt(rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return b;
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
