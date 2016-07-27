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
import javax.servlet.http.HttpSession;

import members.model.MembersService;
import model.MembersVO;

@WebServlet("/update.do")
public class MembersUpdatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MembersService mService = new MembersService();
	private MembersVO mvo;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String mID = request.getParameter("mID");
		String mName = request.getParameter("mName");
		String mAdd = request.getParameter("mAddress");
		String mPhone = request.getParameter("mPhone");
		String mBirth = request.getParameter("mBirthday");

		
		
		Map<String,String> ErrorMsg = new HashMap<String,String>();
		request.setAttribute("ErrMsg", ErrorMsg);
		
		if(mName == null || mName.trim().length() == 0){
			ErrorMsg.put("mName", "請輸入姓名");
		}
		if(mAdd == null || mAdd.trim().length() == 0){
			ErrorMsg.put("mAddress", "請輸入地址");
		}
		if(mBirth == null || mBirth.trim().length() == 0){
			ErrorMsg.put("mBirthday", "請輸入生日");
		}
		if(ErrorMsg!=null &&!ErrorMsg.isEmpty()){
			request.getRequestDispatcher(
					"/membermaintain.jsp").forward(request, response);
			return;
		}
		MembersVO mvo1 = mService.select(Integer.parseInt(mID));
		String a = mvo1.getmPhone();
		String b = mvo1.getmIMG();
		String c = mvo1.getmUsername();
		String d = mvo1.getmPassword();
		
		MembersVO bean = new MembersVO();
		bean.setmID(Integer.valueOf(mID));
		bean.setmName(mName);
		bean.setmAddress(mAdd);
		bean.setmPhone(mPhone);
		bean.setmBirthday(java.sql.Date.valueOf(mBirth));
		bean.setmPhone(a);
		bean.setmIMG(b);
		bean.setmUsername(c);
		bean.setmPassword(d);
		
		MembersVO mvo = mService.update(bean);
		
		if( mvo == null){
			ErrorMsg.put("Failed", "更新失敗，請重新確認");
			request.getRequestDispatcher(
					"/membermaintain.jsp").forward(request, response);		
			return;
		}else{
			HttpSession session = request.getSession();
			session.setAttribute("gotChange", mvo);
			
			String path = request.getContextPath();
			response.sendRedirect(path+"/index.jsp");
		}
		
	}
}