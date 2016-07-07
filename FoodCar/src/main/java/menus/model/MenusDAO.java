package menus.model;

import java.util.List;

import model.MenusVO;


public interface MenusDAO {
	MenusVO select(Integer sID);

	MenusVO insert(MenusVO bean);

	MenusVO update();

	boolean delete(Integer id);

}
