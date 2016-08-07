package StoresLogin.model;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import hibernate.util.HibernateUtil;
import model.StoresVO;

public class StoresDAOHibernate implements StoresDAO {

	private static final String SELECT = "from StoresVO where sUsername=?";
	SessionFactory sa;
	public StoresDAOHibernate(SessionFactory sa){
		this.sa=sa;
	}
	public Session getSession(){
		return sa.getCurrentSession();
	}
	
	
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
	public StoresVO select_sID(Integer sID) {
		return (StoresVO) this.getSession().get(StoresVO.class, sID);
	}

	@Override
	public StoresVO select_sUser(String sUsername) {
		
			Query query = this.getSession().createQuery(SELECT);
			query.setString(0, sUsername);
			StoresVO svo = (StoresVO) query.uniqueResult();
			
		return svo;
	}

	@Override
	public List<StoresVO> select() {
		
			Query query = this.getSession().createQuery("from StoresVO");
			
			
		return (List<StoresVO>)query.list();
	}

	@Override
	public StoresVO insert(StoresVO bean) {
			this.getSession().saveOrUpdate(bean);
		
		return null;
	}

	@Override
	public StoresVO update(StoresVO bean) {
			this.getSession().update(bean);
			
		return bean;
	}

	@Override
	public boolean delete(Integer sID) {
			StoresVO svo = new StoresVO();
			svo.setsID(sID);
			this.getSession().delete(svo);

			
		return false;
	}

}
