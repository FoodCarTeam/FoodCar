package members.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;

import hibernate.util.HibernateUtil;

import model.MembersVO;


public class MembersDAOHibernate implements MembersDAO {

	private static final String SELECT = "from MembersVO  where mID=:mID";
	private static final String SELECT1 = "from MembersVO  where mUsername=?";

	private static final String GET_ALL_STMT = "from MembersVO";
	private static final String insert = "from MembersVO";
	final static String DELETE="delete MembersVO where mID=:mID";
//	final static String UPDATE="update MembersVO set mUsername=:mUsername,mPassword=:mPassword,mIMG=:mIMG"+"where mID=:mID";
	
	
	public static void main(String[]args){
//		測試單獨查詢
		MembersDAOHibernate dao=new MembersDAOHibernate();
//		MembersVO vo=dao.select_mUsername("JJJJ@qq.com");
//		vo.setmUsername("JJJJ@qq.com");
//		dao.update(vo);
//		System.out.println("Username:"+vo.getmUsername());

//		測試新增
//		MembersVO vo = new MembersVO();
//		
//		Date date = new Date();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
//		String temp = sdf.format(date);
//		Date tempDate = null;
//		try {
//			tempDate = sdf.parse(temp);
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		System.out.println(new java.sql.Date(tempDate.getTime()));
//		vo.setmName("鵬開心");
//		vo.setmAddress("台北市信義區信義路信義巷");
//		vo.setmBirthday(new java.sql.Date(tempDate.getTime()));
//		vo.setmIMG("123");
//		vo.setmPhone("091032131");
//		vo.setmUsername("Jeep123@qq.com");
//		vo.setmPassword("123456");
//		dao.insert(vo);
//		
//		測試更新
//		MembersVO vo = new MembersVO();
//		vo.setmID(2);
//		vo.setmUsername("Keep@.qq.com");
//		vo.setmPassword("123abc");
//		vo.setmIMG("");
//		
//		MembersVO vo2 =dao.update(vo);
//		if(vo2!=null){
//			System.out.println("不是空的");			
//		}
//		測試刪除
//		Boolean result = dao.delete(10);
//		System.out.println(result);
		
//		MembersVO vo=dao.select_mPhone("091927139");
//		System.out.println(vo);
		List<String>list=new LinkedList<String>();
		list=dao.select_TaiwanRoad("臺北市","士林區","芝");
		System.out.println(list.size());
		for(String a:list){
			System.out.println(a);
		}
		
		
}
	
	@Override
	public MembersVO select_mPhone(String mPhone ) {
		MembersVO membersVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query=session.createQuery("from MembersVO where mPhone=?");
			query.setString(0,mPhone);
			membersVO=(MembersVO)query.uniqueResult();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return membersVO;
	
	}
	

	@Override
	public List<String> select_TaiwanRoad(String County,String Area,String roadName) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		List<String> list=null;
		try {
			session.beginTransaction();
			Query query=session.createSQLQuery("select distinct Road from TaiwanRoad where County=:County and Area =:Area and  Road like :roadNmae").addScalar("Road");
//			query.setParameter(0,roadName+"%");
			query.setString("County", County);
			query.setString("Area", Area);
			query.setString("roadNmae", roadName+"%");
			list=query.list();
			session.getTransaction().commit();
		} catch (Exception e) {
			session.getTransaction().rollback();
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public MembersVO select_mID(Integer mID ) {
		MembersVO membersVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			membersVO = (MembersVO) session.get(MembersVO.class, mID);
			
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return membersVO;
	
	}
	@Override
	public MembersVO select_mUsername(String mUsername) {
		MembersVO membersVO = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(SELECT1);
			query.setString(0, mUsername);
			membersVO = (MembersVO) query.uniqueResult();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return membersVO;
		
	}

	@Override
	public MembersVO insert(MembersVO vo) {
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

	@Override
	public MembersVO update(MembersVO vo) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
//			Query query=session.createQuery(UPDATE);			
//			query.setParameter("mUsername", vo.getmUsername());
//			query.setParameter("mPassword", vo.getmPassword());
//			query.setParameter("mIMG",vo.getmIMG());
//			query.setParameter("mID",vo.getmID());
//			int Result=query.executeUpdate();
			session.update(vo);
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return vo;		
	}

	@Override
	public boolean delete(Integer mID) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();

			MembersVO vo = new MembersVO();
			vo.setmID(mID);
			session.delete(vo);
			session.getTransaction().commit();

		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return false;
	}


	@Override
	public List<MembersVO> getAll() {
		List<MembersVO> list = null;
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		try {
			session.beginTransaction();
			Query query = session.createQuery(GET_ALL_STMT);
			list = query.list();
			session.getTransaction().commit();
		} catch (RuntimeException ex) {
			session.getTransaction().rollback();
			throw ex;
		}
		return null;
	}






}
