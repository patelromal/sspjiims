package actions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import manager.Label;
import model.Course;
import model.UserInfo;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.UserInfoDAO;

public class LoginAction extends ActionSupport implements SessionAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1414911927792300681L;
	private String username;
	private String password;
	UserInfoDAO userInfoDAO = new UserInfoDAO();
	AdminHomeAction adminHomeAction = new AdminHomeAction();
	
	private List<Label> courseList;
	private List<Label> editSubCourseList;
	private List<Label> deleteSubCourseList;
	public LoginAction(){
		
	}
	
	public void init(){
		try{
			courseList = new ArrayList<Label>();
			editSubCourseList = new ArrayList<Label>();
			deleteSubCourseList = new ArrayList<Label>();
			
			 for (int i = 1; i < userInfoDAO.listCourse().size(); i++) {
		            Course course = (Course) userInfoDAO.listCourse().get(i);
		            if(course.getCoursename()!=null && course.getCoursename()!=""){
		            	courseList.add(new Label(course.getCourseid(),course.getCoursename()));
		            }
			 }
			 Map session = ActionContext.getContext().getSession();
			 session.put("courseList", courseList);       
			 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
@SuppressWarnings("unchecked")
public String Login(){
		
		try{
			List<UserInfo> userlist=null;
			
			if(getUsername()!=null && getUsername().equalsIgnoreCase("admin")){
				userlist= (ArrayList<UserInfo>) userInfoDAO.login(getUsername(),getPassword());
				if(userlist.size()==1){		
					this.map.put("sessionLogin", "true");
					ActionContext.getContext().getSession().put("username", getUsername());
					init();
					return "admin";
				}else{
					addActionError("Invalid log in. Please try again with correct login id and password.");
					return "fail";
				}
			}else{
				userlist= (ArrayList<UserInfo>) userInfoDAO.login(getUsername(),getPassword());
				if(userlist.size()==1){		
					this.map.put("sessionLogin", "true");
					ActionContext.getContext().getSession().put("username", getUsername());
					return "student";
				}else{
					addActionError("Invalid log in. Please try again with correct login id and password.");
					return "fail";
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "fail";
		
}
	Map<String, String> map;
	
	@Override
	public void setSession(Map map) {
		this.map = map;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Label> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<Label> courseList) {
		this.courseList = courseList;
	}

	public List<Label> getEditSubCourseList() {
		return editSubCourseList;
	}

	public void setEditSubCourseList(List<Label> editSubCourseList) {
		this.editSubCourseList = editSubCourseList;
	}

	public List<Label> getDeleteSubCourseList() {
		return deleteSubCourseList;
	}

	public void setDeleteSubCourseList(List<Label> deleteSubCourseList) {
		this.deleteSubCourseList = deleteSubCourseList;
	}

}
