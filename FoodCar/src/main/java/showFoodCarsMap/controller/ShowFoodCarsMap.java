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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import model.MapsVO;
import model.StoresVO;
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

		StoresService service = new StoresService();

		List<StoresVO> list = service.select();

		PrintWriter pw = response.getWriter();

		JSONArray array = new JSONArray();
		JSONObject object = null;

		for (int i = 0; i < list.size(); i++) {
			object = new JSONObject();
			object.put("sName", list.get(i).getsName());
			object.put("sID", list.get(i).getsID());
			object.put("sUsername",list.get(i).getsUsername());
			object.put("sHours",list.get(i).getsHours());
			Set<MapsVO> map = list.get(i).getMapVO();
			for (MapsVO a : map) {
				object.put("location", a.getLocation());
			}
			array.add(object);
		}
		pw.println(array);

	}

}
