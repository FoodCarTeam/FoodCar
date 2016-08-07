package response.model;

import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import hibernate.util.HibernateUtil;
import model.MembersVO;
import model.ResponseVO;

public class ResponseDao implements ResponseDaoInterface{
	final static String SELECT_mName="from MembersVO where mName=:mName";
	final static String SELECT="from ResponseVO where cID=:cID";
	final static String Sselect_ALL="from ResponseVO where cID=:cID  order by cDate";
	final static String DELETE="delete ResponseVO where rID=:rID";
	
	SessionFactory sa;
	
	public ResponseDao(SessionFactory sa){
		this.sa=sa;
	}
	public Session getSession(){
		return sa.getCurrentSession();
	}
	
	
	
	
	public static void main(String[] args) {
//	ResponseDao dao=new ResponseDao();
//		ResponseVO vo=new ResponseVO();
//		測試新增
		
//		vo.setcID(1);
//		Date date=new Date();
//		vo.setcDate(new java.sql.Date(date.getTime()));
//		vo.setcContent("tdast測試日期");
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

	public MembersVO select_mName(String mName) {
			Query query=this.getSession().createQuery(SELECT_mName);
			query.setParameter("mName",mName);
			MembersVO vo=(MembersVO)query.uniqueResult();
			
		return vo;
	}
	
	
	@Override
	public ResponseVO select(int cID) {
			Query query=this.getSession().createQuery(SELECT);
			query.setParameter("cID",cID);
			ResponseVO vo=(ResponseVO)query.uniqueResult();
			
		return vo;
	}

	@Override
	public List<ResponseVO> select_ALL(int cID) {
		
	
			Query query=this.getSession().createQuery(Sselect_ALL);
			query.setParameter("cID", cID);
			List<ResponseVO> list=query.list();
			
		return list;
		
	}

	@Override
	public ResponseVO insert(ResponseVO vo) {
			this.getSession().save(vo);
		
		return vo;
	}

	@Override
	public ResponseVO update(ResponseVO vo) {
			ResponseVO a=new ResponseVO();
			a.setcID(vo.getcID());
			a.setmName(vo.getmName());
			a.setsName(vo.getsName());
			a.setcContent(vo.getcContent());
			a.setcDate(vo.getcDate());
			a.setcIP(vo.getcIP());
			a.setrID(vo.getrID());
			this.getSession().update(a);
			
		return vo;
	}

	@Override
	public boolean delete(int rID) {
		boolean result=false;
	
			Query query=this.getSession().createQuery(DELETE);
			query.setParameter("rID", rID);
			query.executeUpdate();
		
			result=true;
		
		return result;
	}
	
	
	
	

}
