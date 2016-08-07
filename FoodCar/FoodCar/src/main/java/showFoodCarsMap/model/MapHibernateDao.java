package showFoodCarsMap.model;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import hibernate.util.HibernateUtil;
import model.MapsVO;


public class MapHibernateDao implements MapDaoInterface {
	final static String SELECT="from MapsVO where sID=:sID";
	final static String SELECT_ALL="from MapsVO order by sID";
	final static String DELETE="delete MapsVO where sID=:sID";
	final static String UPDATE="update MapsVO set location=:location"+" where sID=:sID";
	
	public SessionFactory sa;
	
	public MapHibernateDao(SessionFactory sa){
		this.sa=sa;
	}
	private Session getSession(){
		
		return sa.getCurrentSession() ;
	}
	
	
	
	
	
	public static void main(String[]args){
		try {
//			System.out.println("sessionFactory:"+HibernateUtil.getSessionFactory());
//			
//			
//			
////			測試單獨查詢
//			MapHibernateDao dao=new MapHibernateDao(HibernateUtil.getSessionFactory());
//			MapsVO vo=dao.select(1);
//			System.out.println("location:"+vo.getLocation());
//			System.out.println("location:"+vo);
//			
//			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
		} finally {
//			HibernateUtil.closeSessionFactory();
		}

//		測試全體查詢
//		List<MapsVO> list=dao.select();
//		for(MapsVO a:list){
//			System.out.println("sID:"+a.getsID());
//		}
//		測試新增
//		MapsVO vo=new MapsVO();
//		vo.setsID(3);
//		vo.setLocation("121.527961,25.052432");
//		MapsVO vo2=dao.insert(vo);
//		if(vo2!=null){
//			System.out.println("不是空的");
//		}else{
//			System.out.println("是空的");
//		}
//		測試更新
//		vo.setMapID(3);
//		vo.setsID(3);
//		vo.setLocation("123");
//		MapsVO vo2=dao.update(vo);
//		if(vo2!=null){
//			System.out.println("不是空的");
//		}
//		測試刪除
//		Boolean result=dao.delete(3);
//		System.out.println(result);
		}

	@Override
	public MapsVO select(int sID) {
//		Session session=hibernate.util.HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
		MapsVO vo=null;
			Query query=session.createQuery(SELECT);
			query.setParameter("sID", sID);
			vo=(MapsVO)query.uniqueResult();
		return vo;
	}

	@Override
	public List<MapsVO> select() {
//		Session session=hibernate.util.HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
		List<MapsVO> list=null;
			Query query=session.createQuery(SELECT_ALL);
			list=query.list();
		return list;
	}

	@Override
	public MapsVO insert(MapsVO map) {
//		Session session=hibernate.util.HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
			session.save(map);
		return map;
	}

	@Override
	public MapsVO update(MapsVO map) {
//		Session session=hibernate.util.HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
			Query query=session.createQuery(UPDATE);
			query.setParameter("location",map.getLocation());
			query.setParameter("sID",map.getsID());
			query.executeUpdate();
		return map;
	}

	@Override
	public boolean delete(int sID) {
//		Session session=hibernate.util.HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
		Boolean result=false;
			Query query=session.createQuery(DELETE);
			query.setInteger("sID", sID);
			query.executeUpdate();
		return result;
	}

}
