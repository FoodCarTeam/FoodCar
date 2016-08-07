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

import _20_managemaintain.model.ManagerDAOHibernate;
import _20_managemaintain.model.ManagerService;
import hibernate.util.HibernateUtil;
import model.ManagerVO;

@WebServlet("/manageLogin")
public class ManageLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ManagerService manageService ;
	
	
	@Override
	public void init() throws ServletException {
		manageService=new ManagerService(new ManagerDAOHibernate(HibernateUtil.getSessionFactory()));
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		HttpSession session = request.getSession();
//
//		Map<String, String> errors = new HashMap<String, String>();
//
//		request.setAttribute("error", errors);
//
//		String manageUser = request.getParameter("managerUser");
//		String managePass = request.getParameter("managerPass");
//		String rememberMe = request.getParameter("rememberMe");
//		String requestURI = (String) session.getAttribute("requestURI");
//		
//
//		if (manageUser == null || manageUser.trim().length() == 0) {
//			errors.put("AccountError", "帳號錯誤，請重新輸入。");
//		}
//		if (managePass == null || managePass.trim().length() == 0) {
//			errors.put("PasswordError", "密碼錯誤，請重新輸入。");
//		}
//
//		Cookie cookieUser = null;
//		Cookie cookiePass = null;
//		Cookie cookieRM = null;
//
//		if (rememberMe != null) {
//			cookieUser = new Cookie("manageUser", manageUser);
//			cookieUser.setMaxAge(30 * 60 * 60);
//			cookieUser.setPath(request.getContextPath());
//
//			String encodePass = DatatypeConverter.printBase64Binary(managePass.getBytes());
//			cookiePass = new Cookie("managePass", encodePass);
//			cookiePass.setMaxAge(30 * 60 * 60);
//			cookiePass.setPath(request.getContextPath());
//			cookieRM = new Cookie("rememberMe", "false");
//			cookieRM.setMaxAge(30 * 60 * 60);
//			cookieRM.setPath(request.getContextPath());
//		} else {
//			cookieUser = new Cookie("manageUser", manageUser);
//			cookieUser.setMaxAge(0);
//			cookieUser.setPath(request.getContextPath());
//
//			String encodePass = DatatypeConverter.printBase64Binary(managePass.getBytes());
//			cookiePass = new Cookie("managePass", encodePass);
//			cookiePass.setMaxAge(0);
//			cookiePass.setPath(request.getContextPath());
//			cookieRM = new Cookie("rememberMe", "false");
//			cookieRM.setMaxAge(0);
//			cookieRM.setPath(request.getContextPath());
//		}
//		response.addCookie(cookieUser);
//		response.addCookie(cookiePass);
//		response.addCookie(cookieRM);
//
//		if (!errors.isEmpty()) {
//			request.getRequestDispatcher("/manageLogin.jsp").forward(request, response);
//			return;
//		}
//
//			ManagerVO managevo = manageService.login(manageUser, managePass);
//			if (managevo != null) {
//				session.setAttribute("manageOK", managevo);
//			} else {
//				errors.put("LoginError", "帳號不存在或密碼錯誤");
//			}
//
//			
//			if(errors.isEmpty()){
//				if(requestURI!=null){
//					requestURI = (requestURI.length() ==0 ? request
//							.getContextPath():requestURI);
//					response.sendRedirect(response.encodeRedirectURL(requestURI));
//					return;
//				}else{
//					response.sendRedirect(response.encodeRedirectURL(request
//							.getContextPath()));
//					return;
//				}
//			}else{
//				request.getRequestDispatcher("manageLogin.jsp")
//					.forward(request, response);
//				return;
//			}
		
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
		
//		 String page="";
//		 try{
//		
//		 }catch(Exception e){
//		 page="manageLogin.jsp";
//		 throw e;
//		 }finally{
//		 page="index.jsp";
//		 }
		
		 if(errors!=null && !errors.isEmpty()){
		 request.getRequestDispatcher(
				 "/manageLogin.jsp").forward(request, response);
		 return;
		 }
		
		 ManagerVO managevo = manageService.login(User, Pass);	 
		 HttpSession session = request.getSession();
		 if(managevo != null){
			 session.setAttribute("LoginOK", managevo);
		 }else{
			 errors.put("LoginFail","帳號密碼有誤，請重新輸入");
		 }
		 if(errors.isEmpty()){
			 String path = request.getContextPath();
			 response.sendRedirect(path+"/manage.jsp");
			 
			 return;
		 }else{
			 request.getRequestDispatcher(
					 "/manageLogin.jsp").forward(request, response);
			 return;
		 }
	}

}
