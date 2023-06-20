package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import common.DbConnetionPool;
import dto.Board;

public class BoardDao {
	
	public List<Board> boardList(){
		List<Board> list = new ArrayList<>();
		Board board = null;
		String sql = "select rownum rn, board.* from board order by num desc";
		
		try(Connection con = DbConnetionPool.getConnection();
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();) {
			
			while(rs.next()) {
				String rn = rs.getString(1);
				String num = rs.getString(2);
				String title = rs.getString(3);
				String content = rs.getString(4);
				String id = rs.getString(5);
				String date = rs.getString(6);
				String vist = rs.getString(7);
				board = new Board(rn, num, title, content, id, date, vist);
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 게시글 조회
	 * @return
	 */
	public static List<Board> boradMain() {
		List<Board> list = new ArrayList<Board>();
		String sql = "select * from board order by num desc";
		
		try (Connection con = DbConnetionPool.getConnection();
				PreparedStatement st = con.prepareStatement(sql);){
			
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String num = rs.getString("num");
				String title = rs.getString("title");
				String id = rs.getString("id");
				String postDate = rs.getString("postDate");
				String visitCount = rs.getString("visitCount");
				Board board = new Board("",num, title, "", id, postDate, visitCount);
				list.add(board);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 총 게시물 갯수 조회
	 * @ 총 게시물 갯수 반환
	 */
	public static int getTotalCount() {
		int cnt = 0;
		String sql = "select count(*) from board";
		try(Connection con = DbConnetionPool.getConnection();
			PreparedStatement st = con.prepareStatement(sql);) {
			ResultSet rs = st.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
			rs.close();
		} catch (SQLException e) {
			System.out.println("총 게시물의 수를 조회 하던중 예외가 발생하였습니다.");
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	
	/**
	 * 조건에 맞게 검색하기 -> 사용자
	 * @param userId
	 * @return
	 */
	public static List<Board> userList(String userId){
		List<Board> list = new ArrayList<>();
		String sql = "select * from board where id='"+userId+"'";
		
		try (Connection con = DbConnetionPool.getConnection();
				PreparedStatement st = con.prepareStatement(sql);){
			
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String num = rs.getString("num");
				String title = rs.getString("title");
				String id = rs.getString("id");
				String postDate = rs.getString("postDate");
				String visitCount = rs.getString("visitCount");
				Board board = new Board("",num, title, "", id, postDate, visitCount);
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	/**
	 * 조건에 맞게 검색하기 -> 제목
	 * @param titleName
	 * @return
	 */
	public static List<Board> titleList(String titleName){
		List<Board> list = new ArrayList<>();
		String sql = "select * from board where title like '%"+titleName+"%'";
		
		try (Connection con = DbConnetionPool.getConnection();
				PreparedStatement st = con.prepareStatement(sql);){
			
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String num = rs.getString("num");
				String title = rs.getString("title");
				String id = rs.getString("id");
				String postDate = rs.getString("postDate");
				String visitCount = rs.getString("visitCount");
				Board board = new Board("",num, title, "", id, postDate, visitCount);
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	/**
	 * 조건에 맞게 검색하기 -> 내용
	 * @param content
	 * @return
	 */
	public static List<Board> contentList(String content){
		List<Board> list = new ArrayList<>();
		String sql = "select * from board where content like '%"+content+"%'";
		
		try (Connection con = DbConnetionPool.getConnection();
				PreparedStatement st = con.prepareStatement(sql);){
			
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String num = rs.getString("num");
				String title = rs.getString("title");
				String id = rs.getString("id");
				String postDate = rs.getString("postDate");
				String visitCount = rs.getString("visitCount");
				Board board = new Board("",num, title, "", id, postDate, visitCount);
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * 게시물 작성
	 * @param title
	 * @param content
	 * @param id
	 * @return
	 */
	public static int insertWrite(String title, String content, String id) {
		int res = 0;
		String sql  = "insert into board VALUES(seq_board_num.NEXTVAL,'"+title+"','"+content+"','"+id+"',sysdate, 0);";
		try (Connection con = DbConnetionPool.getConnection();
				PreparedStatement st = con.prepareStatement(sql);){
			res = st.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public List<Board> getList(String searchField, String searchWord){
		List<Board> boardList = new ArrayList<>();
		
		String sql = "select * from board";
		
		if(searchWord != null && !"".equals(searchWord)) {
			sql += " where "+searchField+" like '%"+searchWord+"%'";
		}
		sql += " order by num desc";
		
		try (Connection con = DbConnetionPool.getConnection();
				PreparedStatement st = con.prepareStatement(sql);
				ResultSet rs = st.executeQuery(); ){
			
			while(rs.next()) {
				String num = rs.getString("num");
				String title = rs.getString("title");
				String id = rs.getString("id");
				String postDate = rs.getString("postDate");
				String visitCount = rs.getString("visitCount");
				Board board = new Board("",num, title, "", id, postDate, visitCount);
				boardList.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boardList;
	}
	
	/**
	 * 게시물의 총 갯수를 반환 합니다
	 * @return 게시물의 총 갯수
	 */
	public int getTotalCnt(String searchField, String searchWord) {
		int totalCnt = 0;
		String sql = "select count(*) "
				+ "from board ";
		
		if(searchWord != null && !"".equals(searchWord)) {
			sql += " where "+searchField+" like '%"+searchWord+"%'";
		}
		sql += " order by num desc";
		
		try (Connection conn = DbConnetionPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			ResultSet rs = psmt.executeQuery();
			rs.next();
			totalCnt = rs.getInt(1); // 첫번째 컬럼의 값을 반환
			
			rs.close();
		} catch (SQLException e) {
			System.out.println("총 게시물의 수를 조회 하던중 예외가 발생 하였습니다.");
			e.printStackTrace();
		}
		
		return totalCnt;
	}
	
	public static int insert(String title, String content, String id) {
		int res = 0;
		String sql  = "insert into board VALUES(seq_board_num.NEXTVAL ,'"+title+"', '"+content+"', '"+id+"', sysdate, 0)";
		try (Connection con = DbConnetionPool.getConnection();
				PreparedStatement st = con.prepareStatement(sql);){
			res = st.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public Board selectOne(String number) {
		Board board = null;
		String sql = "select * from board where num = "+number;
		if(number == null || "".equals(number)) {
			return null;
		}
		
		try (Connection conn = DbConnetionPool.getConnection();
				PreparedStatement psmt = conn.prepareStatement(sql);){
			ResultSet rs = psmt.executeQuery();
			while(rs.next()) {
				String num = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String id = rs.getString(4);
				String date = rs.getString(5);
				String vist = rs.getString(6);
				board = new Board("",num, title, content, id, date, vist);
			}
			
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return board;
	}
	
	public static int updateVistCount(String number) {
		int res = 0;
		String sql = "update board set visitcount = visitcount+1 where num = "+number;
		
		try (Connection con = DbConnetionPool.getConnection();
				PreparedStatement st = con.prepareStatement(sql);){
			
		  res = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	/**
	 * 게시글 수정
	 * @param title
	 * @param content
	 * @param number
	 * @return
	 */
	public static int editWrite(String title, String content, String number) {
		int res = 0;
		String sql = "update board set title='"+title+"', content = '"+content+"' where num = "+number;
		
		try (Connection con = DbConnetionPool.getConnection();
				PreparedStatement st = con.prepareStatement(sql);){
			
		  res = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	
	public static int deleteBoard(String num) {
		int res = 0;
		String sql = "delete from board where num="+num;
		
		try (Connection con = DbConnetionPool.getConnection();
				PreparedStatement st = con.prepareStatement(sql);){
			
		  res = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
}
