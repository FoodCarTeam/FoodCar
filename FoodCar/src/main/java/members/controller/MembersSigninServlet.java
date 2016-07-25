package members.controller;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
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
		System.out.println(request.getMethod());
		doPost(request, response);
		
	}
	@Override
	protected void doPost(HttpServletRequest request , 
			HttpServletResponse response) throws ServletException, IOException{
		System.out.println(request.getMethod());
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
				
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
				java.util.Date date = null;
				try {
					date = sdf.parse(mBirthday);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				java.sql.Date ds = new java.sql.Date(date.getTime());
				vo.setmBirthday(ds);
				
				if("申請".equals(Members)){
					MembersVO result = membersservice.insert(vo);
					if(result == null){
						errors.put("action" , "Insertt Failed. Please try again !!");
					} else {
						request.setAttribute("insert" , result);
						String path = request.getContextPath();
						response.sendRedirect(path+"/login.jsp");
								
					}
					
				}
	}
}
