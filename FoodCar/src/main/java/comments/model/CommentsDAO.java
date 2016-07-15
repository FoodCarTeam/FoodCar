package comments.model;


import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import hibernate.util.HibernateUtil;
import model.CommentsVO;

public class CommentsDAO implements commentsDaoInterface{
	final static String SELECT="from CommentsVO where mID=:mID";
	final static String SELECTALL="from CommentsVO order by cDate";
	final static String INSERT="insert into CommentsVO(mID,cDate,cContent,cRespone,point,cIP)";
	final static String UPDATE="update CommentsVO set cDate=:cDate,cContent=:cContent,cRespone=:cRespone,point=:point,cIP=:cIP"
										+"where cID=:cID";
	final static String DELETE="delete CommentsVO where cID=:cID";
	
	
	public static void main(String[] args) {
		CommentsDAO dao=new CommentsDAO();
		CommentsVO vo=new CommentsVO();
		vo.setmID(1);
		Date date=new Date();
		vo.setcDate(new java.sql.Date(date.getTime()));
		vo.setcContent("testeestsetst測試");
		vo.setcRespone("123");
		vo.setPoint("123");
		String a=1;
		vo.setcIP(a.getBytes());
		CommentsVO result=dao.insert(vo);
		System.out.println(result.getcContent());

	}

	@Override
	public CommentsVO select(int mID) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		CommentsVO vo=null;
		try {
			session.beginTransaction();
			Query query=session.createQuery(SELECT);
			query.setParameter("mID",mID);
			vo=(CommentsVO)query.uniqueResult();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public List<CommentsVO> select_ALL() {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		List<CommentsVO> list=null;
		try {
			session.beginTransaction();
			Query query=session.createQuery(SELECTALL);
			list=query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public CommentsVO insert(CommentsVO vo) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query=session.createQuery(INSERT);
			int Result=query.executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public CommentsVO update(CommentsVO vo) {
		
		Session session =HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query=session.createQuery(UPDATE);
			query.setParameter("cDate",vo.getcDate());
			query.setParameter("cContent", vo.getcContent());
			query.setParameter("cRespone", vo.getcRespone());
			query.setParameter("point",vo.getPoint());
			query.setParameter("cIP", vo.getcIP());
			int Result=query.executeUpdate();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public boolean delete(int cID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		boolean result=false;
		try {
			Query query=session.createQuery(DELETE);
			query.setParameter("cID", cID);
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
