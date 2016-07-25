package checkorder.controller;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MenusVO;
import model.OrderDetailsVO;
import model.OrdersVO;
import model.StoresVO;
import stores.model.StoresService;

@WebServlet("/CheckOrder")
public class StoreCheckOrderServlet extends HttpServlet {

  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		StoresService storeService = new StoresService();
		
		String sID = request.getParameter("s");
		
		StoresVO result = storeService.select(2);
		Set<OrdersVO> orders = result.getOrdersVO();
		Set<OrderDetailsVO> orderDetails = result.getOrderDetailsVO();
		for(OrdersVO a :orders){
			System.out.println(a.getSaleDate());
		}
		for(OrderDetailsVO b :orderDetails){
			System.out.println(b.getFoodName());
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
