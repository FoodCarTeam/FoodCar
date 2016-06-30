package model;


public class AdvertiseVO implements java.io.Serializable {

	private Integer adID ;
	private Integer sID ;
	private String sName ;
	private Byte[] adIMG ;
	
	public Integer getAdID() {
		return adID;
	}
	public void setAdID(Integer adID) {
		this.adID = adID;
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
	public Byte[] getAdIMG() {
		return adIMG;
	}
	public void setAdIMG(Byte[] adIMG) {
		this.adIMG = adIMG;
	}
	
}
