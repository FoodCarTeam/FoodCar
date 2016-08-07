package openTime.model;

import java.util.List;

import model.HoursVO;

public interface HoursDaoInterface {
	  HoursVO select(int sID);

	  List<HoursVO> select();
	  
	  HoursVO insert(HoursVO map);
	  
	  HoursVO update(HoursVO map);
	  
	  boolean delete(int sID);
	  
}
