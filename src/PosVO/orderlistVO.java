package PosVO;

public class orderlistVO {
	private long barcode;
	private String proid;
	private int cost;
	private int ordercount;
	private String cuname;
	private String orderdate;
	private int store;

	

	public int getOrdercount() {
		return ordercount;
	}


	public void setOrdercount(int ordercount) {
		this.ordercount = ordercount;
	}


	public int getStore() {
		return store;
	}


	public void setStore(int store) {
		this.store = store;
	}


	public orderlistVO(long barcode, String proid, int cost, int ordercount, String cuname) {
		super();
		this.barcode = barcode;
		this.proid = proid;
		this.cost = cost;
		this.ordercount = ordercount;
		this.cuname = cuname;
	}

	
	public orderlistVO(long barcode, String proid, int cost, int ordercount, String cuname, String orderdate) {
		super();
		this.barcode = barcode;
		this.proid = proid;
		this.cost = cost;
		this.ordercount = ordercount;
		this.cuname = cuname;
		this.orderdate = orderdate;
	}


	public orderlistVO(long barcode, String proid, int cost, int ordercount, String cuname, String orderdate,
			int store) {
		super();
		this.barcode = barcode;
		this.proid = proid;
		this.cost = cost;
		this.ordercount = ordercount;
		this.cuname = cuname;
		this.orderdate = orderdate;
		this.store = store;
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

	public int getordercount() {
		return ordercount;
	}

	public void setordercount(int ordercount) {
		this.ordercount = ordercount;
	}

	public String getCuname() {
		return cuname;
	}

	public void setCuname(String cuname) {
		this.cuname = cuname;
	}
	
	public String getOrderdate() {
		return orderdate;
	}

	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}

	
	

}
