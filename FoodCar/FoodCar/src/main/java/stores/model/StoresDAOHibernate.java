package stores.model;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

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
	public  StoresDAOHibernate(SessionFactory sa){
		this.sa=sa;
	}
	
	SessionFactory sa;
	
	private Session getSession(){
		
		return this.sa.openSession();
		
	}

	public StoresVO select_mName(String sName) {
//		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
		StoresVO vo=null;
			Query query=session.createQuery("from StoresVO where sName=:sName");
			query.setParameter("sName",sName);
			vo=(StoresVO)query.uniqueResult();
		return vo;
	}
	
	
	@Override
	public StoresVO select(Integer sID) {

		StoresVO storesVO = null;
		
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		Transaction ta=null;
		try {
			 ta=session.beginTransaction();
			storesVO = (StoresVO) session.get(StoresVO.class, sID);
			ta.commit();
		} catch (Exception e) {
			ta.rollback();
			e.printStackTrace();
		}	
			
			
		return storesVO;

	}

	@Override
	public List<StoresVO> select() {
		List<StoresVO> list = null;
		
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
//		Transaction ta=session.beginTransaction();
			Query query = session.createQuery("from StoresVO");
			list = query.list();
//			ta.commit();
//			
//			session.close();
			
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
