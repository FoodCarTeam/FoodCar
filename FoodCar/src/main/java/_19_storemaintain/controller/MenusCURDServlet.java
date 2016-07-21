package _19_storemaintain.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _19_storemaintain.model.MenusService;
import model.MenusVO;


@WebServlet("/MenusServlet")
public class MenusCURDServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private MenusService ms = new MenusService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//接收
		String temp1 = request.getParameter("foodID");
		String foodname = request.getParameter("foodName");
		String temp2 = request.getParameter("sID");
		String temp3 = request.getParameter("kindID");
		String temp4 = request.getParameter("statusID");
		String temp5 = request.getParameter("unitPrice");
		
		String prodaction = request.getParameter("prodaction");
		
		//轉換
		Map<String , String>errors = new HashMap<String , String>();
		request.setAttribute("error", errors);
		
		int foodID = 0;
		if(temp1!=null && temp1.trim().length()!=0){
			try{
				foodID = Integer.parseInt(temp1);
			}catch(NumberFormatException e){
				errors.put("foodID", "請輸入餐點的數字編號");
			}
		}	
		int sID = 0;
		if(temp2!=null && temp2.trim().length()!=0){
			try{
				sID = Integer.parseInt(temp2);
			}catch(NumberFormatException e){
				errors.put("sID", "請輸入店家數字編號");
			}
		}	
		int kindID = 0;
		if(temp3!=null && temp3.trim().length()!=0){
			try{
				kindID = Integer.parseInt(temp3);
			}catch(NumberFormatException e){
				errors.put("kindID", "請輸入菜單類別編號(10：單點、20：套餐)");
			}
		}	
		int statusID = 0;
		if(temp4!=null && temp4.trim().length()!=0){
			try{
				statusID = Integer.parseInt(temp4);
			}catch(NumberFormatException e){
				errors.put("statusID", "請輸入餐點狀態編號(1：正常、2：缺貨、3：補貨中)");
			}
		}	
		Integer unitPrice = 0;
		if(temp5!=null && temp5.trim().length()!=0){
			try{
				unitPrice = Integer.parseInt(temp5);
			}catch(NumberFormatException e){
				errors.put("unitPrice", "請輸入價格");
			}
		}
		
		//驗證
		if("Insert".equals(prodaction) || "Update".equals(prodaction)
				|| "Delete".equals(prodaction)){
			if(temp1==null || temp1.trim().length()==0){
				errors.put("foodID", "請輸入餐點編號以便執行" + prodaction) ;
			}
		}
		if(errors!=null && !errors.isEmpty()){
			request.getRequestDispatcher(
					"/pages/product.jsp").forward(request, response);
			return;
		}
		
		//呼叫、顯示
		MenusVO mvo = new MenusVO();
		mvo.setFoodID(foodID);
		mvo.setFoodName(foodname);
		mvo.setsID(sID);
		mvo.setKindID(kindID);
		mvo.setStatusID(statusID);
		mvo.setUnitPrice(unitPrice);
		if("Select".equals(prodaction)){
			List<MenusVO> result = ms.findByKey(mvo);
			request.setAttribute("select", result);
			request.getRequestDispatcher(
					"/pages/display.jsp").forward(request, response);;
		}else if("Insert".equals(prodaction)){
			MenusVO result = ms.insert(mvo);
			if(result == null){
				errors.put("action", "新增失敗，請重新嘗試。");
			}else{
				request.setAttribute("insert", result);
			}
			request.getRequestDispatcher(
					"/pages/").forward(request, response);
		}else if("Update".equals(prodaction)){
			MenusVO result = ms.update(mvo);
			if(result==null){
				errors.put("action","更新失敗，請重新嘗試。");
			}
			request.getRequestDispatcher(
					"").forward(request, response);
		}else if("Delete".equals(prodaction)){
			boolean result = ms.delete(mvo);
			request.setAttribute("delete", result);
			request.getRequestDispatcher(
					"").forward(request, response);
		}else{
			errors.put("action", "Unknown action : "+prodaction);
			request.getRequestDispatcher(
					"").forward(request, response);
		}
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
