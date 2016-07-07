package stores.controller;

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

import model.MapsVO;
import model.StoresVO;
import stores.model.StoresService;

@WebServlet("/StoreServlet")
public class StoreServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StoresService storesService = new StoresService();
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("sID");
		int sID = 0;
		 if(id!=null&&id.length()!=0){
	      sID = Integer.parseInt(id);
		 StoresVO result = storesService.select(sID);
		 Set<MapsVO> map = result.getMapVO();
         
//		 Map m1 = new HashMap();
		 String loc="";
		 for(MapsVO a:map){
//			m1.put("location", a.getLocation());
			loc=a.getLocation();
			 System.out.println(a.getLocation());
		 }
		 
		 request.setAttribute("select", result);
		 request.setAttribute("map", loc);
		 request.getRequestDispatcher(
					"/Store.jsp").forward(request, response);
		 }
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
