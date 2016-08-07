package loginFIlter;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;

import javax.persistence.Enumerated;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MembersVO;
import model.StoresVO;



@WebFilter(
		 urlPatterns={"/*"},
		 initParams={
				 @WebInitParam(name="01",value="/menu")
//				 @WebInitParam(name="02",value="/order.jsp"),
//				 @WebInitParam(name="02",value="/orderdetail.jsp")
				 
				 
				 
		 }
)
public class MemberLoginFilter implements Filter {
	Collection<String> url=new ArrayList<String>();
    public MemberLoginFilter() {
     
    }
	public void destroy() {
		
	}

	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		if((req instanceof HttpServletRequest)&&(resp instanceof HttpServletResponse)){
			HttpServletRequest request=(HttpServletRequest)req;
			HttpServletResponse response=(HttpServletResponse)resp;
			
			if(mustLog(request.getServletPath())){
				
				System.out.println("ServletPath:"+request.getServletPath());
//				System.out.println("需要登入");
				if(checkLogin(request)){
//					System.out.println("已經登入");
					chain.doFilter(request, response);
				}else{
//					System.out.println("還沒登入");
					String path=request.getServletPath();
					HttpSession session=request.getSession();
					session.setAttribute("target",path);
					session.setAttribute("query", request.getQueryString());
//					System.out.println("getQueryString:"+request.getQueryString());
//					 System.out.println("getRequestURI:"+request.getRequestURI());
					RequestDispatcher rd=request.getRequestDispatcher("/login.jsp");
					rd.forward(request, response);
				}
			}else{
//				System.out.println("不用登入");
				chain.doFilter(request, response);
			}
			
		}	
		
	}
	
	private Boolean checkLogin(HttpServletRequest request){
		HttpSession session= request.getSession();
		MembersVO mVO=null;
		StoresVO sVO=null;
		mVO=(MembersVO)session.getAttribute("member");	
		sVO=(StoresVO)session.getAttribute("store");
		
//		System.out.println("mUsernameSession:"+mVO);
//		System.out.println("userSession:"+sVO);
		if(mVO!=null||sVO!=null){
			return true;
		}else{
			return false;
		}
	}
	
	
	
	private Boolean mustLog(String ServletPath){
		
		Boolean result=false;
		for(String a:url){
//			System.out.println("a:"+a);
			if(a.endsWith("*")){
				
				a=a.substring(0,a.length()-1);
				if(a.equals(ServletPath)){
					result=true;
					break;
				}
			}else{
				if(a.equals(ServletPath)){
//					System.out.println("Filter(a):"+a);
					result=true;
					break;
				}
			}
		}
		return result;
	}

	public void init(FilterConfig fConfig) throws ServletException {
		Enumeration<String> temp=fConfig.getInitParameterNames();
		if(temp.hasMoreElements()){	
			String a=temp.nextElement();
//			System.out.println("temp:"+temp.nextElement());
			url.add(fConfig.getInitParameter(a));
		}
	}

}
