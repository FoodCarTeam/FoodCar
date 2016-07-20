package response.model;

import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;
import model.ResponseVO;

public class ResponseDao implements ResponseDaoInterface{
	final static String SELECT="from ResponseVO where cID=:cID";
	final static String Sselect_ALL="from ResponseVO where cID=:cID  order by cDate";
	final static String DELETE="delete ResponseVO where rID=:rID";
	public static void main(String[] args) {
//	ResponseDao dao=new ResponseDao();
//		ResponseVO vo=new ResponseVO();
//		測試新增
//		vo.setcContent("回覆test");
//		vo.setcID(1);
//		Date date=new Date();
//		vo.setcDate(new java.sql.Date(date.getTime()));
//		vo.setcContent("tdast測試das22das");
//		String a="123";
//		byte ab[]=a.getBytes();
//		Byte ba[]=new Byte[ab.length];
//		 for (int i = 0; i < ab.length; i++)
//		    {
//		        ba[i] = Byte.valueOf(ab[i]);
//		    }
//		 vo.setcIP(ba);
//		 vo.setmName("會員名2");
//		 vo.setsName("餐車名2");
//		 ResponseVO result=dao.insert(vo);
//		System.out.println(result.getrID());
//		測試單查
//		vo=dao.select(1);
//		System.out.println(vo.getmName());
//		測試全查
//		List<ResponseVO> list=dao.select_ALL(1);
//		for(ResponseVO a:list){
//			System.out.println(a.getmName());
//		}
//		測試更新
//		vo.setcContent("更新完～～～～～");
//		vo.setrID(2);
//		ResponseVO result=dao.update(vo);
//		System.out.println(result.getcContent());
//		測試刪除
//		Boolean result=dao.delete(3);
//		System.out.println(result);
	}

	@Override
	public ResponseVO select(int cID) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		ResponseVO vo=null;
		try {
			session.beginTransaction();
			Query query=session.createQuery(SELECT);
			query.setParameter("cID",cID);
			vo=(ResponseVO)query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public List<ResponseVO> select_ALL(int cID) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		List<ResponseVO> list=null;
		try {
			session.beginTransaction();
			Query query=session.createQuery(Sselect_ALL);
			query.setParameter("cID", cID);
			list=query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return list;
		
	}

	@Override
	public ResponseVO insert(ResponseVO vo) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
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

	@Override
	public ResponseVO update(ResponseVO vo) {
		Session session =HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			ResponseVO a=new ResponseVO();
			a.setcID(vo.getcID());
			a.setmName(vo.getmName());
			a.setsName(vo.getsName());
			a.setcContent(vo.getcContent());
			a.setcDate(vo.getcDate());
			a.setcIP(vo.getcIP());
			a.setrID(vo.getrID());
			session.update(a);
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public boolean delete(int rID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		boolean result=false;
		try {
			session.beginTransaction();
			Query query=session.createQuery(DELETE);
			query.setParameter("rID", rID);
			query.executeUpdate();
			session.getTransaction().commit();
			result=true;
		} catch (HibernateException e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	

}
