import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.FilenameUtils;

@MultipartConfig(location="E:/MyProject/foodCarEEIT/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/wtpwebapps/FoodCar/images")
@WebServlet("/test")
public class test extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part part = request.getPart("photo");
		String header = part.getHeader("Content-Disposition");
		 String filename = header.substring(
                 header.indexOf("filename=\"") + 10, header.lastIndexOf("\""));
		 String saveName = System.currentTimeMillis() + "." + FilenameUtils.getExtension(filename);
		 part.write(saveName);
		 
		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
