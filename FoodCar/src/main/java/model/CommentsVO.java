package model;

public class CommentsVO implements java.io.Serializable {

	private Integer cID ;
	private Integer mID ;
	private java.sql.Date cDate ;
	private String cContent ;
	private String cRespone ;
	private String point ;
	private Byte[] cIP ;
	
	public Integer getcID() {
		return cID;
	}
	public void setcID(Integer cID) {
		this.cID = cID;
	}
	public Integer getmID() {
		return mID;
	}
	public void setmID(Integer mID) {
		this.mID = mID;
	}
	public java.sql.Date getcDate() {
		return cDate;
	}
	public void setcDate(java.sql.Date cDate) {
		this.cDate = cDate;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public String getcRespone() {
		return cRespone;
	}
	public void setcRespone(String cRespone) {
		this.cRespone = cRespone;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public Byte[] getcIP() {
		return cIP;
	}
	public void setcIP(Byte[] cIP) {
		this.cIP = cIP;
	}
	
	
}
