package showFoodCarsMap.model;

import java.util.List;

import model.MapsVO;

public interface MapDaoInterface {
	  MapsVO select(int id);

	  List<MapsVO> select();
	  
	  MapsVO insert(MapsVO map);
	  
	  MapsVO update(MapsVO map);
	  
	  boolean delete(int id);
	  
}
