package PosVO;

public class StorelistVO {
	private long barcode;
	private String proid;
	private int cost;
	private int store;
	private String cuname;
	private int orders;
	
	public StorelistVO(){
		
	}
	
	public StorelistVO(long barcode, String proid, int cost, int store, String cuname) {
		super();
		this.barcode = barcode;
		this.proid = proid;
		this.cost = cost;
		this.store = store;
		this.cuname = cuname;
	}

	
	public StorelistVO(long barcode, String proid, int cost, int store, String cuname, int orders) {
		super();
		this.barcode = barcode;
		this.proid = proid;
		this.cost = cost;
		this.store = store;
		this.cuname = cuname;
		this.orders = orders;
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

	public String getCuname() {
		return cuname;
	}

	public void setCuname(String cuname) {
		this.cuname = cuname;
	}
	
	public int getOrders() {
		return orders;
	}

	public void setOrders(int orders) {
		this.orders = orders;
	}

	
	

}
