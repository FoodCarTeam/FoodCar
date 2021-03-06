package order.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;

import hibernate.util.HibernateUtil;
import members.model.MembersDAOHibernate;
import members.model.MembersService;
import model.MembersVO;
import model.OrderDetailsVO;
import model.OrdersVO;
import order.model.OrderDAOHibernate;
import order.model.OrderService;
import orderDetails.model.OrderDetailsDAOHibernate;
import orderDetails.model.OrderDetailsService;


@WebServlet("/checkout")
public class CheckOutServlet extends HttpServlet {
	OrderDetailsService serviceD ;
	OrderService service ;
	MembersService mservice ;
	
	
  
	@Override
	public void init() throws ServletException {
		
		serviceD=new OrderDetailsService(new OrderDetailsDAOHibernate(HibernateUtil.getSessionFactory()));
		service=new OrderService(new OrderDAOHibernate(HibernateUtil.getSessionFactory()));
		mservice=new MembersService(new MembersDAOHibernate(HibernateUtil.getSessionFactory()));
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");   
		OrdersVO result = new OrdersVO();
		OrderDetailsVO resultD = null;
		
		
		
		//取值
		String[] fID = request.getParameterValues("fID[]");
		String[] fQ = request.getParameterValues("fQ[]");
		String[] ptotal = request.getParameterValues("ptotal[]");
		String[] price = request.getParameterValues("price[]");
		String[] memo = request.getParameterValues("memo[]");
		String[] name = request.getParameterValues("name[]");
		String[] img = request.getParameterValues("img[]");
		String sID = request.getParameter("sID");
		String total = request.getParameter("total");
		String sName = request.getParameter("sName");
		String mID = request.getParameter("mID");
		//轉換資料
		
		
		int storeID = Integer.parseInt(sID);
		int cktotal = Integer.parseInt(total);
		int mIDi = Integer.parseInt(mID);
		MembersVO mvo = mservice.select(mIDi);
		String mName = mvo.getmName();
		//取現在時間
		Date today=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String temp=sdf.format(today);
		Date tempDate=null;
		try {
		 tempDate=sdf.parse(temp);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		result.setmID(mIDi);
		result.setsID(storeID);
		result.setSaleDate(tempDate);
		result.setAmount(cktotal);
		result.setCheckOut(1);
		result.setsName(sName);
		result.setmName(mName);
		service.insert(result);
		int oID = result.getoID();
		System.out.println("date:"+tempDate);
		System.out.println("date:"+temp);
		System.out.println(oID);
		int foodID ;
		int foodQuantity;
		int unitPrice;
		int totalPrice;
		System.out.println(fID.length);
		for(int i = 0;i<fID.length;i++){
			foodID = Integer.parseInt(fID[i]);
			foodQuantity = Integer.parseInt(fQ[i]);
			unitPrice = Integer.parseInt(price[i]);
			
			totalPrice = Integer.parseInt(ptotal[i]);
			
			resultD = new OrderDetailsVO();
			resultD.setoID(oID);
			resultD.setsID(storeID);
			resultD.setFoodID(foodID);
			resultD.setFoodQuantity(foodQuantity);
			resultD.setFoodName(name[i]);
			resultD.setUnitPrice(unitPrice);
			resultD.setTotalPrice(totalPrice);
			resultD.setmID(1);
			resultD.setOdMemo(memo[i]);
			
			serviceD.insert(resultD);
		}
		Date sDate = result.getSaleDate();
		String saleDate = sdf.format(sDate);
		Map<String, String> map = new HashMap<>();
		map.put("oID", oID+"");
		map.put("sID", sID+"");
		map.put("saleDate", saleDate);
		map.put("sName", sName);
		map.put("total", total);
		
		HttpSession session = request.getSession();
		session.setAttribute("data", map);
		session.setAttribute("name", name);
		session.setAttribute("price", price);
		session.setAttribute("fQ", fQ);
		session.setAttribute("memo", memo);
		session.setAttribute("ptotal", ptotal);
		//request.getRequestDispatcher("/orderdetail.jsp").forward(request, response);
		response.sendRedirect(request.getContextPath()+"/orderdetail.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
