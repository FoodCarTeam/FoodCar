package model;

import java.util.HashSet;
import java.util.Set;

public class CommentsVO implements java.io.Serializable {

	private Integer cID ;
	private Integer mID ;
	private Integer sID ;
	private java.sql.Date cDate ;
	private String cContent ;
	private String cPoint ;
	private Byte[] cIP ;
	
	private Set<ResponseVO> responseVO=new HashSet<ResponseVO>();
	
	
	public Set<ResponseVO> getResponseVO() {
		return responseVO;
	}
	public void setResponseVO(Set<ResponseVO> responseVO) {
		this.responseVO = responseVO;
	}
	public Integer getsID() {
		return sID;
	}
	public void setsID(Integer sID) {
		this.sID = sID;
	}
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
	public String getcPoint() {
		return cPoint;
	}
	public void setcPoint(String point) {
		this.cPoint = point;
	}
	public Byte[] getcIP() {
		return cIP;
	}
	public void setcIP(Byte[] cIP) {
		this.cIP = cIP;
	}
	
	
}
