package _20_managemaintain.model;

import model.ManagerVO;

public class ManagerService {
	private ManagerDAO managerdao;
	
//	public static void main (String[] args){
//		//login
////		ManagerService manageService = new ManagerService();
////		ManagerVO managevo = manageService.login("bluesky", "bluesky");
////		System.out.println(managevo);
//	}
	public ManagerService( ManagerDAOHibernate dao){
		this.managerdao=dao;
	}
	
	
	

	public ManagerVO select(Integer manageID) {
		ManagerVO result = null;
		if (manageID != null) {
			result = managerdao.select(manageID);
		}
		return result;
	}
	
	public ManagerVO select2(String managerUser) {
		ManagerVO result = null;
		if (managerUser != null) {
			result = managerdao.select2(managerUser);
		}
		return result;
	}

	public ManagerVO insert(ManagerVO managevo) {
		ManagerVO result = null;
		if (managevo != null) {
			result = managerdao.insert(managevo);
		}
		return result;
	}

	public ManagerVO update(ManagerVO managevo) {
		ManagerVO result = null;
		if (managevo != null) {
			result = managerdao.update(managevo);
		}
		return result;
	}

	public boolean delete(ManagerVO managevo) {
		boolean result = false;
		if (managevo != null) {
			result = managerdao.delete(managevo.getManageID());
		}
		return result;
	}

	public ManagerVO login(String managerUser, String managerPass) {
		ManagerVO managevo = managerdao.select2(managerUser);
		if (managevo != null) {
//			System.out.println("sadasd");
			if (managerPass != null && managerPass.trim().length() != 0) {
				String Pass = managevo.getManagerPass();
				String temp = managerPass;
				if (temp.equals(Pass)) {
					return managevo;
				}
			}
		}
		return null;
	}
}
