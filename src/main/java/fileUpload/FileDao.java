package fileUpload;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DbConnetionPool;

public class FileDao {

	public FileDao() {
	}
	
	
	public static int insertFile(FileDto dto) {
		int res = 0;
		String sql = "insert into myfile values(seq_board.NEXTVAL, '"+dto.getName()+"','"+dto.getTitle()+"', '"+dto.getCate()+"', '"+dto.getOfile()+"','"+dto.getSfile()+"',sysdate)";
		try (Connection con = DbConnetionPool.getConnection();
				PreparedStatement st = con.prepareStatement(sql);){
			res = st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	public static List<FileDto> getFileList(){
		List<FileDto> list = new ArrayList<FileDto>();
		String sql = "select * from myfile order by idx desc";
		try (Connection con = DbConnetionPool.getConnection();
				PreparedStatement st = con.prepareStatement(sql);
				ResultSet rs = st.executeQuery()){
			while(rs.next()) {
				String idx = rs.getString("idx");
				String name = rs.getString("name");
				String title = rs.getString("title");
				String cate = rs.getString("cate");
				String ofile = rs.getString("ofile");
				String sfile = rs.getString("sfile");
				String postdate = rs.getString("postdate");
				FileDto dto = new FileDto(idx, name, title, cate, ofile, sfile, postdate);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
