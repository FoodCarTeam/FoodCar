package members.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.util.HibernateUtil;
import members.model.MembersDAOHibernate;
import members.model.MembersService;
import model.MembersVO;

@WebServlet("/memberEmailCheckServlet")
public class memberEmailCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MembersService service;
	
	
    
	@Override
	public void init() throws ServletException {
		service=new MembersService(new MembersDAOHibernate(HibernateUtil.getSessionFactory()));
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Boolean result=false;
		String email=request.getParameter("mUsername");
		
		
		
		MembersVO vo=service.select1(email);
		System.out.println("vo:"+vo);
		Boolean emailCheck=email.matches("^[_a-z0-9A-Z-]+([.][_a-z0-9-]+)*@[a-z0-9-]+([.][a-z0-9-]+)*$");
		
		System.out.println("emailCheck:"+emailCheck);
//		true代表可以使用
		if(vo==null&&emailCheck){
			result=true;
		}
		
		
	System.out.println(result);
		PrintWriter pw=response.getWriter();
		pw.print(result);
		
		
	
	}

}
