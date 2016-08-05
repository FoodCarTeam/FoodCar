package recommend.contrller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SessionFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import hibernate.util.HibernateUtil;
import members.model.MembersDAOHibernate;
import members.model.MembersService;
import model.MembersVO;
import model.StoresVO;
import model.recommendVO;
import recommend.model.recommendDao;
import recommend.model.recommentService;
import stores.model.StoresDAOHibernate;
import stores.model.StoresService;

@WebServlet("/MemberInfoServlet")
public class MemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StoresService storeService;
	recommentService reService;
	MembersService service;
	
     
	@Override
	public void init() throws ServletException {
	
		SessionFactory sf=HibernateUtil.getSessionFactory();
		
		storeService=new StoresService(new StoresDAOHibernate(sf));
		reService=new recommentService(new recommendDao(sf));
		service=new MembersService(new MembersDAOHibernate(sf));
		
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setHeader("content-type","text/html;charset=UTF-8");
		
		PrintWriter pw=response.getWriter();
		
		
		String mID=request.getParameter("mID");
		
		
		
		MembersVO memberVO=service.select(Integer.parseInt(mID));
		
		Set<recommendVO> recommendVOSet=memberVO.getRecommendVO();
		int count;
		
		JSONArray ja=new JSONArray();
		JSONObject jo=null;
		for(recommendVO a:recommendVOSet){
			jo=new JSONObject();
			System.out.println("sID:"+a.getsID());
			
			StoresVO storeVO=storeService.select(a.getsID());
			System.out.println("sName:"+storeVO.getsName());
			count=reService.recommendCount(a.getsID());
			jo.put("sID", storeVO.getsID());
			jo.put("sName", storeVO.getsName());
			jo.put("goodCount",count);
			ja.add(jo);
		}
		pw.println(ja);
		
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
