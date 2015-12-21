package PosVO;

public class WorkerListVO {

	private String id;
	private int userlevel;
	private String getwork;
	private String getoutwork;
	private String cuname;
	
	public WorkerListVO(){}
	
	
	


	
	public WorkerListVO(String id, int userlevel, String getwork, String getoutwork, String cuname) {
		super();
		this.id = id;
		this.userlevel = userlevel;
		this.getwork = getwork;
		this.getoutwork = getoutwork;
		this.cuname = cuname;
	}






	public WorkerListVO(String getwork) {
		super();
		this.getwork = getwork;
	}
	

	public WorkerListVO(String id, int userlevel) {
		super();
		this.id = id;
		this.userlevel = userlevel;
	}






	public String getId() {
		return id;
	}






	public void setId(String id) {
		this.id = id;
	}






	public int getUserlevel() {
		return userlevel;
	}






	public void setUserlevel(int userlevel) {
		this.userlevel = userlevel;
	}






	public String getGetwork() {
		return getwork;
	}






	public void setGetwork(String getwork) {
		this.getwork = getwork;
	}






	public String getGetoutwork() {
		return getoutwork;
	}






	public void setGetoutwork(String getoutwork) {
		this.getoutwork = getoutwork;
	}






	public String getCuname() {
		return cuname;
	}






	public void setCuname(String cuname) {
		this.cuname = cuname;
	}

	
	
}
