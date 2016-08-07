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

import comments.model.CommentsDAO;
import comments.model.CommentsService;
import hibernate.util.HibernateUtil;
import model.CommentsVO;


@WebServlet("/UpdateCommentsServlet")
public class UpdateCommentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommentsService service;
	
	
	
	@Override
	public void init() throws ServletException {
		
		
		service=new CommentsService(new CommentsDAO(HibernateUtil.getSessionFactory()));
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cID=request.getParameter("cID");
		String content=request.getParameter("content");
		String cDateTemp=request.getParameter("cDate");
		String mID=request.getParameter("mID");
		String sID=request.getParameter("sID");
		
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

		
		CommentsVO resultTemp=service.select_cID(Integer.parseInt(cID));
		Date cDate2=resultTemp.getcDate();
		
		CommentsVO vo=new CommentsVO();
		vo.setcID(Integer.parseInt(cID));
		vo.setcDate(cDate2);
		vo.setcContent(content);
		vo.setcIP(b);
		vo.setmID(Integer.parseInt(mID));
		vo.setsID(Integer.parseInt(sID));
		vo.setcPoint("123");
		service.update(vo);
		
		
		
	}

}
