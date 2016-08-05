package openTime.model;


import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import model.HoursVO;


public class HoursHibernateDao implements HoursDaoInterface {
	final static String SELECT="from HoursVO where sID=:sID";
	final static String SELECT_ALL="from HoursVO order by sID";
	final static String DELETE="delete HoursVO where sID=:sID";
	final static String UPDATE="update HoursVO set sun=:sun,mon=:mon,tue=:tue,wed=:wed,thu=:thu,fri=:fri,sat=:sat"+" where sID=:sID";
	SessionFactory sa;
	
	public HoursHibernateDao(SessionFactory sa){
		this.sa=sa;
	}
	public Session getSession(){
		return sa.getCurrentSession();
	}
	
	
	
	
	public static void main(String[]args){
//		測試單獨查詢
//		HoursHibernateDao dao=new HoursHibernateDao();
//		HoursVO vo=dao.select(1);
//		System.out.println("Sat:"+vo.getSat());
//		測試全體查詢
//		List<HoursVO> list=dao.select();
//		for(HoursVO a:list){
//			System.out.println("sID:"+a.getsID());
//		}
//		測試新增
//		HoursVO vo=new HoursVO();
//		vo.setsID(4);
//		
//		vo.setMon("0911~2200");
//		HoursVO vo2=dao.insert(vo);
//		if(vo2!=null){
//			System.out.println("不是空的");
//		}else{
//			System.out.println("是空的");
//		}
//		測試更新
//		vo.setsID(2);
//		vo.setMon("2200~2300");
//		
//		HoursVO vo2=dao.update(vo);
//		if(vo2!=null){
//			System.out.println("不是空的");
//			System.out.println(vo.getMon());
//		}
//		測試刪除
//		Boolean result=dao.delete(2);
//		System.out.println(result);
		}

	@Override
	public HoursVO select(int sID) {
		Session session=hibernate.util.HibernateUtil.getSessionFactory().getCurrentSession();
		HoursVO vo=new HoursVO();
		try {
			session.beginTransaction();
			Query query=session.createQuery(SELECT);
			query.setParameter("sID", sID);
			vo=(HoursVO)query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return vo;
	}

	
	@Override
	public List<HoursVO> select() {
		Session session=hibernate.util.HibernateUtil.getSessionFactory().getCurrentSession();
		List<HoursVO> list=null;
		try {
			session.beginTransaction();
			Query query=session.createQuery(SELECT_ALL);
			list=query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public HoursVO insert(HoursVO vo) {
		Session session=hibernate.util.HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			session.save(vo);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return vo;
	}

//	 sun=:sun,mon=:mon,tue=:tue,wed=:wed,thu=:thu,fri=:fri,sat=:sat
	@Override
	public HoursVO update(HoursVO vo) {
		Session session=hibernate.util.HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query=session.createQuery(UPDATE);
			query.setParameter("sun",vo.getSun());
			query.setParameter("mon",vo.getMon());
			query.setParameter("tue",vo.getTue());
			query.setParameter("wed",vo.getWed());
			query.setParameter("thu",vo.getThu());
			query.setParameter("fri",vo.getFri());
			query.setParameter("sat",vo.getSat());
			query.setParameter("sID",vo.getsID());
			query.executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return vo;
		
	}

	@Override
	public boolean delete(int sID) {
		Session session=hibernate.util.HibernateUtil.getSessionFactory().getCurrentSession();
		Boolean result=false;
		try {
			session.beginTransaction();
			Query query=session.createQuery(DELETE);
			query.setInteger("sID", sID);
			query.executeUpdate();
			session.getTransaction().commit();
			result=true;
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return result;
		
	}

}
