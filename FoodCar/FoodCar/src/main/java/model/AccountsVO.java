package model;

public class AccountsVO implements java.io.Serializable {

	private Integer aID ;
	private Integer mID ;
	private Double balance ;
	
	public Integer getaID() {
		return aID;
	}
	public void setaID(Integer aID) {
		this.aID = aID;
	}
	public Integer getmID() {
		return mID;
	}
	public void setmID(Integer mID) {
		this.mID = mID;
	}
	public Double getBalance() {
		return balance;
	}
	public void setBalance(Double balance) {
		this.balance = balance;
	}
	
}
