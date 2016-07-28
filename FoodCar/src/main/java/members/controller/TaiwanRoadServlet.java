package members.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import members.model.MembersService;

@WebServlet("/TaiwanRoadServlet")
public class TaiwanRoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		String roadName=request.getParameter("roadName");
		String county=request.getParameter("county");
		String area=request.getParameter("area");
		System.out.println("roadName:"+roadName);
		
		
		PrintWriter pw=response.getWriter();
		
		JsonObject jo=new JsonObject();
		JsonArray ja=new JsonArray();
		
		MembersService service=new MembersService();
		List<String> list=service.select_TaiwanRoad(county,area,roadName);
//		System.out.println(list.size());
		for(String a:list){
//			System.out.println("here");
//			System.out.println(a);
//			jo.addProperty("roadName", a);
			ja.add(a);
		}
		
		pw.println(ja);
		
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
