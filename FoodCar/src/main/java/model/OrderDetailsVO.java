package model;


public class OrderDetailsVO implements java.io.Serializable {
    private Integer odID;
	private Integer oID ;
	private Integer sID ;
	private Integer foodID;
	private Integer foodQuantity ;
	private Integer mID ;
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
	public Integer getOdID() {
		return odID;
	}
	public void setOdID(Integer odID) {
		this.odID = odID;
	}
	public Integer getFoodID() {
		return foodID;
	}
	public void setFoodID(Integer foodID) {
		this.foodID = foodID;
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

	public String getOdMemo() {
		return odMemo;
	}
	public void setOdMemo(String odMemo) {
		this.odMemo = odMemo;
	}
	
	
}
