package menuedit.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.util.HibernateUtil;
import menus.model.MenusDAOHibernate;
import menus.model.MenusService;
import model.MenusVO;

@WebServlet("/MenueditDelete")
public class MenueditDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MenusService menuService ;
	
	
	@Override
	public void init() throws ServletException {
		menuService=new MenusService(new MenusDAOHibernate(HibernateUtil.getSessionFactory()));
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String f = request.getParameter("f");
		if(f !=null && f.length()!=0){
			int fID = Integer.parseInt(f);
			menuService.delete(fID);
			
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
