package stores.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
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

import model.HoursVO;
import model.StoresVO;
import openTime.model.HoursService;
import stores.model.StoresService;


@WebServlet("/StoresServlet")
public class StoresServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private StoresService storesService = new StoresService();
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		List<StoresVO> result = storesService.select();
		
		Calendar ca=Calendar.getInstance();
		ca.setFirstDayOfWeek(ca.MONDAY);
		int week=ca.get(ca.DAY_OF_WEEK);

//		以下處理營業時間
		
		HoursService service=new HoursService();
		List<HoursVO> list=service.select();
		
		
		
		
		
		String openTime="";
		
		
		PrintWriter pw=response.getWriter();
		System.out.println("先"+openTime);
		
		
		
		
		
		List  l1 = new LinkedList();
		for(int i=0; i < result.size();i++){
			 Map m1 = new HashMap();
			 m1.put("sName", result.get(i).getsName());
			 m1.put("sUsername", result.get(i).getsUsername());
			 m1.put("sID", result.get(i).getsID());
			 m1.put("sLogo", result.get(i).getsLogo());
			 Set<HoursVO> houresVO=result.get(i).getHoursVO();
			 
			 for(HoursVO b:houresVO){
				 switch(week){
					case 1: 
						openTime=b.getSun();
					break;
					case 2: 
						openTime=b.getMon();
					break;
					case 3: 
						openTime=b.getTue();
					break;
					case 4: 
						openTime=b.getWed();
					break;
					case 5: 
						openTime=b.getThu();
					break;
					case 6: 
						openTime=b.getFri();
					break;
					case 7: 
						openTime=b.getSat();
					break;
				}
				 
			 }
			 if(openTime==null){
					openTime="今日未營業";
				}
			 m1.put("openTime",openTime);
		
			 l1.add(m1);
		}
		
		 String jsonString = JSONValue.toJSONString(l1);  

		 out.println(jsonString);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
