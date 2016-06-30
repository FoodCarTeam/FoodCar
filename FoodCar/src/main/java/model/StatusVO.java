package model;



public class StatusVO implements java.io.Serializable {

	private Integer statusID ;
	private	String statusName ;
	private String statusMemo ;
	
	
	public Integer getStatusID() {
		return statusID;
	}
	public void setStatusID(Integer statusID) {
		this.statusID = statusID;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	public String getStatusMemo() {
		return statusMemo;
	}
	public void setStatusMemo(String statusMemo) {
		this.statusMemo = statusMemo;
	}
	
	

}
