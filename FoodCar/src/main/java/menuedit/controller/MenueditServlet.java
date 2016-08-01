package menuedit.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
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

import model.MenusVO;
import model.StoresVO;
import stores.model.StoresService;

@WebServlet("/menuedit")
public class MenueditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StoresService storesService = new StoresService();
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("s");
		int sID = 0;
		StoresVO result =null;
		Set<MenusVO> menus = null;
		if(id !=null && id.length()!=0){
			sID = Integer.parseInt(id);
			 result = storesService.select(sID);
			 menus = result.getMenusVO();
		}
		request.setAttribute("store", result);
		request.setAttribute("menu", menus);
		request.getRequestDispatcher("/editmenu.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
