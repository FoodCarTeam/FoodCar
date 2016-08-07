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
	public  StoresDAOHibernate(SessionFactory sa){
		this.sa=sa;
	}
	
	SessionFactory sa;
	
	private Session getSession(){
		
		return this.sa.getCurrentSession();
		
	}

	public StoresVO select_mName(String sName) {
			Query query=this.getSession().createQuery("from StoresVO where sName=:sName");
			query.setParameter("sName",sName);
			StoresVO vo=(StoresVO)query.uniqueResult();
			
		return vo;
	}
	
	
	@Override
	public StoresVO select(Integer sID) {
		return (StoresVO) this.getSession().get(StoresVO.class, sID);

	}

	@Override
	public List<StoresVO> select() {
	
			Query query = this.getSession().createQuery("from StoresVO");
	
		return (List<StoresVO>)query.list();
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
