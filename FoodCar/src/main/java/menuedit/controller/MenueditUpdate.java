package menuedit.controller;

import java.io.IOException;
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

@MultipartConfig(location = "C:/Users/Student/git/FoodCar/FoodCar/src/main/webapp/images/foodIMG")
@WebServlet("/MenueditUpdate")
public class MenueditUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String f = request.getParameter("f");
		String s = request.getParameter("s");
		String food = request.getParameter("food");
		String pri = request.getParameter("pri");
		Part fimg = request.getPart("fimg");
        System.out.println(fimg.getSize());
		int foodID = Integer.parseInt(f);
		int sID = Integer.parseInt(s);
		int unitPrice = Integer.parseInt(pri);
		MenusVO vo = new MenusVO();
		MenusService service = new MenusService();
		
		MenusVO select = service.selectfood(foodID);
		String foodimg = select.getFoodIMG();
		System.out.println(foodimg);
		
		vo.setFoodID(foodID);
		vo.setFoodName(food);
		vo.setKindID(10);
		vo.setsID(sID);
		vo.setStatusID(1);
		vo.setUnitPrice(unitPrice);
		if (fimg.getSize() !=0) {
			String header = fimg.getHeader("Content-Disposition");
			System.out.println(header);
			String filename = header.substring(header.indexOf("filename=\"") + 10, header.lastIndexOf("\""));
			String saveName = System.currentTimeMillis() + "." + FilenameUtils.getExtension(filename);
			vo.setFoodIMG("images/foodIMG/" + saveName);
			fimg.write(saveName);
		}else{
			vo.setFoodIMG(foodimg);
		}
		service.update(vo);
		response.sendRedirect(request.getContextPath() + "/MenueditServlet?s=" + s);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
