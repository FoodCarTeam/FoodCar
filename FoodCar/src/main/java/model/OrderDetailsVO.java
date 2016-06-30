package model;


public class OrderDetailsVO implements java.io.Serializable {

	private Integer oID ;
	private Integer sID ;
	private String sName ;
	private String foodName ;
	private Double foodPrice ;
	private Integer foodQuantity ;
	private Integer mID ;
	private java.sql.Date saleDate ;
	private String odMemo ;
	
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
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public Double getFoodPrice() {
		return foodPrice;
	}
	public void setFoodPrice(Double foodPrice) {
		this.foodPrice = foodPrice;
	}
	public Integer getFoodQuantity() {
		return foodQuantity;
	}
	public void setFoodQuantity(Integer foodQuantity) {
		this.foodQuantity = foodQuantity;
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
	public String getOdMemo() {
		return odMemo;
	}
	public void setOdMemo(String odMemo) {
		this.odMemo = odMemo;
	}
	
	
}
