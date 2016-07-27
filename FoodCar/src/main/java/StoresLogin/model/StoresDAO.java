package StoresLogin.model;

import java.util.List;

import model.StoresVO;

public interface StoresDAO {
	StoresVO select_sID(Integer sID);
	
	StoresVO select_sUser(String sUsername);

	List<StoresVO> select();

	StoresVO insert(StoresVO bean);

	StoresVO update(StoresVO bean);

	boolean delete(Integer sID);

}
