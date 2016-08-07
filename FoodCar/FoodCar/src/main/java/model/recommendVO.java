package model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;

public class recommendVO implements java.io.Serializable {

	
	private Integer rID;
	private Integer sID;
	private Integer mID;
	private MembersVO memberVO=new MembersVO();
	
	
	
	
	public MembersVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MembersVO memberVO) {
		this.memberVO = memberVO;
	}
	public Integer getrID() {
		return rID;
	}
	public void setrID(Integer rID) {
		this.rID = rID;
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
	
	

	
	
	
}
