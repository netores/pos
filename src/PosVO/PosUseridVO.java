package PosVO;

public class PosUseridVO {
	
	private String userid;
	private String userpw;
	private int level;
	
	
	
	public PosUseridVO() {
		super();
	}



	public PosUseridVO(String userid, String userpw, int level) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.level = level;
	}



	public String getUserid() {
		return userid;
	}



	public void setUserid(String userid) {
		this.userid = userid;
	}



	public String getUserpw() {
		return userpw;
	}



	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}



	public int getLevel() {
		return level;
	}



	public void setLevel(int level) {
		this.level = level;
	}
	
	
	
	
	
	
}