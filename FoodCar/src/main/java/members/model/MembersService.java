package members.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import members.model.MembersDAO;
import model.MembersVO;


public class MembersService {
	private static  MembersDAO membersDao = new MembersDAOHibernate();

	
	
//	public static void main(String[]args){
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
//	}
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
}
