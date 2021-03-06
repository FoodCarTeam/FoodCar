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

import StoresLogin.model.StoresLoginDAOHibernate;
import StoresLogin.model.StoresLoginService;
import hibernate.util.HibernateUtil;
import model.StoresVO;

@WebServlet(
		urlPatterns={"/Login.controller"}
		)
		
		
public class StoresLoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private StoresLoginService storesservice ;
	
	
	@Override
	public void init() throws ServletException {
		storesservice=new StoresLoginService(new StoresLoginDAOHibernate(HibernateUtil.getSessionFactory()));
	}

	@Override
	protected void doGet(HttpServletRequest request , HttpServletResponse response)throws ServletException , IOException{
		
		//接收資料
		//servlet中要存取請求所送過來的參數的寫法如下:
		String sUsername = request.getParameter("sUsername");
		String sPassword = request.getParameter("sPassword");
				
		//驗證資料
		Map<String , String>errors = new HashMap<String, String>();
		request.setAttribute("error", errors);
		if(sUsername==null && sUsername.length()==0){
			errors.put("sUsername","請輸入帳號，帳號為手機格式");
		}
		if(sPassword==null && sPassword.length()==0){
			errors.put("sPassword" , "請輸入密碼");
		}
		if(errors !=null && !errors.isEmpty()){
			request.getRequestDispatcher(
					"/login.jsp").forward(request , response);
			return;
		}

		//呼叫Model		
		StoresVO vo = storesservice.login(sUsername, sPassword);		
		
		//根據Model執行結果顯示view
		if(vo == null){
			errors.put("sPassword","登入失敗，請重新確認");
			request.getRequestDispatcher(
					"/login.jsp").forward(request,response);
		}else{
		
	    HttpSession session = request.getSession();
		session.setAttribute("store", vo);
		
		String path = request.getContextPath();
		response.sendRedirect(path+"/storeinfo.jsp");
		}		
	}
	
	@Override
	protected void doPost(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException{
		this.doGet(req, resp);
	}
	
}
