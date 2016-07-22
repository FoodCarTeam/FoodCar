package comments.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comments.model.CommentsService;
import model.CommentsVO;

@WebServlet("/InsertCommentsServlet")
public class InsertCommentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

//	public InsertCommentsServlet() {
//		super();
//	}

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
		
//		System.out.println(mID);
//		System.out.println(sID);
//		System.out.println(cDateTemp);
//		System.out.println(cCntentTemp);
		
		CommentsService service=new CommentsService();
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
			vo.setmID(mID);
	
			int sID=Integer.parseInt(sIDTemp);
			vo.setsID(sID);
			vo.setcDate(new java.sql.Date(date.getTime()));
			vo.setcContent(cCntentTemp);
			vo.setcIP(b);
			vo.setcPoint("124");
		
		
			
			CommentsVO result=service.insert(vo);
		System.out.println("result:"+result.getcContent());
		
		
		
	}

}
