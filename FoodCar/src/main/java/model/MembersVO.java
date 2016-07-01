package model;



public class MembersVO implements java.io.Serializable{

	private Integer mID ;
	private String mUsername ;
	private String mPassword ;
	private String mName ;
	private String mAddress ;
	private String mPhone ;
	private java.sql.Date mBirthday ;
	private Byte[] mIMG ;
	
	public Integer getmID() {
		return mID;
	}
	public void setmID(Integer mID) {
		this.mID = mID;
	}
	public String getmUsername() {
		return mUsername;
	}
	public void setmUsername(String mUsername) {
		this.mUsername = mUsername;
	}
	public String getmPassword() {
		return mPassword;
	}
	public void setmPassword(String mPassword) {
		this.mPassword = mPassword;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getmAddress() {
		return mAddress;
	}
	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}
	public String getmPhone() {
		return mPhone;
	}
	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}
	public java.sql.Date getmBirthday() {
		return mBirthday;
	}
	public void setmBirthday(java.sql.Date mBirthday) {
		this.mBirthday = mBirthday;
	}
	public Byte[] getmIMG() {
		return mIMG;
	}
	public void setmIMG(Byte[] mIMG) {
		this.mIMG = mIMG;
	}
}
