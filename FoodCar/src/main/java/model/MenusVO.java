package model;


public class MenusVO implements java.io.Serializable {

	private Integer foodID ;
	private String foodName ;
	private Integer sID ;
	private Integer kindID ;
	private Integer statusID ;
	private Double unitPrice ;
	private Byte[] foodIMG ;
	
	public Integer getFoodID() {
		return foodID;
	}
	public void setFoodID(Integer foodID) {
		this.foodID = foodID;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public Integer getsID() {
		return sID;
	}
	public void setsID(Integer sID) {
		this.sID = sID;
	}
	public Integer getKindID() {
		return kindID;
	}
	public void setKindID(Integer kindID) {
		this.kindID = kindID;
	}
	public Integer getStatusID() {
		return statusID;
	}
	public void setStatusID(Integer statusID) {
		this.statusID = statusID;
	}
	public Double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public Byte[] getFoodIMG() {
		return foodIMG;
	}
	public void setFoodIMG(Byte[] foodIMG) {
		this.foodIMG = foodIMG;
	}
}
