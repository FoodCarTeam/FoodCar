package checkorder.controller;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.util.HibernateUtil;
import members.model.MembersDAOHibernate;
import members.model.MembersService;
import model.MembersVO;
import model.OrderDetailsVO;
import model.OrdersVO;

@WebServlet("/memberCheckOrder")
public class MemberCheckOrderServlet extends HttpServlet {
	MembersService membersService ;
	@Override
	public void init() throws ServletException {
		membersService=new MembersService(new MembersDAOHibernate(HibernateUtil.getSessionFactory()));
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		
		
		
		
		String mID = request.getParameter("m");
		int id = Integer.parseInt(mID);
		
		MembersVO result = membersService.select(id);
		Set<OrdersVO> orders = result.getOrdersVO();
		for(OrdersVO a:orders){
			System.out.println(a.getSaleDate());
		}
		
		request.setAttribute("orders", orders);
		request.getRequestDispatcher("/checkorder.jsp").forward(request, response);
		
	
		
	}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
