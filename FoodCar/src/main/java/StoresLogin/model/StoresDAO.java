package StoresLogin.model;

import java.util.List;

import model.StoresVO;

public interface StoresDAO {
	StoresVO select(Integer sID);
	
	StoresVO select2(String sUsername);

	List<StoresVO> select();

	StoresVO insert(StoresVO bean);

	StoresVO update(StoresVO bean);

	boolean delete(Integer sID);

}
