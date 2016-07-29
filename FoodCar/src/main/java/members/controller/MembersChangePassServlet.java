package members.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import members.model.MembersService;
import model.MembersVO;


@WebServlet("/change.do")
public class MembersChangePassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	private MembersService mService = new MembersService();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String mUser = request.getParameter("mUsername");
		String mPass = request.getParameter("mPassword");
		String newPass = request.getParameter("newPassword");
		String newAgain = request.getParameter("newAgain");
		
		Map<String,String> Errors = new HashMap<String, String>();
		request.setAttribute("error", Errors);
		
		if(mPass == null || mPass.trim().length() == 0){
			Errors.put("mPassword", "請輸入原密碼");
		}
		if(newPass == null || newPass.trim().length() == 0){
			Errors.put("newPassword", "請輸入新密碼");
		}
		if(newAgain == null || newAgain.trim().length() == 0){
			Errors.put("newAgain", "請再次輸入新密碼");
		}
		if(Errors!=null && !Errors.isEmpty()){
			request.getRequestDispatcher(
					"/memberinfo.jsp").forward(request, response);
			return;
		}
		
		MembersVO mvo = mService.changePass(mUser, mPass, newPass);
		if(mvo == null){
			Errors.put("changeFail", "變更失敗，請重新確認");
			request.getRequestDispatcher(
					"/memberinfo.jsp").forward(request, response);
			return;
		}else{
			HttpSession session = request.getSession();
			session.setAttribute("change", mvo);
			
			String path = request.getContextPath();
			response.sendRedirect(path+"/index.jsp");
			session.invalidate();
		}
		
	}

}
