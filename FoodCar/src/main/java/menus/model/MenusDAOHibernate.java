package menus.model;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

import hibernate.util.HibernateUtil;
import model.MenusVO;

public class MenusDAOHibernate implements MenusDAO {

	private static final String SELECT = "from MenusVO where sID=:sID";
	private static final String GET_ALL_STMT = "from MenusVO";

	@Override
	public MenusVO select(Integer sID) {
		MenusVO menusVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			menusVO = (MenusVO) session.get(MenusVO.class, sID);

			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return menusVO;
	}

	@Override
	public MenusVO insert(MenusVO mnvo) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(mnvo);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().commit();
			throw ex;
		}
		return null;
	}

	@Override
	public MenusVO update(MenusVO mnvo) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.saveOrUpdate(mnvo);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return null;
	}

	@Override
	public boolean delete(Integer foodID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();

			MenusVO mnvo = new MenusVO();
			mnvo.setFoodID(foodID);
			session.delete(mnvo);

			session.getTransaction().commit();

		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return false;
	}

	@Override
	public List<MenusVO> getAll() {
		List<MenusVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public List<MenusVO> findByKey(Integer sID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<MenusVO> mnvo = null;
		try {
			session.beginTransaction();
			Query query = session.createQuery(SELECT);
			query.setParameter("sID", sID);
			mnvo = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return mnvo;
	}

}
