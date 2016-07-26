package members.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import members.model.MembersService;
import model.MembersVO;

@WebServlet(urlPatterns = { "/MembersSignin" })
public class MembersSigninServlet extends HttpServlet {
	private MembersService membersservice = new MembersService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getMethod());
		doPost(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getMethod());

		String mUsername = request.getParameter("mUsername");
		String mPassword = request.getParameter("mPassword");
		String mPassword2 = request.getParameter("mPassword2");
		String mName = request.getParameter("mName");
		String mAddress = request.getParameter("mAddress");
		String mPhone = request.getParameter("mPhone");
		String mBirthdayTemp = request.getParameter("mBirthday");
//		String Members = request.getParameter("Members");

		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("error", errors);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date mBirthday=null;
		 try {
			mBirthday=sdf.parse(mBirthdayTemp);
		} catch (ParseException e) {
			e.printStackTrace();
			errors.put("mBirthday", "日期錯誤");
		}
		
		
		if(!mUsername.trim().matches("^[_a-z0-9-]+([.][_a-z0-9-]+)*@[a-z0-9-]+([.][a-z0-9-]+)*$")){
			System.out.println("email格式錯誤");
			errors.put("mUsername", "Email填寫錯誤");
		}
		

		 if(!mPhone.matches("[0-9]{4}-[0-9]{6}")) {
			 System.out.println("手機錯誤"); 
			 errors.put("mPhone", "手機填寫錯誤");
		 }      
		 
		
		if(mAddress.trim().length()==0){
			errors.put("mUsername", "地址填寫錯誤");
		}
		
		
			
		
		
		
	}
}
