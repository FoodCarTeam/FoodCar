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

			Query query=this.getSession().createQuery(SELECT);
			query.setParameter("sID", sID);
			HoursVO vo=(HoursVO)query.uniqueResult();
			
		return vo;
	}

	
	@Override
	public List<HoursVO> select() {
		
			Query query=this.getSession().createQuery(SELECT_ALL);
			
		return (List<HoursVO>)query.list();
	}

	@Override
	public HoursVO insert(HoursVO vo) {
			this.getSession().save(vo);
		return vo;
	}

//	 sun=:sun,mon=:mon,tue=:tue,wed=:wed,thu=:thu,fri=:fri,sat=:sat
	@Override
	public HoursVO update(HoursVO vo) {
			Query query=this.getSession().createQuery(UPDATE);
			query.setParameter("sun",vo.getSun());
			query.setParameter("mon",vo.getMon());
			query.setParameter("tue",vo.getTue());
			query.setParameter("wed",vo.getWed());
			query.setParameter("thu",vo.getThu());
			query.setParameter("fri",vo.getFri());
			query.setParameter("sat",vo.getSat());
			query.setParameter("sID",vo.getsID());
			query.executeUpdate();
		return vo;
		
	}

	@Override
	public boolean delete(int sID) {
		
		Boolean result=false;
        HoursVO bean = (HoursVO)this.getSession().get(HoursVO.class, sID);
        if(bean!=null){
			Query query=this.getSession().createQuery(DELETE);
			query.setInteger("sID", sID);
			query.executeUpdate();
			result=true;
        }
		return result;
		
	}

}
