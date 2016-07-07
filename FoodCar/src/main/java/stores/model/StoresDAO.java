package stores.model;

import java.util.List;

import model.StoresVO;

public interface StoresDAO {
	StoresVO select(Integer sID);

	List<StoresVO> select();

	StoresVO insert(StoresVO bean);

	StoresVO update(String sUsername,String sPassword,String sName, String sBossName ,String sLogo,Integer sID);

	boolean delete(Integer id);

}
