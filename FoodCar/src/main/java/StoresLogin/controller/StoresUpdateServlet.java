package StoresLogin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.StoresVO;
import stores.model.StoresService;

/**
 * Servlet implementation class StoresUpdateServlet
 */
@WebServlet("/storeUpdate.do")
public class StoresUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	private StoresService sService = new StoresService();
	private StoresVO svo ;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String sID = request.getParameter("sID");
		String sName = request.getParameter("sName");
		String sBoss = request.getParameter("sBossName");
		String sIntro = request.getParameter("sIntro");
		String sLogo = request.getParameter("sLogo");
		
		Map<String,String> ErrorMsg = new HashMap<String,String>();
		request.setAttribute("ErrMsg", ErrorMsg);
		
		if(sName == null || sName.trim().length() == 0){
			ErrorMsg.put("sName", "請輸入姓名");
		}
		if(sIntro == null || sIntro.trim().length() == 0){
			ErrorMsg.put("sIntro", "請輸入餐車 / 餐點介紹");
		}
		
		if(ErrorMsg!=null && !ErrorMsg.isEmpty()){
			request.getRequestDispatcher(
					"/storemaintain.jsp").forward(request, response);
			return ;
		}
		
		StoresVO svo1 = sService.select(Integer.parseInt(sID));
		String a = svo1.getsUsername();
		String b = svo1.getsPassword();
		String c = svo1.getsLogo();
		String d = svo1.getsBossName();
		
		StoresVO bean = new StoresVO();
		bean.setsID(Integer.valueOf(sID));
		bean.setsUsername(a);
		bean.setsPassword(b);
		bean.setsName(sName);
		bean.setsBossName(d);
		bean.setsIntro(sIntro);
		bean.setsLogo(c);
		
		StoresVO svo = sService.update(bean);
		if(svo == null){
			ErrorMsg.put("Failed", "更新失敗，請重新確認");
			request.getRequestDispatcher(
					"/storemaintain.jsp").forward(request, response);
			return;
		}else{
			HttpSession session = request.getSession();
			session.setAttribute("GotChange", svo);
			
			String path = request.getContextPath();
			response.sendRedirect(path+"/index.jsp");
		}
		
		
		doGet(request, response);
	}

}
