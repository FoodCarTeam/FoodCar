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
		System.out.println("ID ="+sID);
		
	      for(int i=0; i<foodId.length; i++){
	    
//	    	  System.out.println("id = " + foodId[i]);
//	    	  System.out.println("quan = " + foodQuan[i]);
//	    	  System.out.println("name = " + foodName[i]);
//	    	  System.out.println("img = " + foodImg[i]);
//	    	  System.out.println("price = " + foodPrice[i]);
	    	  
	      }
		request.setAttribute("fID", foodId);	
		request.setAttribute("fQ", foodQuan);
		request.setAttribute("fName", foodName);
		request.setAttribute("fImg", foodImg);
		request.setAttribute("fPrice", foodPrice);
		request.setAttribute("sID", sID);
		request.getRequestDispatcher("/order.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		doGet(request, response);
	}

}
