package dto;

public class Board {

	public Board() {
		
	}
	
	private String rn;
	private String num;
	private String title;
	private String content;
	private String id;
	private String postDate;
	private String visitConunt;
	public String getRn() {
		return rn;
	}
	public void setRn(String rn) {
		this.rn = rn;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	public String getVisitConunt() {
		return visitConunt;
	}
	public void setVisitConunt(String visitConunt) {
		this.visitConunt = visitConunt;
	}
	
	
	public Board(String rn, String num, String title, String content, String id, String postDate, String visitConunt) {
		super();
		this.rn = rn;
		this.num = num;
		this.title = title;
		this.content = content;
		this.id = id;
		this.postDate = postDate;
		this.visitConunt = visitConunt;
	}
	
	public Board(String num, String title, String content, String id, String postDate, String visitConunt) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.id = id;
		this.postDate = postDate;
		this.visitConunt = visitConunt;
	}	
	
}
