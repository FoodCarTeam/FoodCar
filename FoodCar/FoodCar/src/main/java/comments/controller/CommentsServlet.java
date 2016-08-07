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

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SessionFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import comments.model.CommentsDAO;
import comments.model.CommentsService;
import hibernate.util.HibernateUtil;
import members.model.MembersDAOHibernate;
import model.CommentsVO;
import model.MembersVO;
import model.ResponseVO;
import model.StoresVO;
import response.model.ResponseDao;
import stores.model.StoresDAOHibernate;

@WebServlet("/CommentsServlet")
public class CommentsServlet extends HttpServlet {
	CommentsService service;
	private static final long serialVersionUID = 1L;
	StoresDAOHibernate storeDao;
	MembersDAOHibernate dao;
	

	
	@Override
	public void init() throws ServletException {
		
		
		storeDao=new StoresDAOHibernate(HibernateUtil.getSessionFactory());
		service=new CommentsService(new CommentsDAO(HibernateUtil.getSessionFactory()));
				dao=new MembersDAOHibernate(HibernateUtil.getSessionFactory());
				
				
				
	}

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
		
		for(CommentsVO f:list){
			System.out.println("f:"+f);
			System.out.println("member:"+f.getMemberVO());
			System.out.println("回覆:"+f.getResponseVO());
		}
		
		
		
		
		
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
//			comment.put("cContent", list.get(i).getcContent());
			comment.put("cPoint", list.get(i).getcPoint());
			comment.put("cContent", list.get(i).getcContent());
			System.out.println("cContent"+list.get(i).getcContent());

			Set<ResponseVO> responseVO=list.get(i).getResponseVO();
			MembersVO memberVO=list.get(i).getMemberVO();
			
			comment.put("mName",memberVO.getmName());
			comment.put("mImg",memberVO.getmIMG());
			
			
			
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
					
					System.out.println("temp.getsName():"+temp.getsName());
					if(temp.getsName()==null){
						
						System.out.println("sName是空的");
						
						StoresVO vo=new StoresVO();
						vo=storeDao.select_mName(temp.getsName());
						cResponse.put("sLogo",vo.getsLogo());
					}else{
						System.out.println("sName是有東西");
						MembersVO asd=dao.select_mName(temp.getmName());
//						System.out.println("memberVO"+asd);
//						System.out.println("mImg:"+asd.getmIMG());
						cResponse.put("mImg",asd.getmIMG());
					}
					
					
					
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
