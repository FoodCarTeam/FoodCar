package _19_storemaintain.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _19_storemaintain.model.StoresService;
import model.StoresVO;


@WebServlet("/login")
public class StoresLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private StoresService sService = new StoresService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		this.doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String sUser = request.getParameter("sUsername");
		String sPass = request.getParameter("sPassword");
		
		Map<String, String> errors = new HashMap<String,String>();
		request.setAttribute("error", errors);
		
		if(sUser == null || sUser.trim().length() == 0){
			errors.put("sUsername", "請輸入帳號");
		}
		if(sPass == null || sPass.trim().length() == 0){
			errors.put("sPassword", "請輸入密碼");
		}
		
		String page="";
		try{
			
		}catch(Exception e){
			page = "login.jsp";
			throw e;
		}finally{
			page = "index.jsp";
		}
		
		if(errors!=null||!errors.isEmpty()){
			request.getRequestDispatcher(page)
				.forward(request, response);
		}
		StoresVO svo = sService.login(sUser, sPass);
		if(svo == null){
			errors.put("Pass", "登入錯誤，請重新確認");
			request.getRequestDispatcher(page)
				.forward(request, response);
		}else{
			HttpSession session = request.getSession();
			session.setAttribute("Store", svo);
			
			String path = request.getContextPath();
			response.sendRedirect(path+page);
			return;
		}
	}

}
