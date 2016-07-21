package _20_managemaintain.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@WebServlet("/_20_managemaintain/register.do")
public class ManageRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Map<String,String> errorMsg = new HashMap<String,String>();
		Map<String,String> msgOK = new HashMap<String,String>();
		
		HttpSession session = request.getSession();
		request.setAttribute("MsgMap", errorMsg);
		request.setAttribute("MsgOK", msgOK);
		
		String managerUser = "";
		String managerPass = "";
		String managerName = "";
		String managerPhone = "";
		Collection<Part> parts = request.getParts();
		
		if(parts!=null){
			for(Part p:parts){
				String fldName = p.getName();
				String value = request.getParameter(fldName);
				
				if(p.getContentType() == null){
					if(fldName.equalsIgnoreCase("manageUser")){
						managerUser = value;
					}else if(fldName.equalsIgnoreCase("managerPass")){
						managerPass = value;
					}else if(fldName.equalsIgnoreCase("managerName")){
						managerName = value;
					}else if(fldName.equalsIgnoreCase("managerPhone")){
						managerPhone = value;
					}
				}
			}
			if(managerUser == null || managerUser.trim().length() == 0){
				errorMsg.put("errorUSER","請輸入帳號");
			}
			if(managerPass == null || managerPass.trim().length() == 0){
				errorMsg.put("errorPASS","請輸入密碼");
			}
		}else{
			errorMsg.put("errTitle", "請確認是否已完整輸入註冊資料");
		}
		
		if(!errorMsg.isEmpty()){
			RequestDispatcher rd = request.getRequestDispatcher("managesignin.jsp");
			rd.forward(request, response);
			return;
		}
		
		doGet(request, response);
	}

}
