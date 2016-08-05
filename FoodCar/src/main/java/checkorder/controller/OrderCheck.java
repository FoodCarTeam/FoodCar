package checkorder.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.util.HibernateUtil;
import model.OrdersVO;
import order.model.OrderDAOHibernate;
import order.model.OrderService;

@WebServlet("/ordercheck")
public class OrderCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 OrderService service;
	
	
	
	
	@Override
	public void init() throws ServletException {
		service=new OrderService(new OrderDAOHibernate(HibernateUtil.getSessionFactory()));
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.setHeader("content-type", "text/html;charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    String o = request.getParameter("o");
	    String checkout1 = request.getParameter("ck");
	    int oID = Integer.parseInt(o);
	    int checkout = Integer.parseInt(checkout1);
	    OrdersVO vo =new OrdersVO();
	   
	    OrdersVO result = service.select(oID);
	    vo.setoID(oID);
	    vo.setsID(result.getsID());
	    vo.setmID(result.getmID());
	    vo.setsName(result.getsName());
	    vo.setmName(result.getmName());
	    vo.setAmount(result.getAmount());
	    vo.setSaleDate(result.getSaleDate());
	    vo.setCheckOut(checkout);
	    service.update(vo);
	    
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
