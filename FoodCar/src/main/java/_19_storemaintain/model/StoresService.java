package _19_storemaintain.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import model.HoursVO;
import model.MapsVO;
import model.StoresVO;

public class StoresService {
	private StoresDAO storesDao = new StoresDAOHibernate();
	
	public static void main(String[]args){

//		測試Hours
//		StoresService service2=new StoresService();
//		List<StoresVO> list2=service2.select();
//		for(StoresVO b:list2){
//			System.out.println("sName:"+b.getsName());
//			Set<HoursVO> hoursVO=b.getHoursVO();
//			for(HoursVO c:hoursVO){
//				System.out.println(c.getMon());
//			}
//		}
		
	
		
		

	}
	public List<StoresVO> select() {
		List<StoresVO> result = null;
			result = storesDao.select();
		return result;
	}
	public StoresVO select(Integer sID){
		StoresVO result = null;
		if(sID!=null){
			result = storesDao.select(sID);
		}
		return result;
	}
	
	public StoresVO select2(String sUsername){
		StoresVO result = null;
		if(sUsername!=null){
			result = storesDao.select2(sUsername);
		}
		return result;
	}
	public StoresVO insert(StoresVO vo) {
		StoresVO result = null;
		if(vo!=null) {
			result = storesDao.insert(vo);
		}
		return result;
	}
	public StoresVO update(StoresVO vo) {
		StoresVO result = null;
		if(vo!=null) {
			result = storesDao.update(vo);	
		}
		return result;
	}
	public boolean delete(StoresVO vo) {
		boolean result = false;
		if(vo!=null) {
			result = storesDao.delete(vo.getsID());
		}
		return result;
	}
	
	public StoresVO login (String sUsername, String sPassword){
		StoresVO svo = storesDao.select2(sUsername);
		if(svo != null){
			if(sPassword != null && sPassword.trim().length() != 0){
				String Pass = svo.getsPassword();
				String temp = sPassword;
				if(temp.equals(Pass)){
					return svo;
				}
			}
		}
		return null;
		
	}
}
