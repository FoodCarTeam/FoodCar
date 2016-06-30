package model;



public class CheckoutStatusVO implements java.io.Serializable {

	private Integer cksID ;
	private String cksName ;
	private String cksMemo ;
	
	public Integer getCksID() {
		return cksID;
	}
	public void setCksID(Integer cksID) {
		this.cksID = cksID;
	}
	public String getCksName() {
		return cksName;
	}
	public void setCksName(String cksName) {
		this.cksName = cksName;
	}
	public String getCksMemo() {
		return cksMemo;
	}
	public void setCksMemo(String cksMemo) {
		this.cksMemo = cksMemo;
	}
	
	
}
