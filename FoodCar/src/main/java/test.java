import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.io.FilenameUtils;

@MultipartConfig(location="C:/Users/Student/git/FoodCar/FoodCar/src/main/webapp/images")
@WebServlet("/test")
public class test extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part part = request.getPart("photo");
		System.out.println(part);
		System.out.println(request.getServletContext().getRealPath("/images"));
		String header = part.getHeader("Content-Disposition");
		System.out.println(header);
		 String filename = header.substring(
                 header.indexOf("filename=\"") + 10, header.lastIndexOf("\""));
		 String saveName = System.currentTimeMillis() + "." + FilenameUtils.getExtension(filename);
		 part.write(saveName);
		 
		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
