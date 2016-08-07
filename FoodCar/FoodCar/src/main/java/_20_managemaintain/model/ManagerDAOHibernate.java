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
		ManagerVO managevo = null;
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
			managevo = (ManagerVO) session.get(ManagerVO.class, manageID);
		return managevo;
	}

	@Override
	public ManagerVO select2(String managerUser) {
		ManagerVO managevo = null;
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
			Query query = session.createQuery(SELECT);
			query.setString(0, managerUser);
			managevo = (ManagerVO) query.uniqueResult();
		return managevo;
	}

	@Override
	public ManagerVO insert(ManagerVO bean) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
			session.save(bean);
		return null;
	}

	@Override
	public ManagerVO update(ManagerVO bean) {
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
			session.update(bean);
		return null;
	}

	@Override
	public boolean delete(Integer manageID) {
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
			ManagerVO managevo = new ManagerVO();
			managevo.setManageID(manageID);
			session.delete(manageID);


		return false;
	}

	@Override
	public List<ManagerVO> select() {
		List<ManagerVO> list = null;
//		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Session session=getSession();
			Query query = session.createQuery("from ManagerVO");
			list = query.list();
		return list;
	}
}
