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
////		測試範例：週一到週五0900-2100
		List<StoresVO> list = service2.select();
		String openTime = list.get(0).getsHours();
		Boolean result=service.openOrClose("週一到週五1000-2200");
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
		Calendar tempCal2=Calendar.getInstance();
		String nowTime=sdf.format(tempCal.getTime());
		
		
		
//		System.out.println("現在"+tempCal.get(Calendar.DAY_OF_WEEK));
//		tempCal.add(Calendar.DATE,1);
		
		int beginDayTemp=tempCal.get(Calendar.DAY_OF_WEEK);
		int beginDayTempCount=0;
		
		int finishDayTemp=tempCal.get(Calendar.DAY_OF_WEEK);
		int finishDayTempCount=0;
		System.out.println("開始前openWeekInt:"+openWeekInt);
		System.out.println("開始前finishDayTemp"+finishDayTemp);
		System.out.println("開始前beginDayTemp"+beginDayTemp);
		System.out.println("開始前closeWeekInt:"+closeWeekInt);
		
//		System.out.println("openWeekInt:"+openWeekInt);
//		System.out.println("closeWeekInt"+closeWeekInt);
		
		while(beginDayTemp!=openWeekInt){
			beginDayTempCount+=1;
			if(beginDayTemp-1==0){
				beginDayTemp=7;
			}else{
				beginDayTemp=beginDayTemp-1;
			}
		}
		
		while(finishDayTemp!=closeWeekInt){
			finishDayTempCount+=1;
			if(finishDayTemp+1==8){
				beginDayTemp=1;
			}else{
				finishDayTemp=finishDayTemp+1;
			}
		}
	
		System.out.println("openWeekInt:"+openWeekInt);
		System.out.println("finishDayTemp"+finishDayTemp);
		System.out.println("beginDayTemp"+beginDayTemp);
		
		System.out.println("beginDayTempCount:"+beginDayTempCount);
		System.out.println("finishDayTempCount"+finishDayTempCount);
		tempCal.add(Calendar.DAY_OF_WEEK,-beginDayTempCount );
		tempCal2.add(Calendar.DAY_OF_WEEK,finishDayTempCount );
		String tempStart=sdf2.format(tempCal.getTime());
		String tempEnd=sdf2.format(tempCal2.getTime());
			
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
		
		
		SimpleDateFormat openHHmm=new SimpleDateFormat("HHmm");
		SimpleDateFormat closeHHmm=new SimpleDateFormat("HHmm");
		Date openHHmm1=null;
		Date closeHHmm1=null;

		
		
//		進行比較
		try {
			
			openHHmm1 = openHHmm.parse(openHours.substring(0,4));
			closeHHmm1 = closeHHmm.parse(openHours.substring(5));
			
			Date openDate1=sdf.parse(tempStart+openWeekInt+"/"+openHours.substring(0,4));
			Date closeDate1=sdf.parse(tempEnd+closeWeekInt+"/"+openHours.substring(5));
			Date now=sdf.parse(nowTime);
			
			
			System.out.println("openDate1"+openDate1);
			System.out.println("closeDate1"+closeDate1);
			System.out.println("nowTime"+now);
			System.out.println("tempStart:"+tempStart);
			System.out.println("openWeekInt:"+openWeekInt);
			System.out.println("openHHmm1:"+openHHmm1);
			System.out.println("closeHHmm1:"+closeHHmm1);
			
			if((now.equals(openDate1)||now.after(openDate1))&&(now.equals(closeDate1)||now.before(closeDate1))){
//				if((now.equals(openHHmm1)||now.after(openHHmm1))&&(now.equals(closeHHmm1)||now.before(closeHHmm1))){
				return true;
//				}
			}			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	

}
