package showFoodCarsMap.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;


import model.ActivityVO.TaiwanActivityResult2;
import model.ActivityVO.TaiwanActivityVO;

/**
 * Servlet implementation class ReadActivityServlet
 */
@WebServlet("/ReadActivityServlet")
public class ReadActivityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=36847f3f-deff-4183-a5bb-800737591de5";
//		&limit=5
		RestTemplate template = new RestTemplate();
		TaiwanActivityVO vo=null;
		
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter pw=response.getWriter();
        try {
			 vo = template.getForObject(new URI(url), TaiwanActivityVO.class);
		} catch (RestClientException | URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        List<TaiwanActivityResult2> list=vo.getResult().getResults();
        
        JSONArray ja=new JSONArray();
        JSONObject jo;
        
        for(TaiwanActivityResult2 a:list){
        	jo=new JSONObject();
        	
        	
        	if(a.getMEMOTIME()==null){
        		jo.put("openTime", "依場地時間");
        	}else{
        		jo.put("openTime", a.getMEMOTIME());
        	}
        	
        	
//        	jo.put("file", a.getFile());
        	jo.put("title", a.getStitle());
        	jo.put("body", a.getXbody());
        	jo.put("lat",a.getLatitude());
        	jo.put("lng", a.getLongitude());
        	jo.put("MRT", a.getMRT());
        	
//        	System.out.println("MEMOTIME"+a.getMEMOTIME());
//        	System.out.println("file:"+a.getFile());
//        	System.out.println("stitile:"+a.getStitle());
//        	System.out.println("xbody:"+a.getXbody());
//        	System.out.println("lat:"+a.getLatitude());
//        	System.out.println("long:"+a.getLongitude());
//        	System.out.println("MRT:"+a.getMRT());
   
        	ja.add(jo);
        }
        
        pw.println(ja);
        
        
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}


}
