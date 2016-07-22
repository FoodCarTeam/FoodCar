package StoresLogin.model;

import model.StoresVO;

public interface StoresLoginDAO {

	StoresVO select (String sUsername);
	
	StoresVO insert(StoresVO vo);
}
