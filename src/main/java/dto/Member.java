package dto;

public class Member {

	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	private String id;
	private String pw;
	private String name;
	private String regidate;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegidate() {
		return regidate;
	}
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	
	public Member(String id, String pw, String name, String regidate) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.regidate = regidate;
	}
	
	
	
	
	
	
}
