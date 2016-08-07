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
	public  MenusDAOHibernate(SessionFactory sa){
		this.sa=sa;
	}
	
	SessionFactory sa;
	
	private Session getSession(){
		
		return this.sa.getCurrentSession();
		
	}
	@Override
	public MenusVO select(Integer sID) {
		return (MenusVO) this.getSession().get(MenusVO.class, sID);
	}

	@Override
	public MenusVO insert(MenusVO mnvo) {
			this.getSession().saveOrUpdate(mnvo);
	
		return null;
	}

	@Override
	public MenusVO update(MenusVO mnvo) {
			this.getSession().saveOrUpdate(mnvo);
		
		return null;
	}

	@Override
	public boolean delete(Integer foodID) {
			MenusVO mnvo = (MenusVO) this.getSession().get(MenusVO.class, foodID);
			mnvo.getStroeVO().getMenusVO().remove(mnvo);
			mnvo.setStroeVO(null);
			this.getSession().delete(mnvo);
		
		return false;
	}

	@Override
	public List<MenusVO> getAll() {
			Query query = this.getSession().createQuery(GET_ALL_STMT);
			
		return (List<MenusVO>) query.list();
	}

	@Override
	public List<MenusVO> findByKey(Integer sID) {
	
			Query query = this.getSession().createQuery(SELECT);
			query.setParameter("sID", sID);
			List<MenusVO> mnvo = query.list();
			
		return mnvo;
	}

	@Override
	public MenusVO selectfood(Integer foodID) {
		return (MenusVO) this.getSession().get(MenusVO.class, foodID);
	}

}
