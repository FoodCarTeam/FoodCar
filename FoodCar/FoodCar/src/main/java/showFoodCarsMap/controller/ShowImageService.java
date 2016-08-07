package showFoodCarsMap.controller;


import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShowImageService {

	
	public  void showImage(HttpServletRequest request,HttpServletResponse response,String fileName){
		
		String path="//Users//lanyao//Documents//FoodCar//FoodCar//src//main//webapp//images//MapIcon//";
		String a=request.getServletContext().getRealPath("/");
//		String path=a+"//src//main//webapp//images//MapIcon//";
	System.out.println(a);
		System.out.println(request.getServletContext().getRealPath("/"));
		
		
		System.out.println(request.getServletContext().getRealPath("/"));
		
		OutputStream os = null;
		FileInputStream fis = null;
		BufferedInputStream bis=null;
		File file=new File(path+fileName);
		
		
		
		
		System.out.println(file.exists());
		
		try {
			fis=new FileInputStream(file);
			bis=new BufferedInputStream(fis);
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
		
		
//		String mimeType = request.getServletContext().getMimeType("jpg");
//		response.setContentType(mimeType);


		int count = 0;
		byte[] bytes = new byte[8192];
		
		try {
			os = response.getOutputStream();
			
			while ((count = bis.read(bytes)) != -1) {
				os.write(bytes, 0, count);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
	}
	
}
