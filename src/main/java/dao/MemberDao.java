package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.ConnectionUtill;
import dto.Member;

public class MemberDao {

	public MemberDao() {
	}
	/**
	 * 로그인
	 * 아이디/비밀번호가 일치하는 회원을 조회
	 * 
	 * 회원이 존재하는 경우 Member객체 반환 / 존재하지 않는 경우 null반환
	 */
	public Member login(String id, String pw) {
			Member member = null;
			String sql = "select * from member where id='"+ id +"' and pass='"+pw+"'";
//			String sql = "select * from member where id=? and pass=?";
			
			try (Connection con = ConnectionUtill.getConnection();
					PreparedStatement psmt =  con.prepareStatement(sql);){
//				psmt.setString(1, id);
//				psmt.setString(2, pw);

				ResultSet rs = psmt.executeQuery(sql);
				if(rs.next()){
					String loginId = rs.getString("id");
					String name = rs.getString("name");
					String regidate = rs.getString("regidate");
					member = new Member(loginId, "", name, regidate);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return member;
	}
	
	public int insert(Member member) {
		int i=0;
		String sql = "insert into member values(?, ?, ?, sysdate)";
		try (Connection con = ConnectionUtill.getConnection();
				PreparedStatement stmt =  con.prepareStatement(sql);){
			
			stmt.setString(1, member.getId());
			stmt.setString(2, member.getPw());
			stmt.setString(3, member.getName());
	
			i = stmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;
	}
}
