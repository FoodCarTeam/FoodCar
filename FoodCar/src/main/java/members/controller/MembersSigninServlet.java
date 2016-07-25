package members.controller;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import members.model.MembersService;
import model.MembersVO;


@WebServlet(
		urlPatterns={"/MembersSignin"}
		)
public class MembersSigninServlet extends HttpServlet{
	private MembersService membersservice = new MembersService();
	@Override
	protected void doGet(HttpServletRequest request ,
			HttpServletResponse response)throws ServletException , IOException{
		//接收資料
		String mUsername = request.getParameter("mUsername");
		String mPassword = request.getParameter("mPassword");
		String mName = request.getParameter("mName");
		String mAddress = request.getParameter("mAddress");
		String mPhone = request.getParameter("mPhone");			
		String mBirthday = request.getParameter("mBirthday");	
		String Members = request.getParameter("Members");
		
		//轉換資料
		Map<String , String> errors = new HashMap<String , String>();
		request.setAttribute("error" , errors);
		//驗證資料
		if("申請".equals(Members)){
			
		}
		
		if(errors != null && !errors.isEmpty()){
			request.getRequestDispatcher( //  "/secure/StoresSignIn.jsp"
					"/SignIn.jsp").forward(request, response);
			return;
		}
		
		//呼叫model , 根據Model執行結果顯示view
		MembersVO vo = new MembersVO();
		vo.setmUsername(mUsername);
		vo.setmPassword(mPassword);
		vo.setmName(mName);
		vo.setmPhone(mPhone);
		vo.setmAddress(mAddress);
		
		Date date = new Date(0);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String temp = sdf.format(date);
		vo.setmBirthday(date);
		
		if("申請".equals(Members)){
			MembersVO result = membersservice.insert(vo);
			if(result == null){
				errors.put("action" , "Insertt Failed. Please try again !!");
			} else {
				request.setAttribute("insert" , result);
			}
			request.getRequestDispatcher( // "/secure/StoresSignIn.jsp"
					"/login.jsp").forward(request, response);;
		}
	}
	@Override
	protected void doPost(HttpServletRequest req , 
			HttpServletResponse resp) throws ServletException, IOException{
		this.doGet(req, resp);
	}
}
