package checkorder.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import members.model.MembersService;
import model.MembersVO;
import model.MenusVO;
import model.OrderDetailsVO;
import model.OrdersVO;
import model.StoresVO;
import stores.model.StoresService;

@WebServlet("/storecheckorder")
public class StoreCheckOrderServlet extends HttpServlet {

  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		StoresService storeService = new StoresService();
		MembersService memberservice = new MembersService();
		String s = request.getParameter("s");
		int sID = Integer.parseInt(s);
		StoresVO result = storeService.select(sID);
		Set<OrdersVO> orders = result.getOrdersVO();
		
		request.setAttribute("orders", orders);
		request.getRequestDispatcher("/checkorderstore.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
