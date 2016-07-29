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

import StoresLogin.model.StoresService;
import model.StoresVO;



@WebServlet("/storechange.do")
public class StoresChangePassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private StoresService sService = new StoresService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String sUser = request.getParameter("sUsername");
		String sPass = request.getParameter("sPassword");
		String newPass = request.getParameter("newPassword");
		String newAgain = request.getParameter("newAgain");
		
		Map<String,String> Errors = new HashMap<String, String>();
		request.setAttribute("error", Errors);
		
		if(sPass == null || sPass.trim().length() == 0){
			Errors.put("sPassword", "請輸入原密碼");
		}
		if(newPass == null || newPass.trim().length() == 0){
			Errors.put("newPassword", "請輸入新密碼");
		}
		if(newAgain == null || newAgain.trim().length() == 0){
			Errors.put("newAgain", "請再次輸入新密碼");
		}
		if(Errors!=null && !Errors.isEmpty()){
			request.getRequestDispatcher(
					"/storemaintain.jsp").forward(request, response);
			return;
		}
		
		StoresVO svo = sService.changePass(sUser, sPass, newPass);
		System.out.println(svo);
		if(svo == null){
			System.out.println("空");
			Errors.put("changeFail", "變更失敗，請重新確認");
			request.getRequestDispatcher(
					"/user2.jsp").forward(request, response);
			return;
		}else{
			System.out.println("有");
			HttpSession session = request.getSession();
			session.setAttribute("GotChange", svo);
			
			String path = request.getContextPath();
			response.sendRedirect(path+"/index.jsp");
			session.invalidate();
		}
		
	}

}
