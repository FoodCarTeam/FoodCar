package _20_managemaintain.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _20_managemaintain.model.ManagerService;
import model.ManagerVO;

@WebServlet("/manageLogin")
public class ManageLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ManagerService manageService = new ManagerService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String User = request.getParameter("managerUser");
		String Pass = request.getParameter("managerPass");
		Map<String, String> errors = new HashMap<String,String>();
		request.setAttribute("error", errors);
		
		if(User == null || User.trim().length() == 0){
			errors.put("managerUser", "請輸入管理者帳號");
		}
		if(Pass == null || Pass.trim().length() == 0){
			errors.put("managerPass", "請輸入管理者密碼");
		}

		String page="";
		try{
			
		}catch(Exception e){
			page="manageLogin.jsp";
			throw e;
		}finally{
			page="manage.jsp";
		}
		
		if(errors!=null || !errors.isEmpty()){
			request.getRequestDispatcher(page)
				.forward(request, response);
		}
		
		ManagerVO managevo = manageService.login(User, Pass);
		if(managevo == null){
			errors.put("Pass", "登入錯誤，請重新確認");
			request.getRequestDispatcher(page)
				.forward(request, response);
		}else{
			HttpSession session = request.getSession();
			session.setAttribute("User", managevo);
			
			String path = request.getContextPath();
			response.sendRedirect(path+page);	
			return;
		}
	}

}
