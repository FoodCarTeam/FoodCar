package model;


public class FavoritiesVO implements java.io.Serializable {

	private Integer fID ;
	private Integer mID ;
	private Integer sID ;
	private String sName ;
	
	public Integer getfID() {
		return fID;
	}
	public void setfID(Integer fID) {
		this.fID = fID;
	}
	public Integer getmID() {
		return mID;
	}
	public void setmID(Integer mID) {
		this.mID = mID;
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
	
	
}
