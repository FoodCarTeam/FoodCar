package StoresLogin.model;

import model.StoresVO;


public class StoresLoginService {
	private static  StoresLoginDAO storesLoginDao = new StoresLoginDAOHibernate(null);
// 為甚麼裡面要塞null ?？　　下面是甚麼寫法　？？
	
	
//	private  StoresLoginDAO storesLoginDao;
//	public StoresLoginService(StoresLoginDAO dao) {
//		this.storesLoginDao = dao;
//	}
	
	
	public StoresVO login(String sUsername, String sPassword) {
		StoresVO vo = storesLoginDao.select(sUsername);
		if(vo!=null) {
			if(sPassword!=null && sPassword.length()!=0) {
				String password = vo.getsPassword(); //資料庫抓出
				String userpassword = sPassword;  //使用者輸入
				if(password.equals(userpassword)){
					return vo;
				}
			}
		}
		return null;
	}
	
	public StoresVO insert(StoresVO vo) {
		StoresVO result = null;
		if(vo!=null) {
			result = storesLoginDao.insert(vo);
		}
		return result;
	}
}
