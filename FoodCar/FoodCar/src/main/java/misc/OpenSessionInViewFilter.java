package misc;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.xml.ws.WebFault;
import hibernate.util.HibernateUtil;

@WebFilter(
		urlPatterns={"/*"}
)
public class OpenSessionInViewFilter implements Filter {
	@Override
	public void destroy() {

	}
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
//		HttpServletRequest request = (HttpServletRequest) req;
//		HttpServletResponse response = (HttpServletResponse) resp;
		try {
			System.out.println("getSessionFactory:"+HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction());
			HibernateUtil.getSessionFactory().getCurrentSession().beginTransaction();
			chain.doFilter(req, resp);
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().commit();
			
		} catch (Exception e) {
			HibernateUtil.getSessionFactory().getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
			chain.doFilter(req, resp);
		}
	}
	private FilterConfig config;
	@Override
	public void init(FilterConfig config) throws ServletException {
		this.config = config;
	}
}
