package misc;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;


@WebListener
public class SessionFactoryListener implements ServletContextListener {
	@Override
	public void contextInitialized(ServletContextEvent event) {
		hibernate.util.HibernateUtil.getSessionFactory();

	}
	@Override
	public void contextDestroyed(ServletContextEvent event) {
		hibernate.util.HibernateUtil.closeSessionFactory();
	}
}
