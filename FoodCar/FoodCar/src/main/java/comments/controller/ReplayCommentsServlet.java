package comments.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SessionFactory;

import com.google.gson.Gson;

import hibernate.util.HibernateUtil;
import model.ResponseVO;
import response.model.ResponseDao;
import response.model.ResponseService;

@WebServlet("/comments/controller/ReplayCommentsServlet")
public class ReplayCommentsServlet extends HttpServlet {

	ResponseService service ;
	
	
	
	@Override
	public void init() throws ServletException {
		service=new ResponseService(new ResponseDao(HibernateUtil.getSessionFactory()));
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("doGet():method="+request.getMethod());
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("doPost():method="+request.getMethod());
		
		

		
//		String data = request.getParameter("data");
//		 //String data = getBody(request);
//		 System.out.println("dada"+data);
//		 Gson gson=new Gson();
//		 ResponseVO vo=new ResponseVO();
//		  vo=gson.fromJson(data,ResponseVO.class);
//		 System.out.println("cContent:"+vo);
//		 service.insert(vo);
		
		String cID = request.getParameter("cID");
		String cContent = request.getParameter("cContent");
		String sName = request.getParameter("sName");
		String mName = request.getParameter("mName");
		String cDate = request.getParameter("cDate");
System.out.println(cContent);
		System.out.println("cDate:"+cDate);
		ResponseVO vo = new ResponseVO();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = null;
		try {
			date = sdf.parse(cDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		String ip = request.getRemoteAddr();
		if (ip.equalsIgnoreCase("0:0:0:0:0:0:0:1")) {
			InetAddress inetAddress = InetAddress.getLocalHost();
			String ipAddress = inetAddress.getHostAddress();
			ip = ipAddress;
		}
		byte a[] = ip.getBytes();
		Byte b[] = new Byte[a.length];
		for (int i = 0; i < a.length; i++) {
			b[i] = Byte.valueOf(a[i]);
		}

		System.out.println("cID~~:"+cID);
		
		vo.setcContent(cContent);
		vo.setcDate(date);
		vo.setcID(Integer.valueOf(cID));
		vo.setmName(mName);
		vo.setsName(sName);
		vo.setcIP(b);
		service.insert(vo);
		System.out.println("即時回覆："+vo.getcContent());

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
