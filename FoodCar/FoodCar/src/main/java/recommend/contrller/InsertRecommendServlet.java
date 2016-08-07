package recommend.contrller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SessionFactory;

import com.google.gson.JsonObject;

import hibernate.util.HibernateUtil;
import members.model.MembersDAOHibernate;
import members.model.MembersService;
import model.recommendVO;
import recommend.model.recommendDao;
import recommend.model.recommentService;

@WebServlet("/InsertRecommendServlet")
public class InsertRecommendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	recommentService service;
	MembersService memberService;
	
	
   
	@Override
	public void init() throws ServletException {
		SessionFactory sf=HibernateUtil.getSessionFactory();
		service=new recommentService(new recommendDao(sf));
		memberService=new MembersService(new MembersDAOHibernate(sf));
		
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String sID=request.getParameter("sID");
		String mID=request.getParameter("mID");
		System.out.println("sID:"+sID);
		System.out.println("mID:"+mID);
		
	
		
		recommendVO vo=new recommendVO();
		vo.setmID(Integer.parseInt(mID));
		vo.setsID(Integer.parseInt(sID));
		vo.setMemberVO(memberService.select(Integer.parseInt(mID)));
		
		
		
		service.insert(vo);
		
		
		
		
		
//		doGet(request, response);
	}

}
