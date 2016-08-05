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
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(vo);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return null;
	}




}
