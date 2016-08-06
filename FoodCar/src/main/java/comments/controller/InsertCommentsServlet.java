package comments.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SessionFactory;
import org.json.simple.JSONArray;

import com.google.gson.JsonObject;

import comments.model.CommentsDAO;
import comments.model.CommentsService;
import hibernate.util.HibernateUtil;
import members.model.MembersDAOHibernate;
import members.model.MembersService;
import model.CommentsVO;
import model.MembersVO;

@WebServlet("/InsertCommentsServlet")
public class InsertCommentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	MembersService service1;
	CommentsService service;

	@Override
	public void init() throws ServletException {
		
		
		
		service1=new MembersService(new MembersDAOHibernate(HibernateUtil.getSessionFactory()));
		service=new CommentsService(new CommentsDAO(HibernateUtil.getSessionFactory()));
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println(request.getMethod());
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		System.out.println(request.getMethod());
		String mIDTemp=request.getParameter("mID");
		String sIDTemp=request.getParameter("sID");
		String cDateTemp=request.getParameter("cDate");
		String cCntentTemp=request.getParameter("cContent");
		
		System.out.println(mIDTemp);
		System.out.println(sIDTemp);
		System.out.println(cDateTemp);
		System.out.println(cCntentTemp);
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = null;
		try {
			date = sdf.parse(cDateTemp);
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
		
		CommentsVO vo=new CommentsVO();
		
		
			int mID=Integer.parseInt(mIDTemp);
			
			
			
			MembersVO s=service1.select(mID);
			
			vo.setMemberVO(s);
			
			
			
			
			
			vo.setmID(mID);
	
			int sID=Integer.parseInt(sIDTemp);
			vo.setsID(sID);
			vo.setcDate(new java.sql.Date(date.getTime()));
			vo.setcContent(cCntentTemp);
			vo.setcIP(b);
			vo.setcPoint("124");
			CommentsVO result=service.insert(vo);
			
			response.setHeader("content-type", "text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			JsonObject jo=new JsonObject();
			PrintWriter pw=response.getWriter();
			jo.addProperty("cID", vo.getcID());
			System.out.println("getcID:"+vo.getcID());
//			JSONArray ja=new JSONArray();
//			ja.add(jo);
			pw.println(jo);
			
		
	}

}
