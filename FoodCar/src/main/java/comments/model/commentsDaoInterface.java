package comments.model;

import java.util.List;

import model.CommentsVO;

public interface commentsDaoInterface {
	
	CommentsVO select(int mID);
	List<CommentsVO> select_ALL();
	CommentsVO insert(CommentsVO vo);
	CommentsVO update(CommentsVO vo);
	boolean delete(int cID);
}
