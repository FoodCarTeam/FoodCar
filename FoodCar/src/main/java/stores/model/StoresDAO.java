package stores.model;

import java.util.List;

import model.StoresVO;

public interface StoresDAO {
	StoresVO select(Integer id);

	List<StoresVO> select();

	StoresVO insert(StoresVO bean);

	StoresVO update(String sUsername,String sPassword,String sName, String sBossName , String sHours,Byte[] sLogo,Integer sID);

	boolean delete(Integer id);

}
