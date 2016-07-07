package stores.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import model.MapsVO;
import model.StoresVO;

public class StoresService {
	private StoresDAO storesDao = new StoresDAOHibernate();
	
	public static void main(String[]args){
//		測試showFoodCarsMap
//		StoresService service=new StoresService();
//		List<StoresVO> list=service.select();
//		for(StoresVO a:list){
//			System.out.println("sName:"+a.getsName());
//			Set<MapsVO> mapsVO=a.getMapVO();
//			for(MapsVO b:mapsVO){
//				
//				System.out.println(b.getLocation());
//			}
//		}
		StoresService service=new StoresService();
		StoresVO vo = service.select(1);
		Set<MapsVO> mapsVO = vo.getMapVO();
		System.out.println(vo.getsName());
		for(MapsVO a:mapsVO){
			System.out.println(a.getLocation());
		}
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
			result = storesDao.update(vo.getsUsername(), vo.getsPassword(), 
					vo.getsName(), vo.getsBossName(), vo.getsHours(), 
					vo.getsLogo(), vo.getsID());	
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
}
