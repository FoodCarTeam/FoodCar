package order.model;

import java.util.List;

import model.OrdersVO;


public interface OrderDAO {
	

	OrdersVO insert(OrdersVO vo);
	OrdersVO select(Integer oID);
	OrdersVO update(OrdersVO vo);
}
