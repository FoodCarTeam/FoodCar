package _20_managemaintain.model;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.hql.internal.ast.tree.SessionFactoryAwareNode;

import hibernate.util.HibernateUtil;
import model.ManagerVO;

public class ManagerDAOHibernate implements ManagerDAO {

	private static final String SELECT = "from ManagerVO where managerUser=?";

//	public static void main(String[] args) {
//		ManagerDAOHibernate mdaoHibernate = new ManagerDAOHibernate();
//
//		// insert
//		// ManagerVO managevo = new ManagerVO();
//		// managevo.setManagerUser("bluesky");
//		// managevo.setManagerPass("bluesky");
//		// managevo.setManagerName("藍");
//		// mdaoHibernate.insert(managevo);
//		// System.out.println(managevo);
//		
//		//select2
//		// ManagerVO managevo = new ManagerVO();
//		// managevo = mdaoHibernate.select2("johnsonweng");
//		// System.out.println(managevo);
//	}

	SessionFactory sf;
	public ManagerDAOHibernate(SessionFactory sf){
		this.sf=sf;
	}
	
	public Session getSession(){
		return sf.getCurrentSession();
	}
	
	@Override
	public ManagerVO select(Integer manageID) {
		return (ManagerVO) this.getSession().get(ManagerVO.class, manageID);
	}

	@Override
	public ManagerVO select2(String managerUser) {

			Query query = this.getSession().createQuery(SELECT);
			query.setString(0, managerUser);
			ManagerVO managevo = (ManagerVO) query.uniqueResult();
		
		return managevo;
	}

	@Override
	public ManagerVO insert(ManagerVO bean) {

			this.getSession().save(bean);
			
		return null;
	}

	@Override
	public ManagerVO update(ManagerVO bean) {
	
			this.getSession().update(bean);
		
		return null;
	}

	@Override
	public boolean delete(Integer manageID) {
			this.getSession().delete(manageID);
		return false;
	}

	@Override
	public List<ManagerVO> select() {
	
			Query query = this.getSession().createQuery("from ManagerVO");
			
		return (List<ManagerVO>)query.list();
	}
}
