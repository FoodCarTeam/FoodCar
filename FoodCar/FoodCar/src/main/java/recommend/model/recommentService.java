package recommend.model;

import java.util.List;

import model.ResponseVO;
import model.recommendVO;

public class recommentService {

	 recommendDao dao;
	 
	 public recommentService(recommendDao dao){
		 this.dao=dao;
	 }
	
	 public recommendVO select_mID_cID(int sID,int mID){
		 recommendVO result=null;
		result=dao.select_mID_cID(mID, sID);
		 
		 return result;
	 }
	
	
	public List<recommendVO> select_mID(int mID) {
		List<recommendVO> list=null;
		list=dao.select_mID(mID);
		return list;
	}
	
	public List<recommendVO> select_sID(int sID) {
		List<recommendVO> list=null;
		list=dao.select_sID(sID);
		return list;
	}
	
	public recommendVO insert(recommendVO vo) {
		recommendVO result=null;
		result=dao.insert(vo);
		return result;
	}
	
	public boolean delete(int rID) {
		
		Boolean result=false;
		result=dao.delete(rID);
		return result;
	}
	
	public int recommendCount(int sID) {
		int result=0;
		result=dao.recommendCount(sID);
		return result;
	}
	
	
}
