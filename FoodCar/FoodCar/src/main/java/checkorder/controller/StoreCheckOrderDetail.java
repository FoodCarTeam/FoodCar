package checkorder.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.util.HibernateUtil;
import model.OrderDetailsVO;
import model.OrdersVO;
import order.model.OrderDAOHibernate;
import order.model.OrderService;
@WebServlet("/storecheckdetail")
public class StoreCheckOrderDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	OrderService service;
	
	
	@Override
	public void init() throws ServletException {
		service=new OrderService(new OrderDAOHibernate(HibernateUtil.getSessionFactory()));
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("o");
		int oID = Integer.parseInt(id);
		OrdersVO result = service.select(oID);
		Set<OrderDetailsVO> orderdetail = result.getOrderDetailsVO();
		for(OrderDetailsVO a:orderdetail){
			a.getFoodName();
		}
		
        request.setAttribute("order", result);
		request.setAttribute("detail", orderdetail);
		request.getRequestDispatcher("/checkorderdetailstore.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		doGet(request, response);
	}

}
