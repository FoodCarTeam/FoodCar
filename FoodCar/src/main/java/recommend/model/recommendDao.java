package recommend.model;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import hibernate.util.HibernateUtil;
import members.model.MembersService;
import model.recommendVO;

public class recommendDao implements recommendDaoInterface {
	final static String SELECT_sID="from recommendVO where sID=:sID";
	final static String SELECT_mID="from recommendVO where mID=:mID";
	final static String SELECT_mID_sID="from recommendVO where mID=:mID and sID=:sID";
	final static String SELECT_ALL="from recommendVO order by sID";
	final static String DELETE="delete recommendVO where rID=:rID";
	
	SessionFactory sa;
	public recommendDao(SessionFactory sa){
		this.sa=sa;
	}
	
	public Session getSession(){
		return sa.getCurrentSession();
	}
	
	
	public static void main(String[] args) {
//		recommendDao dao=new recommendDao();
//		recommendVO vo=new recommendVO();
//		MembersService ms=new MembersService();
		
//		List<recommendVO> list=dao.select_sID(1);
//		for(recommendVO a:list){
//			System.out.println(a.getmID());
//		}
//		int result=dao.recommendCount(1);
//		System.out.println(result);
		
//		dao.delete(4);
//		vo.setsID(2);
//		vo.setmID(1);
		
		
		
//		vo.setMemberVO(ms.select(1));
//		recommendVO result=dao.insert(vo);
//		System.out.println(result);
		
//		vo=dao.select_mID_cID(1, 4);
//		System.out.println(vo);
	}

	
	
	
	@Override
	public recommendVO select_mID_cID(int mID, int sID) {
			Query query=this.getSession().createQuery(SELECT_mID_sID);
			query.setParameter("mID", mID);
			query.setParameter("sID", sID);
			
			recommendVO vo=(recommendVO)query.uniqueResult();
			
			
			
		return vo;
		
	}




	@Override
	public List<recommendVO> select_sID(int sID) {
			Query query=this.getSession().createQuery(SELECT_sID);
			query.setParameter("sID", sID);
			List<recommendVO> list=query.list();
			
		
		return list;
	}

	@Override
	public List<recommendVO> select_mID(int mID) {
			Query query=this.getSession().createQuery(SELECT_sID);
			query.setParameter("mID", mID);
			List<recommendVO> list=query.list();
			
		return list;
	}

	@Override
	public List<recommendVO> select() {
			Query query=this.getSession().createQuery(SELECT_ALL);
			
		return (List<recommendVO>) query.list();
	}

	@Override
	public recommendVO insert(recommendVO vo) {
			this.getSession().save(vo);
			
		return vo;
	}

	@Override
	public recommendVO update(recommendVO vo) {
		
		return null;
	}

	@Override
	public boolean delete(int rID) {
		Boolean result=false;
			Query query=this.getSession().createQuery(DELETE);
			query.setInteger("rID", rID);
			query.executeUpdate();
			
			result=true;
	
		return result;
	}

	@Override
	public int recommendCount(int sID) {
		int result=0;
			Query query=this.getSession().createSQLQuery("SELECT COUNT(sID) FROM recommend where sID=:sID");
			query.setInteger("sID", sID);
			 result=((Number)query.uniqueResult()).intValue();
		return result;
	}

}
