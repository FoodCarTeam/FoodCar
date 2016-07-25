package recommend.model;

import java.util.List;

import model.recommendVO;

public interface recommendDaoInterface {
	List<recommendVO> select_sID(int sID);
	List<recommendVO> select_mID(int mID);

	  List<recommendVO> select();
	
	  recommendVO insert(recommendVO vo);
	  
	  recommendVO update(recommendVO vo);
	  
	  boolean delete(int rID);
	
	  int recommendCount(int sID);
	  
	  recommendVO select_mID_cID(int mID,int sID);
	  
}
