package model;

public class ManagerVO implements java.io.Serializable{

	private Integer manageID;
	private String managerUser;
	private String managerPass;
	private String managerName;
	private String managerPhone;
	
	public Integer getManageID() {
		return manageID;
	}
	public void setManageID(Integer manageID) {
		this.manageID = manageID;
	}
	public String getManagerUser() {
		return managerUser;
	}
	public void setManagerUser(String managerUser) {
		this.managerUser = managerUser;
	}
	public String getManagerPass() {
		return managerPass;
	}
	public void setManagerPass(String managerPass) {
		this.managerPass = managerPass;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getManagerPhone() {
		return managerPhone;
	}
	public void setManagerPhone(String managerPhone) {
		this.managerPhone = managerPhone;
	}
	
	
}
