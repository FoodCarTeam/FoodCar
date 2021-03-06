package model;

import java.util.HashSet;
import java.util.Set;

public class MenusVO implements java.io.Serializable {

	private Integer foodID ;
	private String foodName ;
	private Integer sID ;
	private Integer kindID ;
	private Integer statusID ;
	private Integer unitPrice ;
	private String foodIMG ;
	private StoresVO stroeVO;
	private Set<StoresVO> stores = new HashSet<StoresVO>();
	
	public Set<StoresVO> getStores() {
		return stores;
	}
	public void setStores(Set<StoresVO> stores) {
		this.stores = stores;
	}
	public StoresVO getStroeVO() {
		return stroeVO;
	}
	public void setStroeVO(StoresVO stroeVO) {
		this.stroeVO = stroeVO;
	}
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
	public Integer getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getFoodIMG() {
		return foodIMG;
	}
	public void setFoodIMG(String foodIMG) {
		this.foodIMG = foodIMG;
	}
}
