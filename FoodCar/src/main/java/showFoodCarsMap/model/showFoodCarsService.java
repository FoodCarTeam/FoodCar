package showFoodCarsMap.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import model.MapsVO;
import model.StoresVO;
import stores.model.StoresService;

public class showFoodCarsService {
	MapHibernateDao dao = new MapHibernateDao();

	public static void main(String[] args) {
		showFoodCarsService service = new showFoodCarsService();
		// 測試單查與全查
//		 MapsVO vo=new MapsVO();
//		 vo.setsID(1);
//		 List<MapsVO> list=service.select(vo);
//		 for(MapsVO a:list){
//		 System.out.println(a.getsID());
//		 }
		// 測試新增
		// MapsVO vo=new MapsVO();
		// vo.setsID(3);
		// vo.setLocation("213123");
		// MapsVO result=service.insert(vo);
		// System.out.println(result.getLocation());
		// 測試修改
		// MapsVO vo=new MapsVO();
		// vo.setLocation("3214124124124");
		// vo.setsID(3);
		// MapsVO temp=service.update(vo);
		// System.out.println(temp.getLocation());
		// 測試刪除
		// boolean result=service.delete(3);
		// System.out.println(result);

		StoresService service2 = new StoresService();

	}

	public List<MapsVO> select(MapsVO vo) {
		// 如果單查有東西就代表有這筆資料，沒有的話就全查
		MapsVO temp = null;
		List<MapsVO> list = null;
		temp = dao.select(vo.getsID());
		if (temp == null) {
			list = dao.select();
		} else {
			list = new ArrayList<MapsVO>();
			list.add(temp);
		}
		return list;
	}

	public MapsVO insert(MapsVO vo) {
		MapsVO temp = null;
		if (vo != null) {
			temp = dao.insert(vo);
		}
		return temp;
	}

	public MapsVO update(MapsVO vo) {
		MapsVO temp = null;
		if (vo != null) {
			temp = dao.update(vo);
		}
		return temp;
	}

	public Boolean delete(int sID) {
		boolean result = false;
		result = dao.delete(sID);
		return result;
	}
	
}
