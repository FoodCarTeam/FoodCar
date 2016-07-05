package showFoodCarsMap.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import model.MapsVO;
import model.StoresVO;
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
		showFoodCarsService mapService = new showFoodCarsService();
		List<StoresVO> list = storeService.select();

		PrintWriter pw = response.getWriter();

		JSONArray array = new JSONArray();
		JSONObject object = null;
		Boolean result;

		for (int i = 0; i < list.size(); i++) {

			result = mapService.openOrClose(list.get(i).getsHours());

			if (result) {

				object = new JSONObject();
				object.put("sName", list.get(i).getsName());
				object.put("sID", list.get(i).getsID());
				object.put("sUsername", list.get(i).getsUsername());
				object.put("sHours", list.get(i).getsHours());

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
