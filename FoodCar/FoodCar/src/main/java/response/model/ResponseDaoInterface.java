package response.model;

import java.util.List;

import model.ResponseVO;

public interface ResponseDaoInterface {

	ResponseVO select(int cID);
	List<ResponseVO> select_ALL(int cID);
	
	ResponseVO insert(ResponseVO vo);
	ResponseVO update(ResponseVO vo);
	boolean delete(int rID);
}
