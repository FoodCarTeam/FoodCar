package openTime.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import model.HoursVO;
import openTime.model.HoursService;

@WebServlet("/SelectStoreOpenTimeServlet")
public class SelectStoreOpenTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
//		今天明天後天是否營業
		String sID=request.getParameter("sID");
		JSONArray ja=checkOpenTmie(Integer.parseInt(sID));

		PrintWriter pw=response.getWriter();
		pw.println(ja);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public JSONArray checkOpenTmie(int sID){
		HoursService service=new HoursService();
		HoursVO vo=service.select(sID);
		Calendar ca=Calendar.getInstance();
		ca.setFirstDayOfWeek(ca.MONDAY);
		int a=ca.get(ca.DAY_OF_WEEK);
		int b=1;
		int c=2;
		System.out.println("時間："+a);
		int tomorrow=(a+b);
		int acquired=(a+c);
		System.out.println("時間："+tomorrow);
		System.out.println("時間："+acquired);
		JSONObject jo=null;
		JSONArray ja=new JSONArray();
		for(int i=1;i<=3;i++){
			jo=new JSONObject();
			System.out.println("a:"+a);
			if(a>=8){
				a=1;
			}
			String openTime="";
			switch(a){
				case 1: 
					openTime=vo.getSun();
				break;
				case 2: 
					openTime=vo.getMon();
				break;
				case 3: 
					openTime=vo.getTue();
				break;
				case 4: 
					openTime=vo.getWed();
				break;
				case 5: 
					openTime=vo.getThu();
				break;
				case 6: 
					openTime=vo.getFri();
				break;
				case 7: 
					openTime=vo.getSat();
				break;
			}
			if(openTime==null){
				openTime="休息";
			}
//			jo.put("day"+i, openTime);
			ja.add(openTime);
			int temp=1;
			a=a+temp;
		}
		return ja;
	}

}
