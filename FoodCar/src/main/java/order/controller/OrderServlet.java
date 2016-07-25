package order.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.OrdersVO;
import order.model.OrderService;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
	
		
		String[] foodId = request.getParameterValues("foodId[]");
		String[] foodQuan = request.getParameterValues("foodQuan[]");
		String[] foodName = request.getParameterValues("foodName[]");
		String[] foodImg = request.getParameterValues("foodImg[]");
		String[] foodPrice = request.getParameterValues("foodPrice[]");
		String sID =request.getParameter("sID");
		String sName =request.getParameter("sName");
		System.out.println("ID ="+sID);
		
	      for(int i=0; i<foodId.length; i++){
	    
//	    	  System.out.println("id = " + foodId[i]);
//	    	  System.out.println("quan = " + foodQuan[i]);
//	    	  System.out.println("name = " + foodName[i]);
//	    	  System.out.println("img = " + foodImg[i]);
//	    	  System.out.println("price = " + foodPrice[i]);
	    	  
	      }
	    HttpSession session = request.getSession();
	    
	    session.setAttribute("fID", foodId);	
	    session.setAttribute("fQ", foodQuan);
	    session.setAttribute("fName", foodName);
	    session.setAttribute("fImg", foodImg);
	    session.setAttribute("fPrice", foodPrice);
	    session.setAttribute("sID", sID);
	    session.setAttribute("sName", sName);
		//request.getRequestDispatcher("/order.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath()+"/order.jsp");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		doGet(request, response);
	}

}
