package members.model;

import java.util.List;

import model.MapsVO;
import model.MembersVO;



public interface MembersDAO {
	MembersVO select_mID(Integer mID);

	MembersVO insert(MembersVO vo);
	
	MembersVO  update(MembersVO vo);

	boolean delete(Integer mID);

	
	public List<MembersVO> getAll();

	
	MembersVO select_mUsername(String mUsername);

	
}
