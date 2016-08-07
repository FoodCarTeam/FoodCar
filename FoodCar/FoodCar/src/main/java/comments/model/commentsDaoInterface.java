package comments.model;

import java.util.List;

import model.CommentsVO;

public interface commentsDaoInterface {
	
	CommentsVO select_sID(int sID);
	CommentsVO select_mID(int mID);

	List<CommentsVO> select_ALL_mID(int mID);
	List<CommentsVO> select_ALL_sID(int sID);
	
	CommentsVO insert(CommentsVO vo);
	CommentsVO update(CommentsVO vo);
	boolean delete(int cID);
}
