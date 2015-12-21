package PosVO;

public class UseridVO {
	private String id;
	private String pw;
	private int level;
	
	public UseridVO(String id, String pw, int level) {
		super();
		this.id = id;
		this.pw = pw;
		this.level = level;
	}

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

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}
	
	
	

}
