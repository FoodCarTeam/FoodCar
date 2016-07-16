package comments.model;

import java.util.List;
import java.util.Set;

import model.CommentsVO;
import model.ResponseVO;

public class CommentsService {
	CommentsDAO dao=new CommentsDAO();
	
	public static void main(String[]args){
		CommentsService service=new CommentsService();
//		測試多對一    Comments與Response
		List<CommentsVO> list=service.select_ALL_sID(1);
		for(CommentsVO a:list){
			System.out.println(a.getsID());
			Set<ResponseVO> ResponseVO=a.getResponseVO();
			for(ResponseVO s:ResponseVO){
				System.out.println(s.getcContent());
			}
		}
		
	}
	
	
	public CommentsVO select_sID(int sID){
		CommentsVO vo=null;
		vo=dao.select_sID(sID);	
		return vo;
	}
	
	public CommentsVO select_mID(int mID){
		CommentsVO vo=dao.select_mID(mID);
		return vo;
	}
	
	public List<CommentsVO> select_ALL_sID(int sID){
		List<CommentsVO> list=dao.select_ALL_sID(sID);
		return list;
	}
	
	public List<CommentsVO> select_ALL_mID(int mID){
		List<CommentsVO> list=dao.select_ALL_mID(mID);
		return list;
	}
	public CommentsVO insert(CommentsVO vo){
		CommentsVO result=null;
		if(vo!=null){
			result=dao.insert(vo);
		}
		return result;
	}
	public CommentsVO update(CommentsVO vo){
		CommentsVO result=null;
		if(vo!=null){
			result=dao.update(vo);
		}
		return result;
	}
	public boolean delete(int cID){
		Boolean result=dao.delete(cID);
		return result;
	}
	
	
}
