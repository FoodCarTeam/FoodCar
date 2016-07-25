package recommend.contrller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import model.recommendVO;
import recommend.model.recommentService;

@WebServlet("/SelectRecommendServlet")
public class SelectRecommendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

		String sID=request.getParameter("sID");
		String mID=request.getParameter("mID");
//		System.out.println("cID:"+cID);
		
		recommentService service=new recommentService();
		recommendVO vo=new recommendVO();
		vo=service.select_mID_cID(Integer.parseInt(sID), Integer.parseInt(mID));
		JsonObject jo=new JsonObject();
		
//		null就代表還沒+1
		if(vo==null){
			jo.addProperty("result",true);
		}else{
			jo.addProperty("result",false);
		}
		
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter pw=response.getWriter();
		pw.println(jo);
		
		
	}

}
