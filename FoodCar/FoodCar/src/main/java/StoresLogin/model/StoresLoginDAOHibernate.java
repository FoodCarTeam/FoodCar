package StoresLogin.model;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import hibernate.util.HibernateUtil;
import model.StoresVO;

public class StoresLoginDAOHibernate implements StoresLoginDAO {

	private static final String SELECT = "from StoresVO where sUsername=?" ;
	private static final String GET_ALL_STMT = "from StoresVO";
	
	private SessionFactory sa;
	public StoresLoginDAOHibernate(SessionFactory sessionFactory) {
		this.sa = sessionFactory;
	}
	public Session getSession(){
		return sa.getCurrentSession();
	}
	
	

	public static void main(String[]args){
		 //		測試單獨查詢
		//StoresLoginDAOHibernate dao = new StoresLoginDAOHibernate(hibernate.util.HibernateUtil.getSessionFactory());
		 
		//		MembersVO vo=dao.select1("JJJJ@qq.com");
		 //		vo.setmUsername("JJJJ@qq.com");
		 //		dao.update(vo);
		 //		System.out.println("Username:"+vo.getmUsername());
		 
		 //		測試新增
//		StoresVO vo=new StoresVO();
//		vo.setsName("四神湯");
//   	vo.setsID(1);
//		vo.setsUsername("123");
//		vo.setsPassword("321");
//		StoresVO result=dao.insert(vo);
//	   System.out.println(result);

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
		 		}
	
	public StoresVO select(String sUsername){
		StoresVO storesvo = null ; 
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
			Query query = session.createQuery(SELECT);
			query.setString(0,sUsername);
			System.out.println(query);
			
			storesvo = (StoresVO) query.uniqueResult();
			session.getTransaction().commit();
		return storesvo;
	}

	@Override
	public StoresVO insert(StoresVO vo) {
	
		
	System.out.println(vo);
	
//	Session session = HibernateUtil.getSessionFactory().getCurrentSession();
	Session session=getSession();
			
//  << 如果sID 是讓使用者輸入,才可以這樣coding存資料到資料庫	>>
//			StoresVO result = (StoresVO)session.get(StoresVO.class ,vo.getsID());
//        System.out.println("here");
//        if(result==null) {
// 			this.getSession().save(vo);
//				return vo;
//		}
//  << 如果sID 是我們流水號自己生 , 這樣抓就會死在100行那 跑不到if(result==null)這樣使用者資料存不到資料庫內
        
        session.save(vo);
 	return null;
	}

	
	
}
