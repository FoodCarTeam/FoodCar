package showFoodCarsMap.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ifreamServletURL")
public class ifreamServletURL extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	StringBuffer url;
	
	String sID;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 	sID=request.getParameter("sID");
//			System.out.println("接收sID:"+sID);
			
			
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			PrintWriter pw=response.getWriter();
		
			pw.print(sID);
	}
}
