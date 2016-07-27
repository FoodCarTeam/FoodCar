package StoresLogin.model;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;
import model.StoresVO;

public class StoresDAOHibernate implements StoresDAO {

	private static final String SELECT = "from StoresVO where sUsername=?";

//	public static void main(String[] args) {
//		StoresDAOHibernate dao = new StoresDAOHibernate();
//		// select
//		// StoresVO vo=new StoresVO();
//		// vo=dao.select(1);
//		// System.out.println(vo.getsName());
//
//		// StoresVO svo = new StoresVO();
//		// svo = dao.select2("0917-526-157");
//		// System.out.println(svo);
//	}

	@Override
	public StoresVO select(Integer sID) {

		StoresVO storesVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			storesVO = (StoresVO) session.get(StoresVO.class, sID);

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return storesVO;
	}

	@Override
	public StoresVO select2(String sUsername) {
		StoresVO svo = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(SELECT);
			query.setString(0, sUsername);
			svo = (StoresVO) query.uniqueResult();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return svo;
	}

	@Override
	public List<StoresVO> select() {
		List<StoresVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from StoresVO");
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public StoresVO insert(StoresVO bean) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(bean);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return null;
	}

	@Override
	public StoresVO update(StoresVO bean) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.update(bean);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return bean;
	}

	@Override
	public boolean delete(Integer sID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			StoresVO svo = new StoresVO();
			svo.setsID(sID);
			session.delete(svo);

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return false;
	}

}
