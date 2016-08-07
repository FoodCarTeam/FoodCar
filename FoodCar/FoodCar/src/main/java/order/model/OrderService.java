package order.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


import model.OrdersVO;


public class OrderService {
	private OrderDAOHibernate orderDao ;
	
	public OrderService(OrderDAOHibernate dao){
		this.orderDao=dao;
	}
	
	
	
	public static void main(String[]args){

//		OrderService service=new OrderService();
//		service.select(1);
//		Date today=new Date();
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String temp=sdf.format(today);
//		Date tempDate=null;
//		try {
//		 tempDate=sdf.parse(temp);
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		System.out.println(new java.sql.Date(tempDate.getTime()));
//		
//		result.setsID(1);
//		result.setmID(1);
//		result.setSaleDate(new java.sql.Date(tempDate.getTime()));
//		result.setCheckOut(1);
//		result.setAmount(500);
//		service.insert(result);
		
		
	}

	public OrdersVO insert(OrdersVO vo) {
		OrdersVO result = null;
		if(vo!=null) {
			result = orderDao.insert(vo);
		}
		return result;
	}
	public OrdersVO select(Integer oID) {
		OrdersVO result = null;
		if(oID!=null) {
			result = orderDao.select(oID);
		}
		return result;
	}
	
	public OrdersVO update(OrdersVO vo) {
		OrdersVO result = null;
		if(vo!=null) {
			result = orderDao.update(vo);
		}
		return result;
	}
}
