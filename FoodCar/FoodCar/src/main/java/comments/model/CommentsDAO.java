package comments.model;


import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.jdbc.Work;

import hibernate.util.HibernateUtil;
import model.CommentsVO;
import model.MembersVO;

public class CommentsDAO implements commentsDaoInterface{
	final static String SELECT_mID="from CommentsVO where mID=:mID";
	final static String SELECT_sID="from CommentsVO where sID=:sID";
	final static String Sselect_ALL_mID="from CommentsVO  where mID=:mID order by cDate";
	final static String Sselect_ALL_sID="from CommentsVO  where sID=:sID order by cDate desc";
//	final static String INSERT="insert into CommentsVO(mID,sID,cDate,cContent,cPoint,cIP)";
//	final static String UPDATE="update CommentsVO set mID=:mID,sID=:sID,cDate=:cDate,cContent=:cContent,cPoint=:cPoint,cIP=:cIP"
//										+"where cID=:cID";
	final static String DELETE="delete CommentsVO where cID=:cID";
	
	public SessionFactory sf;
	public CommentsDAO(SessionFactory sf){
		this.sf=sf;
	}
	
	public Session getSession(){
		return sf.getCurrentSession();
	}
	
	
	public static void main(String[] args) {
//		CommentsDAO dao=new CommentsDAO();
//		CommentsVO vo=new CommentsVO();
//////		測試新增
//		vo.setmID(1);
//		vo.setsID(3);
//		Date date=new Date();
//		vo.setcDate(new java.sql.Date(date.getTime()));
//		vo.setcContent("tdast測試dasdas");
//		vo.setcPoint("123");
//		String a="123";
//		byte ab[]=a.getBytes();
//		Byte ba[]=new Byte[ab.length];
//		 for (int i = 0; i < ab.length; i++)
//		    {
//		        ba[i] = Byte.valueOf(ab[i]);
//		    }
//		vo.setcIP(ba);
//		CommentsVO result=dao.insert(vo);
//		System.out.println(result.getcContent());
		
//		測試修改
//		vo.setcID(1);
//		vo.setmID(1);
//		vo.setsID(1);
//		Date date=new Date();
//		vo.setcDate(new java.sql.Date(date.getTime()));
//		vo.setcContent("testeqwqeqeqweqweqweqweqwtst測試");
//		vo.setcPoint("123");
//		String a="123";
//		byte ab[]=a.getBytes();
//		Byte ba[]=new Byte[ab.length];
//		 for (int i = 0; i < ab.length; i++)
//		    {
//		        ba[i] = Byte.valueOf(ab[i]);
//		    }
//		vo.setcIP(ba);
//		dao.update(vo);
		
//		測試單查sID
//		CommentsVO a=dao.select_sID(1);
//		System.out.println(a.getcContent());
//		測試單查mID
//		CommentsVO b=dao.select_mID(1);
//		System.out.println(b.getcContent());
//		測試多查mID
//		List<CommentsVO> list=dao.select_ALL_mID(1);
//		for(CommentsVO a:list){
//			System.out.println(a.getcContent());
//		}
//		測試多查sID
//		List<CommentsVO> list;
//		 list=dao.select_ALL_sID(1);
//		for(CommentsVO a:list){
//			System.out.println(a.getcDate());
//			System.out.println(a.getsID());
//		}
//		測試刪除
//		Boolean result=dao.delete(6);
//		System.out.print(result);

	}

	@Override
	public CommentsVO select_sID(int sID) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		CommentsVO vo=null;
			Query query=session.createQuery(SELECT_sID);
			query.setParameter("sID",sID);
			vo=(CommentsVO)query.uniqueResult();
		return vo;
	}


	@Override
	public CommentsVO select_mID(int mID) {
//		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
		CommentsVO vo=null;
			Query query=session.createQuery(SELECT_mID);
			query.setParameter("mID",mID);
			vo=(CommentsVO)query.uniqueResult();
		return vo;
	}
	
	public CommentsVO select_cID(int cID) {
//		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
		CommentsVO vo=null;
			vo=(CommentsVO)session.get(CommentsVO.class, cID);
		return vo;
	}
	

	@Override
	public List<CommentsVO> select_ALL_sID(int sID) {
//		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
		List<CommentsVO> list=null;
			Query query=session.createQuery(Sselect_ALL_sID);
			query.setParameter("sID", sID);
			list=query.list();
		return list;
	}

	@Override
	public List<CommentsVO> select_ALL_mID(int mID) {
//		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
		List<CommentsVO> list=null;
			Query query=session.createQuery(Sselect_ALL_mID);
			query.setParameter("mID", mID);
			list=query.list();
		return list;
	}

	

	
	@Override
	public CommentsVO insert(CommentsVO vo) {
//		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
			
			
			
			
			session.save(vo);
		return vo;
	}

	@Override
	public CommentsVO update(CommentsVO vo) {
		
//		Session session =HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
			
			CommentsVO a=new CommentsVO();
			a.setcID(vo.getcID());
			a.setmID(vo.getmID());
			a.setsID(vo.getsID());
			a.setcContent(vo.getcContent());
			Date b=new java.sql.Date (vo.getcDate().getTime());
			a.setcDate(b);
			a.setcPoint(vo.getcPoint());
			a.setcIP(vo.getcIP());
			session.update(a);
		return vo;
	}

	@Override
	public boolean delete(int cID) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
		boolean result=false;
			Query query=session.createQuery(DELETE);
			query.setParameter("cID", cID);
			query.executeUpdate();
		return result;
	}

}
