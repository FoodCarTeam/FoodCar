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

	@Override
	public OrdersVO select(Integer oID) {
		OrdersVO ordersVO = null;
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
		try {
			session.beginTransaction();
			ordersVO = (OrdersVO) session.get(OrdersVO.class, oID);
			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return ordersVO;
	}

	@Override
	public OrdersVO update(OrdersVO vo) {
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
