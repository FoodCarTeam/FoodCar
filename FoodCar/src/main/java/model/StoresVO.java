package model;


public class StoresVO implements java.io.Serializable {

	private Integer sID ;
	private String sUsername ;
	private String sPassword ;
	private String sName ;
	private String sBossName ;
	private String sHours ;
	private Byte[] sLogo ;
	
	public Integer getsID() {
		return sID;
	}
	public void setsID(Integer sID) {
		this.sID = sID;
	}
	public String getsUsername() {
		return sUsername;
	}
	public void setsUsername(String sUsername) {
		this.sUsername = sUsername;
	}
	public String getsPassword() {
		return sPassword;
	}
	public void setsPassword(String sPassword) {
		this.sPassword = sPassword;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsBossName() {
		return sBossName;
	}
	public void setsBossName(String sBossName) {
		this.sBossName = sBossName;
	}
	public String getsHours() {
		return sHours;
	}
	public void setsHours(String sHours) {
		this.sHours = sHours;
	}
	public Byte[] getsLogo() {
		return sLogo;
	}
	public void setsLogo(Byte[] sLogo) {
		this.sLogo = sLogo;
	}
	
}
