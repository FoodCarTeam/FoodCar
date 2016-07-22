package StoresLogin.controller;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import StoresLogin.model.StoresLoginDAOHibernate;
import StoresLogin.model.StoresLoginService;
import model.StoresVO;


@WebServlet(
		urlPatterns={"/Signin.controller"}
		)
public class StoresSignInServlet extends HttpServlet{
	private StoresLoginService storesservice = new StoresLoginService();
	@Override
	protected void doGet(HttpServletRequest request ,
			HttpServletResponse response)throws ServletException , IOException{
		//接收資料
		String Username = request.getParameter("sUsername");
		String Password = request.getParameter("sPassword");
		String Name = request.getParameter("sName");
		String BossName = request.getParameter("sBossName");
		String sIntro = request.getParameter("sIntro");
		String Stores = request.getParameter("Stores");
		
		//轉換資料
		Map<String , String> errors = new HashMap<String , String>();
		request.setAttribute("error" , errors);
		//驗證資料
		if("申請".equals(Stores)){
			
		}
		
		if(errors != null && !errors.isEmpty()){
			request.getRequestDispatcher( //  "/secure/StoresSignIn.jsp"
					"/secure/StoresSignIn.jsp").forward(request, response);
			return;
		}
		
		//呼叫model , 根據Model執行結果顯示view
		StoresVO vo = new StoresVO();
		vo.setsUsername(Username);
		vo.setsPassword(Password);
		vo.setsName(Name);
		vo.setsBossName(BossName);
		vo.setsIntro(sIntro);
		
		if("申請".equals(Stores)){
			StoresVO result = storesservice.insert(vo);
			if(result == null){
				errors.put("action" , "Insertt Failed. Please try again !!");
			} else {
				request.setAttribute("insert" , result);
			}
			request.getRequestDispatcher( // "/secure/StoresSignIn.jsp"
					"/lndex/StoresSignIn.jsp").forward(request, response);;
		}
	}
	@Override
	protected void doPost(HttpServletRequest req , 
			HttpServletResponse resp) throws ServletException, IOException{
		this.doGet(req, resp);
	}
}
