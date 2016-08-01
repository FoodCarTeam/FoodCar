package showFoodCarsMap.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;

import model.MapsVO;
import showFoodCarsMap.model.showFoodCarsService;

@WebServlet("/showFoodCarsMap/controller/storeLocation")
public class changeStoreLocation extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String data = getBody(request);
		
		
		Gson gson=new Gson();
		MapsVO vo=gson.fromJson(data,MapsVO.class);
		showFoodCarsService service=new showFoodCarsService();
		MapsVO result =null;
		
			List<MapsVO> list=service.select(vo);
//		if(list==null)
//		{
//			result=service.insert(vo);
//		}else{
			result = service.update(vo);			
//		}
		
		
	}

	private String getBody(HttpServletRequest request) {

		BufferedReader br = null;
		String params = null;
		StringBuffer sb;
		try {
			br = new BufferedReader(new InputStreamReader((ServletInputStream) request.getInputStream(), "utf-8"));
			sb = new StringBuffer("");
			String temp;
			while ((temp = br.readLine()) != null) {
				sb.append(temp);
				System.out.println("temp:"+temp);
			}
			params = sb.toString();
			System.out.println("params2:"+params);

		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
		} catch (IOException e) {

			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		}
		return params;

	}
	
}
