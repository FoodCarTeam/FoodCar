package order.model;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;

import hibernate.util.HibernateUtil;

import model.OrdersVO;
import model.StoresVO;

public class OrderDAOHibernate implements OrderDAO {

	
	
	SessionFactory sf;

	public OrderDAOHibernate(SessionFactory sf){
		this.sf=sf;
	}
	
	public Session getSession(){
		return sf.getCurrentSession();
	}

	@Override
	public OrdersVO insert(OrdersVO vo) {
			this.getSession().saveOrUpdate(vo);
		
		return null;
	}

	@Override
	public OrdersVO select(Integer oID) {
		return (OrdersVO) this.getSession().get(OrdersVO.class, oID);
	}

	@Override
	public OrdersVO update(OrdersVO vo) {
			this.getSession().saveOrUpdate(vo);
		
		return null;
	}
    
	



}
