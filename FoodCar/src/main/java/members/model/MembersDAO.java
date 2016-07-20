package members.model;

import java.util.List;

import model.MapsVO;
import model.MembersVO;



public interface MembersDAO {
	MembersVO select(Integer mID);

	MembersVO insert(MembersVO vo);
	
	MembersVO  update(MembersVO vo);

	boolean delete(Integer mID);

	public List<MembersVO> findByKey(Integer mID);
	
	public List<MembersVO> getAll();

	MembersVO login(String mUsername, String mPassword);
	
	MembersVO select1(String mUsername);

	
}
