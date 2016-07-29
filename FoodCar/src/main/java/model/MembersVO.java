package model;

import java.util.HashSet;
import java.util.Set;

public class MembersVO implements java.io.Serializable{

	private Integer mID ;
	private String mUsername ;
	private String mPassword ;
	private String mName ;
	private String mAddress ;
	private String mPhone ;
	private java.sql.Date mBirthday ;
	private String mIMG ;
	private Set<OrdersVO> ordersVO = new HashSet<OrdersVO>();
	private Set<OrderDetailsVO> orderDetailsVO = new HashSet<OrderDetailsVO>();
	private Set<CommentsVO> commentsVO = new HashSet<CommentsVO>();
	
	
	
	
	public Set<CommentsVO> getCommentsVO() {
		return commentsVO;
	}
	public void setCommentsVO(Set<CommentsVO> commentsVO) {
		this.commentsVO = commentsVO;
	}
	public Set<OrderDetailsVO> getOrderDetailsVO() {
		return orderDetailsVO;
	}
	public void setOrderDetailsVO(Set<OrderDetailsVO> orderDetailsVO) {
		this.orderDetailsVO = orderDetailsVO;
	}
	public Set<OrdersVO> getOrdersVO() {
		return ordersVO;
	}
	public void setOrdersVO(Set<OrdersVO> ordersVO) {
		this.ordersVO = ordersVO;
	}
	public Integer getmID() {
		return mID;
	}
	public void setmID(Integer mID) {
		this.mID = mID;
	}
	public String getmUsername() {
		return mUsername;
	}
	public void setmUsername(String mUsername) {
		this.mUsername = mUsername;
	}
	public String getmPassword() {
		return mPassword;
	}
	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmAddress() {
		return mAddress;
	}
	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	public java.sql.Date getmBirthday() {
		return mBirthday;
	}
	public void setmBirthday(java.sql.Date mBirthday) {
		this.mBirthday = mBirthday;
	}
	public String getmIMG() {
		return mIMG;
	}
	public void setmIMG(String mIMG) {
		this.mIMG = mIMG;
	}
}
