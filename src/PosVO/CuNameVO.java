package PosVO;

public class CuNameVO {
	
	private String cuname;
	private String userid;
	private String id;
	private int onhand;

	
	
	
	public CuNameVO() {
		super();
	}
	
	
	
	public CuNameVO(String cuname, String userid) {
		super();
		this.cuname = cuname;
		this.userid = userid;
	}






	
	public CuNameVO(String id, int onhand) {
		super();
		this.id = id;
		this.onhand = onhand;
	}
	
	



	public CuNameVO(String cuname, String id, int onhand) {
		super();
		this.cuname = cuname;
		this.id = id;
		this.onhand = onhand;
	}



	public CuNameVO(String cuname, String userid, String id, int onhand) {
		super();
		this.cuname = cuname;
		this.userid = userid;
		this.id = id;
		this.onhand = onhand;
	}



	public String getCuname() {
		return cuname;
	}

	public void setCuname(String cuname) {
		this.cuname = cuname;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getOnhand() {
		return onhand;
	}

	public void setOnhand(int onhand) {
		this.onhand = onhand;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}
	
	
	


}
