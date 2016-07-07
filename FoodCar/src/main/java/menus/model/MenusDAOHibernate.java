package menus.model;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

import hibernate.util.HibernateUtil;
import model.MenusVO;


public class MenusDAOHibernate implements MenusDAO{

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
	public MenusVO insert(MenusVO bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MenusVO update() {
		
		return null;
	}

	@Override
	public boolean delete(Integer id) {
		// TODO Auto-generated method stub
		return false;
	}

	
   
}
