package stores.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import hibernate.util.HibernateUtil;
import model.MembersVO;
import model.StoresVO;

public class StoresDAOHibernate implements StoresDAO{

	public static void main(String[]args){
//		測試單查
//		StoresDAOHibernate dao=new StoresDAOHibernate();
//		StoresVO vo=new StoresVO();
//		 vo=dao.select(1);
//		 System.out.println(vo.getsName());
	}

	
	public StoresVO select_mName(String sName) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		StoresVO vo=null;
		try {
			session.beginTransaction();
			Query query=session.createQuery("from StoresVO where sName=:sName");
			query.setParameter("sName",sName);
			vo=(StoresVO)query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return vo;
	}
	
	
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
	public List<StoresVO> select() {
		List<StoresVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery("from StoresVO");
			list = query.list();
			session.getTransaction().commit();
		} catch (Exception ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return list;
	}

	@Override
	public StoresVO insert(StoresVO bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public StoresVO update(String sUsername, String sPassword, String sName, String sBossName, 
			String sLogo, Integer sID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(Integer id) {
		// TODO Auto-generated method stub
		return false;
	}
   
}
