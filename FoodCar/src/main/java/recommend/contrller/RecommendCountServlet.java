package recommend.contrller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import recommend.model.recommentService;

@WebServlet("/RecommendCountServlet")
public class RecommendCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sID=request.getParameter("sID");
//		System.out.println("cID:"+cID);
		
		recommentService service=new recommentService();
		int result=service.recommendCount(Integer.parseInt(sID));
		
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter pw=response.getWriter();
		
		JsonObject jo=new JsonObject();
		jo.addProperty("recommentCount", result);
		pw.println(jo);
		
	}

}