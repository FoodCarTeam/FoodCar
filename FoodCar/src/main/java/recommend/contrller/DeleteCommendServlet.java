package recommend.contrller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.util.HibernateUtil;
import model.recommendVO;
import recommend.model.recommendDao;
import recommend.model.recommentService;

/**
 * Servlet implementation class DeleteCommendServlet
 */
@WebServlet("/DeleteCommendServlet")
public class DeleteCommendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	recommentService service;
	
	
	
	
      
	@Override
	public void init() throws ServletException {
		service=new recommentService(new recommendDao(HibernateUtil.getSessionFactory()));
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sID=request.getParameter("sID");
		String mID=request.getParameter("mID");

//		System.out.println("sID:"+sID);
//		System.out.println("mID:"+mID);
		
		recommendVO vo=new recommendVO();
		vo.setmID(Integer.parseInt(mID));
		vo.setsID(Integer.parseInt(sID));
		
		recommendVO temp=service.select_mID_cID(Integer.parseInt(sID), Integer.parseInt(mID));
		int rID=temp.getrID();
		service.delete(rID);
		
		
	}

}
