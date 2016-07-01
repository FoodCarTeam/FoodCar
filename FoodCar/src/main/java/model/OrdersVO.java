package model;



public class OrdersVO implements java.io.Serializable {

	private Integer oID ;
	private Integer sID ;
	private Integer mID ;
	private java.sql.Date saleDate ;
	private Double totalPrice ;
	private Integer cksID ;
	private String oMemo ;
	
	public Integer getoID() {
		return oID;
	}
	public void setoID(Integer oID) {
		this.oID = oID;
	}
	public Integer getsID() {
		return sID;
	}
	public void setsID(Integer sID) {
		this.sID = sID;
	}
	public Integer getmID() {
		return mID;
	}
	public void setmID(Integer mID) {
		this.mID = mID;
	}
	public java.sql.Date getSaleDate() {
		return saleDate;
	}
	public void setSaleDate(java.sql.Date saleDate) {
		this.saleDate = saleDate;
	}
	public Double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Integer getCksID() {
		return cksID;
	}
	public void setCksID(Integer cksID) {
		this.cksID = cksID;
	}
	public String getoMemo() {
		return oMemo;
	}
	public void setoMemo(String oMemo) {
		this.oMemo = oMemo;
	}
	
}
