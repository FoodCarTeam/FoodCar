package menus.model;

import java.util.List;

import model.MenusVO;


public interface MenusDAO {
	MenusVO select(Integer sID);
	MenusVO selectfood(Integer foodID);

	MenusVO insert(MenusVO mnvo);

	MenusVO update(MenusVO mnvo);

	boolean delete(Integer foodID);

	public List<MenusVO> findByKey(Integer sID);
	
	public List<MenusVO> getAll();
	
}
