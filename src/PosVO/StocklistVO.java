package PosVO;

public class StocklistVO {
	long barcode;
	String proid;
	int cost;
	int store;
	String id;
	String cuname;
	String indate;
	
	public StocklistVO(long barcode, String proid, int cost, int store, String id, String cuname, String indate) {
		super();
		this.barcode = barcode;
		this.proid = proid;
		this.cost = cost;
		this.store = store;
		this.id = id;
		this.cuname = cuname;
		this.indate = indate;
	}
	public StocklistVO(long barcode, String proid, int cost, int store, String id, String cuname) {
		super();
		this.barcode = barcode;
		this.proid = proid;
		this.cost = cost;
		this.store = store;
		this.id = id;
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

	public String getCuname() {
		return cuname;
	}

	public void setCuname(String cuname) {
		this.cuname = cuname;
	}

	public String getIndate() {
		return indate;
	}

	public void setIndate(String indate) {
		this.indate = indate;
	}
	
	
}
