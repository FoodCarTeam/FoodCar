package menus.model;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;

import hibernate.util.HibernateUtil;
import model.MenusVO;
import model.StoresVO;

public class MenusDAOHibernate implements MenusDAO {

	private static final String SELECT = "from MenusVO where sID=:sID";
	private static final String GET_ALL_STMT = "from MenusVO";

	SessionFactory sf;
	
	public MenusDAOHibernate(SessionFactory sf){
		this.sf=sf;
	}
	public Session getSession(){
		return sf.getCurrentSession();
	}
	
	
	
	@Override
	public MenusVO select(Integer sID) {
		MenusVO menusVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			menusVO = (MenusVO) session.get(MenusVO.class, sID);
		return menusVO;
	}

	@Override
	public MenusVO insert(MenusVO mnvo) {
		Session session =getSession();
			session.saveOrUpdate(mnvo);
		return null;
	}

	@Override
	public MenusVO update(MenusVO mnvo) {
		Session session =getSession();
			session.saveOrUpdate(mnvo);
		return null;
	}

	@Override
	public boolean delete(Integer foodID) {
		Session session = getSession();
			MenusVO mnvo = (MenusVO) session.get(MenusVO.class, foodID);
			mnvo.getStroeVO().getMenusVO().remove(mnvo);
			mnvo.setStroeVO(null);
			session.delete(mnvo);
		return false;
	}

	@Override
	public List<MenusVO> getAll() {
		List<MenusVO> list = null;
		Session session = getSession();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
		return list;
	}

	@Override
	public List<MenusVO> findByKey(Integer sID) {
		Session session =getSession();
		List<MenusVO> mnvo = null;
			Query query = session.createQuery(SELECT);
			query.setParameter("sID", sID);
			mnvo = query.list();
		return mnvo;
	}

	@Override
	public MenusVO selectfood(Integer foodID) {
		MenusVO menusVO = null;
		Session session = getSession();
			menusVO = (MenusVO) session.get(MenusVO.class, foodID);
		return menusVO;
	}

}
