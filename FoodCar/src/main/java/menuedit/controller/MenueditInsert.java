package menuedit.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.FilenameUtils;

import menus.model.MenusService;
import model.MenusVO;
import model.StoresVO;
import stores.model.StoresService;

@MultipartConfig(location="C:/Users/Student/git/FoodCar/FoodCar/src/main/webapp/images/foodIMG")
@WebServlet("/MenueditInsert")
public class MenueditInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");  
		String food = request.getParameter("food");
		String price = request.getParameter("inpri");
		String s = request.getParameter("s");
		Part fimg = request.getPart("fimg");
		
		String header = fimg.getHeader("Content-Disposition");
		System.out.println(header);
		 String filename = header.substring(
                 header.indexOf("filename=\"") + 10, header.lastIndexOf("\""));
		 String saveName = System.currentTimeMillis() + "." + FilenameUtils.getExtension(filename);
		 
		 
		System.out.println(food);
		System.out.println(price);
		int unitPrice = Integer.parseInt(price);
		int sID = Integer.parseInt(s);
		MenusVO vo = new MenusVO();
		MenusService  service = new MenusService();
		
		vo.setFoodName(food);
		vo.setKindID(10);
		vo.setsID(sID);
		vo.setUnitPrice(unitPrice);
		vo.setStatusID(1);
		vo.setFoodIMG("images/foodIMG/"+saveName);
		service.insert(vo);
		fimg.write(saveName);
		
		response.sendRedirect(request.getContextPath()+"/MenueditServlet?s="+s);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
