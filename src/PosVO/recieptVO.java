package PosVO;

public class recieptVO {
	long barcode;
	String proid;
	int cost;
	int store;
	String id;
	String cust;
	String selltime;
	String totalcost;
	int sellnum;
	String cuname;
	
	
	
	public recieptVO(long barcode, String proid, int cost, int store, String id, String cust, String selltime,
			String totalcost, int sellnum, String cuname) {
		super();
		this.barcode = barcode;
		this.proid = proid;
		this.cost = cost;
		this.store = store;
		this.id = id;
		this.cust = cust;
		this.selltime = selltime;
		this.totalcost = totalcost;
		this.sellnum = sellnum;
		this.cuname = cuname;
	}
	public long getBarcode() {
		return barcode;
	}
	public void setBarcode(long barcode) {
		this.barcode = barcode;
	}
	public String getProid() {
		return proid;
	}
	public void setProid(String proid) {
		this.proid = proid;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public int getStore() {
		return store;
	}
	public void setStore(int store) {
		this.store = store;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCust() {
		return cust;
	}
	public void setCust(String cust) {
		this.cust = cust;
	}
	public String getSelltime() {
		return selltime;
	}
	public void setSelltime(String selltime) {
		this.selltime = selltime;
	}
	public String getTotalcost() {
		return totalcost;
	}
	public void setTotalcost(String totalcost) {
		this.totalcost = totalcost;
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
