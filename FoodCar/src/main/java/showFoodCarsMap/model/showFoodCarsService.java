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
		// MapsVO vo=new MapsVO();
		// vo.setsID(1);
		// List<MapsVO> list=service.select(vo);
		// for(MapsVO a:list){
		// System.out.println(a.getsID());
		// }
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
//		測試範例：週一到週五0900-2100
		List<StoresVO> list = service2.select();
		String openTime = list.get(0).getsHours();
		Boolean result=service.openOrClose("週一到週五0800-2100");
		System.out.println(result);


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
	
	public Boolean openOrClose(String sHours){
		
		String openDate = sHours.substring(0, 5);
		
		String openWeek=openDate.substring(0,2);
		String closeWeek=openDate.substring(3);
		
		Calendar cal = Calendar.getInstance();
		int openWeekInt=0;
		int closeWeekInt=0;
		
//		Calendar的週日是1
		switch (openWeek) {
		case "週一":
			openWeekInt=Calendar.MONDAY;
			break;
		case "週二":
			openWeekInt=Calendar.TUESDAY;
			break;
		case "週三":
			openWeekInt=Calendar.WEDNESDAY;
			break;
		case "週四":
			openWeekInt=Calendar.THURSDAY;
			break;
		case "週五":
			openWeekInt=Calendar.FRIDAY;
			break;
		case "週六":
			openWeekInt=Calendar.SATURDAY;
			break;
		case "週日":
			openWeekInt=Calendar.SUNDAY;
			break;
		}
		
		switch (closeWeek) {
		case "週一":
			closeWeekInt=Calendar.MONDAY;
			break;
		case "週二":
			closeWeekInt=Calendar.TUESDAY;
			break;
		case "週三":
			closeWeekInt=Calendar.WEDNESDAY;
			break;
		case "週四":
			closeWeekInt=Calendar.THURSDAY;
			break;
		case "週五":
			closeWeekInt=Calendar.FRIDAY;
			break;
		case "週六":
			closeWeekInt=Calendar.SATURDAY;
			break;
		case "週日":
			closeWeekInt=Calendar.SUNDAY;
			break;
		}
//		u是星期幾
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd-u/HHmm");
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd-");
		
		Calendar tempCal=Calendar.getInstance();
		String nowTime=sdf.format(tempCal.getTime());
		String temp=sdf2.format(tempCal.getTime());
		
//		Calendar 週日是1
//		SimpleDateFormat 週日是7
		if(openWeekInt+1>=8){
			openWeekInt=1;
		}else{
			openWeekInt+=1;
		}
		if(closeWeekInt+1>=8){
			closeWeekInt=1;
		}else{
			closeWeekInt+=1;
		}

//		進行時分處理
		String openHours = sHours.substring(5);
		openHours.substring(0,4);
		openHours.substring(5);
		
		
//		進行比較
		try {
			Date open=sdf.parse(temp+openWeekInt+"/"+openHours.substring(0,4));
			Date close=sdf.parse(temp+closeWeekInt+"/"+openHours.substring(5));
			Date now=sdf.parse(nowTime);
			
			
			if((now.equals(open)||now.after(open))&&(now.equals(close)||now.before(close))){
				return true;
			}
			
			
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		return false;
	}
	
	

}
