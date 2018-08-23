package dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import manager.ConncetionDAO;
import manager.HibernateUtil1;
import model.Course;
import model.ExamRegistration;
import model.SubCourse;
import model.UserInfo;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.mysql.jdbc.Connection;

public class UserInfoDAO {

	public UserInfoDAO(){
		
		try{
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public int saveCourse(Course course) {
		Transaction transaction = null;
	    Session session = null;
		try {			
			session=HibernateUtil1.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			session.saveOrUpdate(course);
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
	
	public int saveExamRegisrtation(ExamRegistration examRegistration) {
		Transaction transaction = null;
	    Session session = null;
		try {			
			session=HibernateUtil1.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			session.saveOrUpdate(examRegistration);
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
	
	public int updateCourse(Course cr) {
		Transaction transaction = null;
	    Session session = null;
		try {			
			session=HibernateUtil1.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			Course course = (Course) session.get(Course.class, cr.getCourseid());
			course.setCoursename(cr.getCoursename());
			course.setCourseparagraph1(cr.getCourseparagraph1());
			course.setSubcourselink(cr.getSubcourselink());
			session.saveOrUpdate(course);
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
	
	public int deleteObject(Object object) {
		 Transaction transaction = null;
		 Session session = null;
			try {			
				session=HibernateUtil1.getSessionFactory().openSession();		
			transaction = session.beginTransaction();
			session.delete(object);
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
	
	public List<UserInfo> login(String username,String password) {
		List<UserInfo> userlist = null;
		 Session session = null;
			try {			
				session=HibernateUtil1.getSessionFactory().openSession();
				Criteria cr = session.createCriteria(UserInfo.class);
				cr.add(Restrictions.eq("username",username));
				cr.add(Restrictions.eq("password",password));
				userlist = cr.list();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null){
        		session.flush();
        		session.close();
			}
        	}
		return userlist;
	}
	
	List<Course> courseList = new ArrayList<Course>();
	
	private String connectionUrl = "jdbc:mysql://localhost:3306/EXPDB";
	private String dbUser = "root";
	private String dbPwd = "mysql";
	private Connection conn;
	
	Statement selectStmt = null;
	
	public List<Course> listCourse() {
		 
//		 Session session = null;
		 
			try {
				
				if(courseList.size()==0)
				{
					selectStmt = ConncetionDAO.getConnection().createStatement();
					ResultSet rs = selectStmt.executeQuery("SELECT courseid,coursename,courseparagraph1,courseparagraph2,courseparagraph3,subcourselink FROM course");
		            Course course=null;
					while(rs.next())
		            {
						course = new Course();
						course.setCourseid(rs.getInt(1));
						course.setCoursename(rs.getString(2));
						course.setCourseparagraph1(rs.getString(3));
						course.setCourseparagraph2(rs.getString(4));
						course.setCourseparagraph3(rs.getString(5));
						course.setSubcourselink(rs.getString(6));
		            	courseList.add(course);
		            }
				}
				selectStmt=null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
//			if(session!=null){
//       		session.flush();
//       		session.close();
//			}
       	}
		return courseList;
	}
	
//	public List<Course> listCourse() {
//		 
//		 Session session = null;
//		 
//			try {	
//				if(courseList.size()==0)
//				{
//					session=HibernateUtil1.getSessionFactory().openSession();
//					courseList = session.createQuery("from Course").list();
//				}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			if(session!=null){
//        		session.flush();
//        		session.close();
//			}
//        	}
//		return courseList;
//	}
	
//	public List<Course> getCourseById(int id) {
//		 List<Course> courseList = null;
//		 Session session = null;
//			try {			
//				session=HibernateUtil1.getSessionFactory().openSession();
//				Criteria cr = session.createCriteria(Course.class);
//				cr.add(Restrictions.eq("courseid",id));
//				courseList = cr.list();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			if(session!=null){
//        		session.flush();
//        		session.close();
//			}
//        	}
//		return courseList;
//	}
	
	public List<Course> getCourseById(int id) {
		 List<Course> courseList = new ArrayList<Course>();
			try {			
				
				if(id!=0)
				{
					selectStmt = ConncetionDAO.getConnection().createStatement();
					ResultSet rs = selectStmt.executeQuery("SELECT courseid,coursename,courseparagraph1,courseparagraph2,courseparagraph3,subcourselink FROM course where courseid="+id+"");
					Course course=null;
					while(rs.next())
		            {
						course = new Course();
						course.setCourseid(rs.getInt(1));
						course.setCoursename(rs.getString(2));
						course.setCourseparagraph1(rs.getString(3));
						course.setCourseparagraph2(rs.getString(4));
						course.setCourseparagraph3(rs.getString(5));
						course.setSubcourselink(rs.getString(6));
						courseList.add(course);
		            }
				}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			selectStmt=null;
       	}
		return courseList;
	}
	
//	public List<SubCourse> getSubCourseByCourseidOrName(int courseId,int subcourseId,String subCourseName) {
//		 List<SubCourse> subCourseList = null;
//		 Session session = null;
//			try {			
//				session=HibernateUtil1.getSessionFactory().openSession();
//				Criteria cr = session.createCriteria(SubCourse.class);
//				if(courseId!=0){
//					cr.add(Restrictions.eq("courseid",courseId));
//				}else if(subcourseId!=0){
//					cr.add(Restrictions.eq("subcourseid",subcourseId));
//				}else if(subCourseName!=null || subCourseName!=""){
//					cr.add(Restrictions.like("subcoursename",subCourseName));
//				}
//				subCourseList = cr.list();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally {
//			if(session!=null){
//       		session.flush();
//       		session.close();
//			}
//       	}
//		return subCourseList;
//	}
	
	public List<SubCourse> getSubCourseByCourseidOrName(int courseId,int subcourseId,String subCourseName) {
		List<SubCourse> subCourseList = new ArrayList<SubCourse>();
		try
		{			
			if(subCourseName!=null)
			{
				selectStmt = ConncetionDAO.getConnection().createStatement();
				ResultSet rs = selectStmt.executeQuery("SELECT subcourseid,subcoursename,courseid,prerequisites,fasttrack,regular,fees,feesremark,online,home,centrebased,structure,paragraph1 FROM subcourse where subcoursename='"+subCourseName.trim()+"'");
				SubCourse subCourse=null;
				while(rs.next())
	            {
					subCourse = new SubCourse();
					subCourse.setCourseid(rs.getInt(1));
					subCourse.setSubcoursename(rs.getString(2));
					subCourse.setCourseid(rs.getInt(3));
					subCourse.setPrerequisites(rs.getString(4));
					subCourse.setFasttrack(rs.getString(5));
					subCourse.setRegular(rs.getString(6));
					subCourse.setFees(rs.getString(7));
					subCourse.setFasttrack(rs.getString(8));
					subCourse.setOnline(rs.getString(9));
					subCourse.setHome(rs.getString(10));
					subCourse.setCentrebased(rs.getString(11));
					subCourse.setStructure(rs.getString(12));
					subCourse.setParagraph1(rs.getString(13));
					subCourseList.add(subCourse);
	            }
			}				
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			selectStmt=null;
      	}
		return subCourseList;
	}
	
	
	public int saveObject(Object object) {
		Transaction transaction = null;
	    Session session = null;
		try {			
			session=HibernateUtil1.getSessionFactory().openSession();//getCurrentSession();// openSession();
			transaction = session.beginTransaction();
			session.saveOrUpdate(object);
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
	
	public int updateSubCourse(SubCourse sub) {
		Transaction transaction = null;
	    Session session = null;
		try {			
			session=HibernateUtil1.getSessionFactory().openSession();
			transaction = session.beginTransaction();
			SubCourse subcourse = (SubCourse) session.get(SubCourse.class, sub.getSubcourseid()); 
			subcourse.setParagraph1(sub.getParagraph1());
			subcourse.setSubcoursename(sub.getSubcoursename());
			subcourse.setPrerequisites(sub.getPrerequisites());
			subcourse.setFasttrack(sub.getFasttrack());
			subcourse.setRegular(sub.getRegular());
			subcourse.setFees(sub.getFees());
			subcourse.setFeesremark(sub.getFeesremark());
			subcourse.setOnline(sub.getOnline());
			subcourse.setHome(sub.getHome());
			subcourse.setCentrebased(sub.getCentrebased());
			subcourse.setStructure(sub.getStructure());
			session.saveOrUpdate(subcourse);
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
	
	
}
