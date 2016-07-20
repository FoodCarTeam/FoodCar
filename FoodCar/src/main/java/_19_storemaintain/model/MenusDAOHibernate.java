package _19_storemaintain.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

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
	public List<MenusVO> findByKey(Integer sID) {
		List<MenusVO> list = null;
		MenusVO mvo = new MenusVO();
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(SELECT);
			mvo = (MenusVO) session.get(MenusVO.class,sID);
			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
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

	public static void main(String[] args) {
		MenusDAOHibernate dao = new MenusDAOHibernate();

		// //insert
		// MenusVO mnvo = new MenusVO();
		// mnvo.setFoodName("綜合地瓜球");
		// mnvo.setsID(1);
		// mnvo.setKindID(10);
		// mnvo.setStatusID(1);
		// mnvo.setUnitPrice(40.0);
		// dao.insert(mnvo);
		// System.out.println(mnvo);

		// //update
		// MenusVO mnvo2 = new MenusVO();
		// mnvo2.setFoodID(1);
		// mnvo2.setFoodName("小小地瓜球");
		// mnvo2.setsID(1);
		// mnvo2.setKindID(10);
		// mnvo2.setStatusID(1);
		// mnvo2.setUnitPrice(40.0);
		// dao.update(mnvo2);
		// System.out.println(mnvo2);

		// //delete
		// dao.delete(1);

		// //Find By Key
		// List<MenusVO> list1 = dao.findByKey(2);
		// for(MenusVO mnvo:list1){
		// System.out.println(mnvo.getFoodID() + ",");
		// System.out.println(mnvo.getFoodName() + ",");
		// System.out.println(mnvo.getsID()+ ",");
		// System.out.println(mnvo.getKindID() + ",");
		// System.out.println(mnvo.getStatusID() + ",");
		// System.out.println(mnvo.getUnitPrice() + ",");
		// System.out.println(mnvo.getFoodIMG());
		// }

		// //getAll
		// List<MenusVO> list = dao.getAll();
		// for(MenusVO mnvo : list){
		// System.out.println(mnvo.getFoodID() + ",");
		// System.out.println(mnvo.getFoodName() + ",");
		// System.out.println(mnvo.getsID()+ ",");
		// System.out.println(mnvo.getKindID() + ",");
		// System.out.println(mnvo.getStatusID() + ",");
		// System.out.println(mnvo.getUnitPrice() + ",");
		// System.out.println(mnvo.getFoodIMG());
		// }
	}

}
