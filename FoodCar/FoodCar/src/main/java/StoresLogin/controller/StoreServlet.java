package StoresLogin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import hibernate.util.HibernateUtil;
import model.MapsVO;
import model.MenusVO;
import model.StoresVO;
import stores.model.StoresDAOHibernate;
import stores.model.StoresService;


@WebServlet("/Store")
public class StoreServlet extends HttpServlet {
	StoresService storesService;
	
	@Override
	public void init() throws ServletException {
		storesService=new StoresService(new StoresDAOHibernate(HibernateUtil.getSessionFactory()));
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("sID");
		System.out.println(id);
		int sID = 0;
		 if(id!=null&&id.length()!=0){
	      sID = Integer.parseInt(id);
		 StoresVO result = storesService.select(sID);
		 Set<MapsVO> map = result.getMapVO();
		 Set<MenusVO> menus = result.getMenusVO();

		 String[] loc=null;
		 for(MapsVO a:map){

			loc=a.getLocation().split(",");
			 System.out.println(a.getLocation());
		 }
		 request.setAttribute("menus", menus);
		 request.setAttribute("select", result);
		 request.setAttribute("map", loc);
		 request.getRequestDispatcher(
					"/user2.jsp").forward(request, response);
		 }
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
