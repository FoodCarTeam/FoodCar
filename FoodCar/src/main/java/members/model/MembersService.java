package members.model;

import java.security.Provider.Service;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import members.model.MembersDAO;
import model.MembersVO;


public class MembersService {
	private   MembersDAOHibernate membersDao;
	
	public MembersService(MembersDAOHibernate dao){
		this.membersDao=dao;
	}
	
	
	public static void main(String[]args){
////		測試showFoodCarsMap
//		MembersService membersService = new MembersService(membersDao);
//		MembersVO bean = membersService.select(2);
//		System.out.println("bean="+bean);
//			
//	}
	
//	public MembersVO select(Integer mID){
//		MembersVO result = null;
//		if(mID!=null){
//			result = membersDao.select(mID);
////			int statusID=result.getStatusID();
//		}
//		return result;
//		System.out.println("123");
//		
//		
//		MembersService service=new MembersService();
//		List<String> list=service.select_TaiwanRoad("臺北市","士林區","芝玉");
//		for(String a:list){
//			System.out.println(a);
//		}
		
	}
	public List<String> select_TaiwanRoad(String County,String Area,String roadName){
		List<String>list=null;
		list=membersDao.select_TaiwanRoad(County,Area,roadName);
		
		return list;
	}
	
	
	public MembersVO select_mPhone(String mPhone){
		MembersVO vo=null;
		vo=membersDao.select_mPhone(mPhone);
		
		
		return vo;
	}
	
	
	public MembersVO select(Integer mID){
		MembersVO result = null;
		if(mID!=null){
			result = membersDao.select_mID(mID);
		}
		return result;
	}
	public MembersVO select1(String mUsername){
		MembersVO result = null;
		if(mUsername!=null){
			result = membersDao.select_mUsername(mUsername);
//			int statusID=result.getStatusID();
		}
		return result;
	}
	public MembersVO insert(MembersVO vo) {
		MembersVO result = null;
		if(vo!=null) {
			result = membersDao.insert(vo);
		}
		return result;
	}
	public MembersVO update(MembersVO vo) { 
		MembersVO result = null;
		if(vo!=null) {
			result = membersDao.update(vo);
		}
		return result;
	}
	public boolean delete(MembersVO vo) {
		boolean result = false;
		if(vo!=null) {
			result = membersDao.delete(vo.getmID());
		}
		return result;
	}



	public MembersVO login(String mUsername, String mPassword) {
		MembersVO bean = membersDao.select_mUsername(mUsername);
		if(bean!=null) {
			if(mPassword!=null && mPassword.length()!=0) {
				String pass = bean.getmPassword();	
				String temp = mPassword;	
				if(temp.equals(pass)) {
					return bean;
				}
			}
		}
		return null;
	}
	public MembersVO changePass(String mUser, String mPass, String newPass) {
		MembersVO mvo = this.login(mUser, mPass);
		if (mvo != null) {
			mvo.setmPassword(newPass);
			return membersDao.update(mvo);
		}
		return null;
	}
}
