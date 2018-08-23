package dao;

import java.util.List;

import manager.HibernateUtil1;
import model.OnlineApplication;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class OnlineApplicationDAO {

	public OnlineApplicationDAO(){
		
	}
	
	public int saveOnlineApplication(OnlineApplication onlineApplication) {
		Transaction transaction = null;
	    Session session = null;
		try {			
			session=HibernateUtil1.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			session.saveOrUpdate(onlineApplication);
			session.getTransaction().commit();			
			return 1;
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();            
			}
				e.printStackTrace();
		}finally {
				if(session!=null){
            		session.flush();
            		session.close();
				}
        	}
		return 2;
	}
	
	public List<OnlineApplication> getAppList() {
		 List<OnlineApplication> appList = null;
		 Session session = null;
			try {			
				session=HibernateUtil1.getSessionFactory().openSession();
				appList = session.createQuery("from OnlineApplication").list();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null){
       		session.flush();
       		session.close();
			}
       	}
		return appList;
	}
	
	
}
