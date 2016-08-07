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

		StoresVO storesVO = null;
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
			storesVO = (StoresVO) session.get(StoresVO.class, sID);
		return storesVO;
	}

	@Override
	public StoresVO select_sUser(String sUsername) {
		StoresVO svo = null;
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
			Query query = session.createQuery(SELECT);
			query.setString(0, sUsername);
			svo = (StoresVO) query.uniqueResult();
		return svo;
	}

	@Override
	public List<StoresVO> select() {
		List<StoresVO> list = null;
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
			Query query = session.createQuery("from StoresVO");
			list = query.list();
		return list;
	}

	@Override
	public StoresVO insert(StoresVO bean) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
			session.saveOrUpdate(bean);
		return null;
	}

	@Override
	public StoresVO update(StoresVO bean) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
			session.update(bean);
		return bean;
	}

	@Override
	public boolean delete(Integer sID) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
			StoresVO svo = new StoresVO();
			svo.setsID(sID);
			session.delete(svo);

		return false;
	}

}
