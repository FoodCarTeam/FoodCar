package openTime.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.In;

import model.HoursVO;

public class HoursService {
	
	HoursHibernateDao dao;
	public HoursService(HoursHibernateDao dao){
		this.dao=dao;
	}
	
	
	
	
	public static void main(String[]args){
//		測試單查
//		HoursService service=new HoursService();
//		HoursVO vo=new HoursVO();
//		vo=service.select(1);
//		System.out.println(vo.getsID());
//		測試多查
//		List<HoursVO> list=new LinkedList<HoursVO>();
//		list=service.select();
//		for(HoursVO a:list){
//			System.out.println(a.getsID());
//		}
//	測試店家是否開們
//		boolean result=service.openOrClose(1);
//		System.out.println(result);
		
	}
	
	
	public HoursVO select(int sID){
		HoursVO vo=new HoursVO();
		vo=dao.select(sID);
		return vo;
	}
	
	public List<HoursVO> select(){
		List<HoursVO> list=new LinkedList<HoursVO>();
		list=dao.select();
		return list;
	}
	
	public HoursVO update(HoursVO vo){
		HoursVO result=new HoursVO();
		result=dao.update(vo);
		return result;
	}
	
	public HoursVO insert(HoursVO vo){
		HoursVO result=new HoursVO();
		result=dao.insert(vo);
		return result;
	}
	
	public boolean openOrClose(int sID){
		HoursVO vo=new HoursVO();
		vo=dao.select(sID);
		
		Calendar ca=Calendar.getInstance();
		int nowWeekTemp=ca.get(Calendar.DAY_OF_WEEK);
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd/HH:mm");
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
		String temp=sdf2.format(ca.getTime());
		
		String nowTime=sdf.format(ca.getTime());
		Date Nowdate=null;
		Date tempTime=null;
		try {
			 Nowdate=sdf.parse(nowTime);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String nowWeek=null;
		switch (nowWeekTemp) {
		case Calendar.MONDAY:
			nowWeek="mon";
			break;
		case Calendar.TUESDAY:
			nowWeek="tue";
			break;
		case Calendar.WEDNESDAY:
			nowWeek="wed";
			break;
		case Calendar.THURSDAY:
			nowWeek="thu";
			break;
		case Calendar.FRIDAY:
			nowWeek="fri";
			break;
		case Calendar.SATURDAY:
			nowWeek="sat";
			break;
		case Calendar.SUNDAY:
			nowWeek="sun";
			break;
		}
//		System.out.println("nowWeek:"+nowWeek);
		
		 List<String> list=new ArrayList<String>();
		list.add(Integer.toString(vo.getsID()));
		list.add(vo.getSun());
		list.add(vo.getMon());
		list.add(vo.getTue());
		list.add(vo.getWed());
		list.add(vo.getThu());
		list.add(vo.getFri());
		list.add(vo.getSat());
		
//		for(String a:list){
//			System.out.println(a);
//		}
//		System.out.println("get:"+(String)list.get(0));
//		System.out.println("nowWeekTemp:"+nowWeekTemp);
		
			if(list.get(nowWeekTemp)!=null){
				String openTemp=list.get(nowWeekTemp).substring(0,5);
				String closeTemp=list.get(nowWeekTemp).substring(6,10);
				SimpleDateFormat open=new SimpleDateFormat("yyyy-MM-dd/HH:mm");
				SimpleDateFormat close=new SimpleDateFormat("yyyy-MM-dd/HH:mm");
				System.out.println(openTemp);
				System.out.println(openTemp);
//				System.out.println("temp"+temp);
				Date openDate=null;
				Date closeDate=null;
				try {
					 openDate=open.parse(temp+"/"+openTemp);
					 closeDate=close.parse(temp+"/"+closeTemp);
//					System.out.println("openDate:"+openDate);
//					System.out.println("closeDate:"+closeDate);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
				if((Nowdate.equals(openDate)||Nowdate.after(openDate))&&(Nowdate.equals(closeDate)||Nowdate.before(closeDate))){

					return true;

				}
			}
		
		return false;
	}
	
	
	
}
