package _20_managemaintain.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;
import model.ManagerVO;

public class ManagerDAOHibernate implements ManagerDAO {

	private static final String SELECT = "from ManagerVO where managerUser=?";

//	public static void main(String[] args) {
//		ManagerDAOHibernate mdaoHibernate = new ManagerDAOHibernate();
//
//		// insert
//		// ManagerVO managevo = new ManagerVO();
//		// managevo.setManagerUser("bluesky");
//		// managevo.setManagerPass("bluesky");
//		// managevo.setManagerName("藍");
//		// mdaoHibernate.insert(managevo);
//		// System.out.println(managevo);
//		
//		//select2
//		// ManagerVO managevo = new ManagerVO();
//		// managevo = mdaoHibernate.select2("johnsonweng");
//		// System.out.println(managevo);
//	}

	@Override
	public ManagerVO select(Integer manageID) {
		ManagerVO managevo = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			managevo = (ManagerVO) session.get(ManagerVO.class, manageID);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return managevo;
	}

	@Override
	public ManagerVO select2(String managerUser) {
		ManagerVO managevo = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(SELECT);
			query.setString(0, managerUser);
			managevo = (ManagerVO) query.uniqueResult();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return managevo;
	}

	@Override
	public ManagerVO insert(ManagerVO bean) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.save(bean);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return null;
	}

	@Override
	public ManagerVO update(ManagerVO bean) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.update(bean);
			session.getTransaction();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return null;
	}

	@Override
	public boolean delete(Integer manageID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			ManagerVO managevo = new ManagerVO();
			managevo.setManageID(manageID);
			session.delete(manageID);

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}

		return false;
	}

	@Override
	public List<ManagerVO> select() {
		List<ManagerVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from ManagerVO");
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}
}
