package members.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.io.FilenameUtils;
import org.hibernate.SessionFactory;

import hibernate.util.HibernateUtil;
import members.model.MembersDAOHibernate;
import members.model.MembersService;
import model.MembersVO;

//@MultipartConfig(location="mIMG")
@MultipartConfig(location="")
@WebServlet(urlPatterns = { "/MembersSignin" })
public class MembersSigninServlet extends HttpServlet {
	private MembersService membersservice;
	private MembersService service;
	
	
	
	
	@Override
	public void init() throws ServletException {
		   
		membersservice=new MembersService(new MembersDAOHibernate(HibernateUtil.getSessionFactory()));
		service=new MembersService(new MembersDAOHibernate(HibernateUtil.getSessionFactory()));
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getMethod());
		doPost(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getMethod());
		response.setHeader("content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8"); 

		String mUsername = request.getParameter("mUsername");
		String mPassword = request.getParameter("mPassword");
		String mPassword2 = request.getParameter("mPassword2");
		String mName = request.getParameter("mName");
		String mAddress = request.getParameter("mAddress");
		String mPhone = request.getParameter("mPhone");
		String mBirthdayTemp = request.getParameter("mBirthday");
		 String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
		Part part = request.getPart("mIMG");
		System.out.println("mUsername"+mUsername);
		
		System.out.println("gRecaptchaResponse:"+gRecaptchaResponse);
		boolean verify = members.VerifyRecaptcha.VerifyRecaptcha.verify(gRecaptchaResponse);
		String header = part.getHeader("Content-Disposition");
		System.out.println(header);
		 String filename = header.substring(
                 header.indexOf("filename=\"") + 10, header.lastIndexOf("\""));
		 String saveName = System.currentTimeMillis() + "." + FilenameUtils.getExtension(filename);
		 
		 InputStream is=null;
		 OutputStream os =null;
		 	 try {
				is=part.getInputStream();
				String path=request.getServletContext().getRealPath("/");

//				System.out.println("path"+path);
				os=new FileOutputStream(path+"images/mIMG/"+saveName);

//			/Users/lanyao/Documents/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/FoodCar/images/mIMG/
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
		
		 
		 
		 
//		String Members = request.getParameter("Members");
		 	 System.out.println(mAddress);
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("error", errors);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		System.out.println("mBirthdayTemp:"+mBirthdayTemp);
		Date mBirthday=null;
		
		
		 try {
			mBirthday=sdf.parse(mBirthdayTemp);
		} catch (ParseException e) {
			e.printStackTrace();
			errors.put("mBirthday", "日期錯誤");
		}
//		System.out.println("mBirthday:"+mBirthday);
		
		if(!mUsername.trim().matches("^[_a-z0-9-]+([.][_a-z0-9-]+)*@[a-z0-9-]+([.][a-z0-9-]+)*$")){
			System.out.println("email格式錯誤");
			errors.put("mUsername", "Email填寫錯誤");
		}
		

//		 if(!mPhone.matches("[0-9]{4}-[0-9]{6}")) {
//			 System.out.println("手機錯誤"); 
//			 errors.put("mPhone", "手機填寫錯誤");
//		 }      
		 
		
		if(mAddress.trim().length()==0){
			System.out.println("mUsername錯");
			errors.put("mUsername", "地址填寫錯誤");
		}
		
		
		
		if(!mPassword.trim().equals(mPassword2.trim())){
			System.out.println("mPassword錯");
			errors.put("mPassword", "密碼錯誤");
		}
		System.out.println("verify:"+verify);
		if(!verify){
			System.out.println("verify錯");
//			errors.put("verify", "錯誤");
		}
		
		
	
		
		MembersVO vo=new MembersVO();
		if(errors.isEmpty()||errors==null){
			System.out.println("正確");
			vo.setmUsername(mUsername);
			vo.setmPassword(mPassword);
			vo.setmName(mName);
			vo.setmAddress(mAddress);
			vo.setmPhone(mPhone);
			vo.setmBirthday(new java.sql.Date(mBirthday.getTime()));
			vo.setmIMG("images/mIMG/"+saveName);
			service.insert(vo);
			
			HttpSession session=request.getSession();
			session.setAttribute("member", vo);
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
//			HttpSession session=request.getSession();
			
//			String servletPath=(String)session.getAttribute("target");
//			String queryPath=(String)session.getAttribute("query");
//			if(servletPath!=null||queryPath!=null){
//				String path = request.getContextPath();
//				
//				System.out.println("path"+path);
//				System.out.println("有target");
//				response.sendRedirect("localhost:8080"+path+servletPath+"?"+queryPath);
//				
//			}
		
		}else{
			
			System.out.println("有錯");
			request.getRequestDispatcher("SignIn.jsp").forward(request, response);
			
		}

		
		
		
	}	
		
}
