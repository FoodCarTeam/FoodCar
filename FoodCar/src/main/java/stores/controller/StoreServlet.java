package stores.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONValue;

import model.StoresVO;
import stores.model.StoresService;

@WebServlet("/StoreServlet")
public class StoreServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StoresService storesService = new StoresService();
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("sID");
		
//		System.out.println(sID);
//		StoresVO result = storesService.select(sID);
//		
//		Map m1 = new HashMap();
//		m1.put("sName", result.getsName());
//		m1.put("sUsername", result.getsUsername());
//		m1.put("sHour", result.getsHours());
//		
//		 String jsonString = JSONValue.toJSONString(m1);  
//
//		 out.println(jsonString);
		int sID = 0;
		 if(id!=null&&id.length()!=0){
	      sID = Integer.parseInt(id);
		 StoresVO result = storesService.select(sID);
		 request.setAttribute("select", result);
		 request.getRequestDispatcher(
					"/Store.jsp").forward(request, response);
		 }
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
