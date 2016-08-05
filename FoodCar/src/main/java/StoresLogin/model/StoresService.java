package StoresLogin.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import model.HoursVO;
import model.MapsVO;
import model.MembersVO;
import model.StoresVO;


public class StoresService {
	private StoresDAOHibernate dao;

	public StoresService(StoresDAOHibernate dao){
		this.dao=dao;
	}
	
	
//	public static void main(String[] args) {

		// 測試Hours
		// StoresService service2=new StoresService();
		// List<StoresVO> list2=service2.select();
		// for(StoresVO b:list2){
		// System.out.println("sName:"+b.getsName());
		// Set<HoursVO> hoursVO=b.getHoursVO();
		// for(HoursVO c:hoursVO){
		// System.out.println(c.getMon());
		// }
		// }

//	}

	public List<StoresVO> select() {
		List<StoresVO> result = null;
		result = dao.select();
		return result;
	}

	public StoresVO select_sID(Integer sID) {
		StoresVO result = null;
		if (sID != null) {
			result = dao.select_sID(sID);
		}
		return result;
	}

	public StoresVO select_sUser(String sUsername) {
		StoresVO result = null;
		if (sUsername != null) {
			result = dao.select_sUser(sUsername);
		}
		return result;
	}

	public StoresVO insert(StoresVO vo) {
		StoresVO result = null;
		if (vo != null) {
			result = dao.insert(vo);
		}
		return result;
	}

	public StoresVO update(StoresVO vo) {
		StoresVO result = null;
		if (vo != null) {
			result = dao.update(vo);
		}
		return result;
	}

	public boolean delete(StoresVO vo) {
		boolean result = false;
		if (vo != null) {
			result = dao.delete(vo.getsID());
		}
		return result;
	}

	public StoresVO login(String sUsername, String sPassword) {
		StoresVO svo = dao.select_sUser(sUsername);
		if (svo != null) {
			if (sPassword != null && sPassword.trim().length() != 0) {
				String Pass = svo.getsPassword();
				String temp = sPassword;
				if (temp.equals(Pass)) {
					return svo;
				}
			}
		}
		return null;

	}

	public StoresVO changePass(String sUser, String sPass, String newPass) {
		StoresVO svo = this.login(sUser, sPass);
		if (svo != null) {
			svo.setsPassword(newPass);
			return dao.update(svo);
		}
		return null;
	}
}
