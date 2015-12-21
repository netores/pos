package PosVO;

public class ReceiptVO {
	
	
	private long barcode2;
	private String proid;
	private int cost;
	private int store;
	private String id;
	private String cust;
	private String selltime;
	private int totalcost;
	private int sellnum;
	private String cuname;
	private String payment;
	
	
	public ReceiptVO() {
		super();
	}


	public ReceiptVO(long barcode2, String proid, int cost, int store, String id, String cust, String selltime,
			int totalcost, int sellnum, String cuname, String payment) {
		super();
		this.barcode2 = barcode2;
		this.proid = proid;
		this.cost = cost;
		this.store = store;
		this.id = id;
		this.cust = cust;
		this.selltime = selltime;
		this.totalcost = totalcost;
		this.sellnum = sellnum;
		this.cuname = cuname;
		this.payment = payment;
	}


	public long getBarcode2() {
		return barcode2;
	}


	public void setBarcode2(long barcode2) {
		this.barcode2 = barcode2;
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


	public int getTotalcost() {
		return totalcost;
	}


	public void setTotalcost(int totalcost) {
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


	public String getPayment() {
		return payment;
	}


	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	
	
	
	

}
