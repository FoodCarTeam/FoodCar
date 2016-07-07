package showFoodCarsMap.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.property.MapAccessor.MapSetter;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import model.HoursVO;
import model.MapsVO;
import model.StoresVO;
import openTime.model.HoursService;
import showFoodCarsMap.model.showFoodCarsService;
import stores.model.StoresService;

@WebServlet("/showFoodCarsMap/controller/MapMaker")
public class ShowFoodCarsMap extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		StoresService storeService = new StoresService();
		HoursService HoursService = new HoursService();
		List<StoresVO> list = storeService.select();

		PrintWriter pw = response.getWriter();

		JSONArray array = new JSONArray();
		JSONObject object = null;
		Boolean result;
		
		Calendar ca=Calendar.getInstance();
		int week=ca.get(Calendar.DAY_OF_WEEK);

		for (int i = 0; i < list.size(); i++) {

			result = HoursService.openOrClose(list.get(i).getsID());

			if (result) {
				object = new JSONObject();
				object.put("sName", list.get(i).getsName());
				object.put("sID", list.get(i).getsID());
				object.put("sUsername", list.get(i).getsUsername());	
				Set<HoursVO> hours=list.get(i).getHoursVO();
				for(HoursVO a:hours){
					switch (week) {
					case Calendar.MONDAY:
						object.put("openTime",a.getMon());
						break;
					case Calendar.TUESDAY:
						object.put("openTime",a.getTue());
						break;
					case Calendar.WEDNESDAY:
						object.put("openTime",a.getWed());
						break;
					case Calendar.THURSDAY:
						object.put("openTime",a.getThu());
						break;
					case Calendar.FRIDAY:
						object.put("openTime",a.getFri());
						break;
					case Calendar.SATURDAY:
						object.put("openTime",a.getSat());
						break;
					case Calendar.SUNDAY:
						object.put("openTime",a.getSun());
						break;
					}
				}
				
				
				object.put("open", true);
				Set<MapsVO> map = list.get(i).getMapVO();
				for (MapsVO a : map) {
					object.put("location", a.getLocation());
				}
				array.add(object);
			} else {
				object = new JSONObject();
			object.put("sName", list.get(i).getsName());
			object.put("sID", list.get(i).getsID());
			object.put("sUsername", list.get(i).getsUsername());
			object.put("sHours", list.get(i).getsHours());
			object.put("open", false);

			Set<MapsVO> map = list.get(i).getMapVO();
			for (MapsVO a : map) {
				object.put("location", a.getLocation());
			}
			array.add(object);

			}

		}

		pw.println(array);

	}

}
