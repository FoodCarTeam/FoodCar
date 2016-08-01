package members.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import model.MembersVO;
import members.model.MembersDAO;
import members.model.MembersService;

@WebServlet("/Login")
public class MembersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MembersService membersService = new MembersService();
			
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//接收資料
				String mUsername = request.getParameter("mUsername");
				String mPassword = request.getParameter("mPassword");
				
				String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
				System.out.println("gRecaptchaResponse:"+gRecaptchaResponse);
				
//				System.out.println("gRecaptchaResponse:"+gRecaptchaResponse);
				boolean verify = members.VerifyRecaptcha.VerifyRecaptcha.verify(gRecaptchaResponse);
//				System.out.println("verify:"+verify);
				
				
		//驗證資料
				Map<String, String> errors = new HashMap<String, String>();
				request.setAttribute("error", errors);

				if(mUsername==null || mUsername.length()==0) {
					errors.put("mUsername", "請輸入信箱");
				}
				if(mPassword==null || mPassword.length()==0) {
					errors.put("mPassword", "請輸入密碼");
				}
				
//				if(!verify){
//					errors.put("verify", "錯誤");
//				}
				
				
				
				
		//呼叫Model
				MembersVO vo = membersService.login(mUsername, mPassword);
		//根據Model執行結果顯示View
				if(vo==null) {
					errors.put("mPassword", "Login failed, please try again.");
					request.getRequestDispatcher("/login.jsp").forward(request, response);
					
				} else {
					HttpSession session = request.getSession();
					session.setAttribute("member", vo);
					
//					String servletPath=(String)session.getAttribute("target");
//					String queryPath=(String)session.getAttribute("query");
					String path = request.getContextPath();
//					if(servletPath!=null||queryPath!=null){
//						System.out.println("path:"+path+servletPath+"?"+queryPath);
//						
//						response.sendRedirect("localhost:8080"+path+servletPath+"?"+queryPath);
//						System.out.println("測試localhost:8080"+path+servletPath+"?"+queryPath);
////						request.getRequestDispatcher(servletPath+"?"+queryPath).forward(request, response);
//						return;
//					}else{
//						
//					}

					System.out.println("path"+path);

					response.sendRedirect(path+"/stores.jsp");
					return ;
				}
				
				
				
				
	}

}
