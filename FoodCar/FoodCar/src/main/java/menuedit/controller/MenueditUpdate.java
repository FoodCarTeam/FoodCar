package menuedit.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.FilenameUtils;

import hibernate.util.HibernateUtil;
import menus.model.MenusDAOHibernate;
import menus.model.MenusService;
import model.MenusVO;

@MultipartConfig(location = "")
@WebServlet("/MenueditUpdate")
public class MenueditUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MenusService service ;
	
	
	
	@Override
	public void init() throws ServletException {
		service=new MenusService(new MenusDAOHibernate(HibernateUtil.getSessionFactory()));
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String f = request.getParameter("f");
		String s = request.getParameter("s");
		String food = request.getParameter("food");
		String pri = request.getParameter("pri");
		String sell = request.getParameter("sell");
		System.out.println(sell);
		Part fimg = request.getPart("fimg");
        System.out.println(fimg.getSize());
		int foodID = Integer.parseInt(f);
		int sID = Integer.parseInt(s);
		int unitPrice = Integer.parseInt(pri);
		MenusVO vo = new MenusVO();
		
		
		MenusVO select = service.selectfood(foodID);
		String foodimg = select.getFoodIMG();
		System.out.println(foodimg);
		
		vo.setFoodID(foodID);
		vo.setFoodName(food);
		vo.setKindID(10);
		vo.setsID(sID);
		if(sell.equals("有貨")){
		    vo.setStatusID(1);
		}else{
			vo.setStatusID(2);
		}
		vo.setUnitPrice(unitPrice);
		if (fimg.getSize() !=0) {
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
			vo.setFoodIMG("images/foodIMG/" + saveName);
		}else{
			vo.setFoodIMG(foodimg);
		}
		service.update(vo);
		response.sendRedirect(request.getContextPath() + "/menuedit?s=" + s);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
