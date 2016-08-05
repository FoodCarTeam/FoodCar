package response.model;

import java.util.List;

import model.ResponseVO;

public class ResponseService {

	ResponseDao dao;
	
	public ResponseService(ResponseDao dao){
		this.dao=dao;
	}
	
	
	
	public ResponseVO select(int cID){
		ResponseVO result=dao.select(cID);
		return result;
	}
	
	public List<ResponseVO> select_ALL(int cID){
		List<ResponseVO> list=dao.select_ALL(cID);
		return list;
	}
	
	public ResponseVO insert(ResponseVO vo){
		ResponseVO result=null;
		if(vo!=null){
		result=dao.insert(vo);
		}
		return result;		
	}
	
	public ResponseVO update(ResponseVO vo){
		ResponseVO result=null;
		if(vo!=null){
			result=dao.update(vo);
		}
		return result;
	}
	public boolean delete(int rID){
		Boolean result =false;
		result=dao.delete(rID);
		return result;
	}
	
	
}
