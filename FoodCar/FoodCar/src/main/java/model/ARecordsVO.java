package model;

public class ARecordsVO implements java.io.Serializable {

	private Integer arID ;
	private Integer mID ;
	private java.sql.Date arDate ;
	private Double arAount ;
	private Integer oID ;
	
	public Integer getArID() {
		return arID;
	}
	public void setArID(Integer arID) {
		this.arID = arID;
	}
	public Integer getmID() {
		return mID;
	}
	public void setmID(Integer mID) {
		this.mID = mID;
	}
	public java.sql.Date getArDate() {
		return arDate;
	}
	public void setArDate(java.sql.Date arDate) {
		this.arDate = arDate;
	}
	public Double getArAount() {
		return arAount;
	}
	public void setArAount(Double arAount) {
		this.arAount = arAount;
	}
	public Integer getoID() {
		return oID;
	}
	public void setoID(Integer oID) {
		this.oID = oID;
	}
	
}
