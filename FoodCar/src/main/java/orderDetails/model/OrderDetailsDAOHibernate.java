package orderDetails.model;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;

import hibernate.util.HibernateUtil;
import model.OrderDetailsVO;


public class OrderDetailsDAOHibernate implements OrderDetailsDAO {

	private SessionFactory sa;
	public OrderDetailsDAOHibernate(SessionFactory sa){
		this.sa=sa;
	}
	public Session getSession(){
		return sa.getCurrentSession();
	}
	
	
	@Override
	public OrderDetailsVO insert(OrderDetailsVO vo) {
			this.getSession().saveOrUpdate(vo);
		
		return null;
	}




}
