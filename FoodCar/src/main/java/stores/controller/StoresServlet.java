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

import stores.model.StoresService;
import model.StoresVO;


@WebServlet("/StoresServlet")
public class StoresServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private StoresService storesService = new StoresService();
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		List<StoresVO> result = storesService.select();
		
		List  l1 = new LinkedList();
		for(int i=0; i < result.size();i++){
			 Map m1 = new HashMap();
			 m1.put("sName", result.get(i).getsName());
			 m1.put("sUsername", result.get(i).getsUsername());
			 m1.put("sHours", result.get(i).getsHours());
		
			 l1.add(m1);
		}
		
		 String jsonString = JSONValue.toJSONString(l1);  

		 out.println(jsonString);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
