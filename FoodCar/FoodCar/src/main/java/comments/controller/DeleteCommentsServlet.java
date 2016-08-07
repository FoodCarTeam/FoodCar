package comments.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import comments.model.CommentsDAO;
import comments.model.CommentsService;
import hibernate.util.HibernateUtil;

@WebServlet("/DeleteCommentsServlet")
public class DeleteCommentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommentsService service;
	
	
	
	@Override
	public void init() throws ServletException {
		service=new CommentsService(new CommentsDAO(HibernateUtil.getSessionFactory()));
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String cID=request.getParameter("cID");
//		System.out.println("刪除"+cID);
		
		Boolean result=service.delete(Integer.parseInt(cID));
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		JsonObject jo=new JsonObject();
		PrintWriter pw=response.getWriter();
		jo.addProperty("result",result);
		pw.println(jo);
	}

}
