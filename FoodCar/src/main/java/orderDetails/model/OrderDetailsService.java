package orderDetails.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import model.OrderDetailsVO;



public class OrderDetailsService {
	private OrderDetailsDAO orderDetailsDao = new OrderDetailsDAOHibernate();
	
	public static void main(String[]args){

//		OrderDetailsService service=new OrderDetailsService();
//		OrderDetailsVO result = new OrderDetailsVO();
//	
//		result.setsID(1);
//		result.setmID(1);
//		result.setoID(1);
//		result.setFoodID(1);
//		result.setFoodName("11");
//		result.setFoodQuantity(12);
//		result.setUnitPrice(30);
//		result.setsName("123");
//		result.setTotalPrice(123);
//		result.setOdMemo("123123123");
//		
//		service.insert(result);
		
		
	}

	public OrderDetailsVO insert(OrderDetailsVO vo) {
		OrderDetailsVO result = null;
		if(vo!=null) {
			result = orderDetailsDao.insert(vo);
			
		}
		return result;
	}
}
