package model;

import java.util.Date;

public class ResponseVO implements java.io.Serializable {

	private Integer rID ;
	private Integer cID ;
	private String sName;
	private String mName;
	private Date cDate;
	private String cContent;
	private Byte[] cIP;
	
//	private CommentsVO commentsVO;
//	
//	
//	
//	
//	public CommentsVO getCommentsVO() {
//		return commentsVO;
//	}
//	public void setCommentsVO(CommentsVO commentsVO) {
//		this.commentsVO = commentsVO;
//	}
	public Integer getrID() {
		return rID;
	}
	public void setrID(Integer rID) {
		this.rID = rID;
	}
	public Integer getcID() {
		return cID;
	}
	public void setcID(Integer cID) {
		this.cID = cID;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public Byte[] getcIP() {
		return cIP;
	}
	public void setcIP(Byte[] cIP) {
		this.cIP = cIP;
	}
	
	
}
