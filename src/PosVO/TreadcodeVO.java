package PosVO;

public class TreadcodeVO {
	
	private int sellnum;
	private String cuname ;
	
	
	
	
	public TreadcodeVO() {
		
	}




	public TreadcodeVO(int sellnum, String cuname) {
		super();
		this.sellnum = sellnum;
		this.cuname = cuname;
	}




	public TreadcodeVO(int sellnum) {
		super();
		this.sellnum = sellnum;
	}




	public int getSellnum() {
		return sellnum;
	}




	public void setSellnum(int sellnum) {
		this.sellnum = sellnum;
	}




	public String getCuname() {
		return cuname;
	}




	public void setCuname(String cuname) {
		this.cuname = cuname;
	}
	
	
}
