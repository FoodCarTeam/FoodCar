package model;


public class KindsVO implements java.io.Serializable {

	private Integer kindID ;
	private String kindName ;
	private String kindMemo ;
	
	public Integer getKindID() {
		return kindID;
	}
	public void setKindID(Integer kindID) {
		this.kindID = kindID;
	}
	public String getKindName() {
		return kindName;
	}
	public void setKindName(String kindName) {
		this.kindName = kindName;
	}
	public String getKindMemo() {
		return kindMemo;
	}
	public void setKindMemo(String kindMemo) {
		this.kindMemo = kindMemo;
	}
	
	
}
