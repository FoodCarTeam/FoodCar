package menus.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import model.MapsVO;
import model.MenusVO;


public class MenusService {
	private MenusDAO menusDao = new MenusDAOHibernate();
	
	public static void main(String[]args){
//		測試showFoodCarsMap
//		StoresService service=new StoresService();
//		List<StoresVO> list=service.select();
//		for(StoresVO a:list){
//			System.out.println("sName:"+a.getsName());
//			Set<MapsVO> mapsVO=a.getMapVO();
//			for(MapsVO b:mapsVO){
//				System.out.println(b.getLocation());
//			}
//		}
		
		MenusService service = new MenusService();
		
		service.delete(4);
	}
	
	public MenusVO select(Integer sID){
		MenusVO result = null;
		if(sID!=null){
			result = menusDao.select(sID);
//			int statusID=result.getStatusID();
		}
		return result;
	}
	public MenusVO insert(MenusVO vo) {
		MenusVO result = null;
		if(vo!=null) {
			result = menusDao.insert(vo);
		}
		return result;
	}
	public MenusVO update(MenusVO vo) { 
		MenusVO result = null;
		if(vo!=null) {
			result = menusDao.update(vo);   
		}
		return result;
	}
	public boolean delete(Integer foodID) {
		boolean result = false;
		if(foodID!=null) {
			result = menusDao.delete(foodID);
		}
		return result;
	}
}
