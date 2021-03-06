package menus.controller;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.util.HibernateUtil;
import menus.model.MenusService;

import model.MenusVO;
import model.StoresVO;
import stores.model.StoresDAOHibernate;
import stores.model.StoresService;

@WebServlet("/menu")
public class MenusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StoresService storesService;
	
	
	
	
	
	
 
	@Override
	public void init() throws ServletException {
		storesService=new StoresService(new StoresDAOHibernate(HibernateUtil.getSessionFactory()));
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("s");

		String sName = request.getParameter("sName");
		

		if(id !=null && id.length()!=0){
			int sID = Integer.parseInt(id);
			 StoresVO result = storesService.select(sID);
			 Set<MenusVO> menus = result.getMenusVO();
			 for(MenusVO a:menus){
				 System.out.println(a.getFoodID());
			 }
			request.setAttribute("select", result); 
			request.setAttribute("Menus", menus);
			request.setAttribute("sName", sName);
			request.getRequestDispatcher(
					"/Menu.jsp").forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
