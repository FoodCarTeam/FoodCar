package _20_managemaintain.model;

import java.util.List;

import model.ManagerVO;

public interface ManagerDAO {

	ManagerVO select (Integer manageID);
	
	ManagerVO select2 (String managerUser);
	
	ManagerVO insert (ManagerVO bean);
	
	ManagerVO update (ManagerVO bean);
	
	boolean delete (Integer manageID);
	
	List<ManagerVO> select();
	
}
