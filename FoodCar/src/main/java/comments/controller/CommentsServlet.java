package comments.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import comments.model.CommentsService;
import model.CommentsVO;
import model.MembersVO;
import model.ResponseVO;
import model.StoresVO;

@WebServlet("/CommentsServlet")
public class CommentsServlet extends HttpServlet {
	CommentsService service=new CommentsService();
	private static final long serialVersionUID = 1L;
	
  
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//			String datas=getBody(request);
//			Gson gson=new Gson();
//			StoresVO vo=gson.fromJson(datas,StoresVO.class);
//		
//			System.out.println("sID"+vo.getsID());
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		String sID=request.getParameter("sID");	
		List<CommentsVO> list=service.select_ALL_sID(Integer.parseInt(sID));
		
		
		
		
		
		
		
		PrintWriter pw = response.getWriter();
		
		JSONArray array = new JSONArray();
		JSONArray array2=null;
		JSONObject comment = null;
		JSONObject cResponse = null;

		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		
		
		
		for(int i=0;i<list.size();i++){
			comment = new JSONObject();
			comment.put("cID", list.get(i).getcID());
			comment.put("sID", list.get(i).getsID());
			comment.put("mID", list.get(i).getmID());	
			
			Date tempDate= list.get(i).getcDate();
			String Date=sdf.format(tempDate);
			
			
			
			
			
//			System.out.println(Date);
			comment.put("cDate",Date);
			comment.put("cContent", list.get(i).getcContent());
			comment.put("cPoint", list.get(i).getcPoint());
			comment.put("cContent", list.get(i).getcContent());
			

			Set<ResponseVO> responseVO=list.get(i).getResponseVO();
			Set<MembersVO> memberVO=list.get(i).getMemberVO();
			
			for(MembersVO b:memberVO){
			comment.put("mName",b.getmName());
			}
			
			array2=new JSONArray();
			if(responseVO.size()!=0){
				
			
				
				comment.put("ResponseTrueOrFalse","true");
				comment.put("ResponseCount",responseVO.size());
				
				int count=1;
				
				for(ResponseVO temp:responseVO){
					cResponse=new JSONObject();
					cResponse.put("rID", temp.getrID());
					cResponse.put("cID", temp.getcID());
					
					cResponse.put("sName", temp.getsName());
					cResponse.put("mName", temp.getmName());
					
					Date tempDate2=temp.getcDate();
					String date2=sdf.format(tempDate2);
					
					
					cResponse.put("cDate",date2);
					cResponse.put("cContent", temp.getcContent());
					comment.put("Response", cResponse);
					array2.add(cResponse);
					count++;
				}
			
				
			}else{
				comment.put("ResponseTrueOrFalse","false");
			}
		
			comment.put("Response",array2);
			array.add(comment);
			
			
		}	
			
			pw.println(array);
			
			
			
			
		
		String ip=request.getRemoteAddr();
		if (ip.equalsIgnoreCase("0:0:0:0:0:0:0:1")) {
		    InetAddress inetAddress = InetAddress.getLocalHost();
		    String ipAddress = inetAddress.getHostAddress();
		    ip = ipAddress;
		}
		byte a[]=ip.getBytes();
		Byte b[]=new Byte[a.length];
		 for (int i = 0; i < a.length; i++)
		    {
		        b[i] = Byte.valueOf(a[i]);
		    }
//		System.out.println(ip.getBytes());
//		System.out.println(b);
		
		
		
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
			}
			
			params = sb.toString();

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
