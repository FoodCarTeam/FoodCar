package openTime.controller;

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
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import model.HoursVO;
import model.MapsVO;
import model.StoreOpenTime;
import model.StoresVO;
import openTime.model.HoursService;
import showFoodCarsMap.model.showFoodCarsService;

@WebServlet("/StoreOpenTimeServlet")
public class StoreOpenTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getMethod());
		String data = getBody(request);
		Gson gson = new Gson();
		List<StoreOpenTime>list = gson.fromJson(data,new TypeToken<List<StoreOpenTime>>(){}.getType() );
		
		HoursService service=new HoursService();
		HttpSession session=request.getSession();
		StoresVO storeVo=(StoresVO)session.getAttribute("store");
		HoursVO hoursVo=new HoursVO();
//		System.out.println("sID:"+vo.getsID());
		for(int i=0;i<7;i++){
			if(list.get(i).getIsActive()){
				if(i==0){
					String openTime=list.get(i).getTimeFrom()+"~"+list.get(i).getTimeTill();	
					hoursVo.setMon(openTime);
				}else if(i==1){
					String openTime=list.get(i).getTimeFrom()+"~"+list.get(i).getTimeTill();	
					hoursVo.setTue(openTime);
				}else if(i==2){
					String openTime=list.get(i).getTimeFrom()+"~"+list.get(i).getTimeTill();	
					hoursVo.setWed(openTime);
				}else if(i==3){
					String openTime=list.get(i).getTimeFrom()+"~"+list.get(i).getTimeTill();	
					hoursVo.setThu(openTime);
				}else if(i==4){
					String openTime=list.get(i).getTimeFrom()+"~"+list.get(i).getTimeTill();	
					hoursVo.setFri(openTime);
				}else if(i==5){
					String openTime=list.get(i).getTimeFrom()+"~"+list.get(i).getTimeTill();	
					hoursVo.setSat(openTime);
				}else if(i==6){
					String openTime=list.get(i).getTimeFrom()+"~"+list.get(i).getTimeTill();	
					hoursVo.setSun(openTime);
				}
				
			}
		
			
			
		}
		
		System.out.println();
		hoursVo.setsID(storeVo.getsID());
		service.update(hoursVo);
		

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
			System.out.println("params1:"+params);
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
