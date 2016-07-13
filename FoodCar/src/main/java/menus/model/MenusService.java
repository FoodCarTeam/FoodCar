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
	public MenusVO update(MenusVO vo) {  //注意!!update未完成
		MenusVO result = null;
		if(vo!=null) {
			   
		}
		return result;
	}
	public boolean delete(MenusVO vo) {
		boolean result = false;
		if(vo!=null) {
			result = menusDao.delete(vo.getsID());
		}
		return result;
	}
}
