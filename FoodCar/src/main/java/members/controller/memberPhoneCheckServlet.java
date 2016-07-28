package members.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import members.model.MembersService;
import model.MembersVO;

@WebServlet("/memberPhoneCheckServlet")
public class memberPhoneCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String mPhone=request.getParameter("mPhone");
		MembersService service=new MembersService();
		MembersVO vo=service.select_mPhone(mPhone);
		PrintWriter pw=response.getWriter();
		Boolean result=false;
//		System.out.println("vo"+vo);
//		System.out.println("mPhone"+mPhone.matches("[0-9]{10}"));
		if(vo==null&&mPhone.matches("[0-9]{10}")){
			result=true;
		}
		pw.println(result);
		
//		doGet(request, response);
	}

}
