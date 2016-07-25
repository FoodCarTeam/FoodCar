package model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class OrdersVO implements java.io.Serializable {

	private Integer oID ;
	private Integer sID ;
	private Integer mID ;
	private Integer amount ;
	private Date saleDate ;
	private Integer checkOut ;
	private String  sName;
	private Set<OrderDetailsVO> orderDetailsVO = new HashSet<OrderDetailsVO>();
	
	
	public Set<OrderDetailsVO> getOrderDetailsVO() {
		return orderDetailsVO;
	}
	public void setOrderDetailsVO(Set<OrderDetailsVO> orderDetailsVO) {
		this.orderDetailsVO = orderDetailsVO;
	}
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
	public Date getSaleDate() {
		return saleDate;
	}
	public void setSaleDate(Date saleDate) {
		this.saleDate = saleDate;
	}

	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Integer getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(Integer checkOut) {
		this.checkOut = checkOut;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
    
	
}
