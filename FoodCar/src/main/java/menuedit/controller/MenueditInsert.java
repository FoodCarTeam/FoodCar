package menuedit.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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

@MultipartConfig(location="")
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
		if(fimg.getSize()!=0){
			String header = fimg.getHeader("Content-Disposition");
			System.out.println(header);
			 String filename = header.substring(
	                 header.indexOf("filename=\"") + 10, header.lastIndexOf("\""));
			 String saveName = System.currentTimeMillis() + "." + FilenameUtils.getExtension(filename);
			 
			 InputStream is=null;
			 OutputStream os =null;
			 	 try {
					is=fimg.getInputStream();
					String path=request.getServletContext().getRealPath("/");
					System.out.println("path"+path);
					os=new FileOutputStream(path+"/images/foodIMG/"+saveName);
                     System.out.println(saveName);
//				/Users/lanyao/Documents/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/FoodCar/images/mIMG/
					byte[] buffer = new byte[1024];
					int length = -1;
					while ((length = is.read(buffer)) != -1) {
					    os.write(buffer, 0, length);
					}
				} catch (Exception e1) {
					
					e1.printStackTrace();
				}finally{
					if(os!=null){
						os.close();
					}
					if(is!=null)
					{
						is.close();
					}
				}
		vo.setFoodIMG("images/foodIMG/"+saveName);
		}
		service.insert(vo);
		
		
		response.sendRedirect(request.getContextPath()+"/menuedit?s="+s);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}

}
