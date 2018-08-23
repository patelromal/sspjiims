package actions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import manager.Label;
import model.Course;
import model.SubCourse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.UserInfoDAO;

public class AdminHomeAction extends ActionSupport implements SessionAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1414911927792300681L;
	UserInfoDAO userInfoDAO = new UserInfoDAO();
	
	int courseid;
	int subcourseid;
	String coursename;
	String subcoursename;

	String updateCourseName;
	String updateCourseParagraph1;
	String updateSubCourseLink;
	int updateSelectedCourse;
	int deleteSelectedCourse;
	int deleteSelectedSubCourse;
	
	String selectedTab;
	String selectedSubTab;
	
	int selectedCourse;
	int selectedCourse1;
	int selectedDeleteCourse;
	
	int selectedSubCourse;
	int selectedDeleteSubCourse;
	
	private List<Label> courseList;
	private List<Course> courseDetailsList;
	
	private List<SubCourse> subCourseList;
	
	private List<Label> editCourseList;
	private List<Label> editSubCourseList;
	private List<Label> deleteSubCourseList;
	
	int selectedEditSubCourse;
	
	String courseparagraph1;
	String courseparagraph2;
	String courseparagraph3;
	String subcourselink;
	
	public AdminHomeAction(){
		init();
	}
	
	public String populate(){
		
		try{
			init();
		}catch(Exception e){
			
		}
		return "success";
	}
	
	public void reset(){
		setCoursename("");
		setSubcoursename("");
		setCourseparagraph1("");
		setSubcourselink("");
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
//			 map.put("courseList", "courseList");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public ArrayList<Label> getCourseURL(){
		ArrayList<Label> courseList = new ArrayList<Label>();
		UserInfoDAO userInfoDAO = new UserInfoDAO();
		
		
		try{
			
			int length=userInfoDAO.listCourse().size();
			
			for (int i = 1; i < length; i++) {
	            Course course = (Course) userInfoDAO.listCourse().get(i);
//	            if(course.getCoursename()!=null && !course.getCoursename().equals("")){
	            	courseList.add(new Label(course.getCourseid(),course.getCoursename()));
//	            }
			
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return courseList;
		
	}
	public void initForDeleteSubCourse(){
		try{
			courseList = new ArrayList<Label>();
			deleteSubCourseList = new ArrayList<Label>();
			int length=userInfoDAO.listCourse().size();
			
			for (int i = 1; i < userInfoDAO.listCourse().size(); i++) {
		            Course course = (Course) userInfoDAO.listCourse().get(i);
		            if(course.getCoursename()!=null && course.getCoursename()!=""){
		            	courseList.add(new Label(course.getCourseid(),course.getCoursename()));
		            }
			 }
		            
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	private void initSubCourse(int id){
		try{
			subCourseList = new ArrayList<SubCourse>();
			subCourseList = userInfoDAO.getSubCourseByCourseidOrName(id,0,null);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	private void initCourse(int id){
		try{
			courseDetailsList = new ArrayList<Course>();
			courseDetailsList = userInfoDAO.getCourseById(id);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public String AddCourse(){
		
		try{
			int status = userInfoDAO.saveCourse(setCourseData(0));
			
			if(status==1){
				reset();
				addActionMessage("Course Added...");
			}else{
				addActionError("Fail...");
			}
			init();
			setSelectedTab("tabs-1");
			setSelectedSubTab("tabs-1.1");
		}catch(Exception e){
			e.printStackTrace();
		}
		return "addcourse";
	}
	
	public String EditCourse(){
		
		try{
			HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get( ServletActionContext.HTTP_REQUEST);
			String courseId = request.getParameter("selectedCourseId");
			
			setSelectedTab("tabs-1");
			setSelectedSubTab("tabs-1.2");
			
			List<Course> courseList = (ArrayList<Course>) userInfoDAO.getCourseById(Integer.parseInt(courseId));
			
			for(Course course:courseList){
				setUpdateSelectedCourse(course.getCourseid());
				setUpdateCourseName(course.getCoursename());
				setUpdateCourseParagraph1(course.getCourseparagraph1());
				setUpdateSubCourseLink(course.getSubcourselink());
			}
	        
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "editcourse";
	}
	
	public String UpdateCourse(){
		
		try{
			setSelectedTab("tabs-1");
			setSelectedSubTab("tabs-1.2");
			
			Course course = new Course();
			course.setCourseid(getUpdateSelectedCourse());
			course.setCoursename(getUpdateCourseName());
			course.setCourseparagraph1(getUpdateCourseParagraph1());
			course.setSubcourselink(getUpdateSubCourseLink());
			
			int status = userInfoDAO.updateCourse(course);
			
			if(status==1){
				addActionMessage("Course Updated...");
				reset();
			}else{
				addActionError("Fail...");
			}
			init();
		}catch(Exception e){
			e.printStackTrace();
		}
		return "updatecourse";
	}
	
	public String DeleteCourse(){
		
		try{
			setSelectedTab("tabs-1");
			setSelectedSubTab("tabs-1.3");
			
			Course course = new Course();
			course.setCourseid(getSelectedDeleteCourse());
			
			int status = userInfoDAO.deleteObject(course);
			
			if(status==1){
				addActionMessage("Course Deleted...");
			}else{
				addActionError("Fail...");
			}
			init();
		}catch(Exception e){
			e.printStackTrace();
		}
		return "deletecourse";
	}
	
	public String DeleteSubCourse1(){
		
		try{
			setSelectedTab("tabs-2");
			setSelectedSubTab("tabs-2.3");
			
			HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get( ServletActionContext.HTTP_REQUEST);
			String courseId = request.getParameter("selectedCourseId");
			
			populateSubCourseForDelete(Integer.parseInt(courseId));
			setDeleteSelectedCourse(Integer.parseInt(courseId));
			
//			initForDeleteSubCourse();
//			initSubCourse(Integer.parseInt(courseId));
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "deletesubcourse";
		
	}

	public String DeleteSubCourse2(){
		
		try{
			setSelectedTab("tabs-2");
			setSelectedSubTab("tabs-2.3");
			
			SubCourse Subcourse = new SubCourse();
			Subcourse.setSubcourseid(getDeleteSelectedSubCourse());
			
			int status = userInfoDAO.deleteObject(Subcourse);
			
			if(status==1){
				addActionMessage("Sub Course Deleted...");
			}else{
				addActionError("Fail...");
			}
			init();
		}catch(Exception e){
			e.printStackTrace();
		}
		return "deletesubcourse";
	}


	private Course setCourseData(int id){
		Course course = new Course();
		course.setCourseid(id);
		course.setCoursename(getCoursename());
		course.setCourseparagraph1(getCourseparagraph1());
		course.setSubcourselink(getSubcourselink());
		return course;
	}

	
	//-------------------------------------sub course functionality----------------------------------------

	String prerequisites;
	String fasttrack;
	String regular;
	String fees;
	String feesremark;
	String online;
	String home;
	String centrebased;
	String structure;
	String paragraph1;
	
	public void populateSubCourse(int id){
		try{
			editSubCourseList = new ArrayList<Label>();
			
			List<SubCourse> SubCourseList = (ArrayList<SubCourse>) userInfoDAO.getSubCourseByCourseidOrName(id,0,null);
			
			for(SubCourse sub:SubCourseList){
				editSubCourseList.add(new Label(sub.getSubcourseid(),sub.getSubcoursename()));
			}
		            
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void populateSubCourseForDelete(int id){
		try{
			deleteSubCourseList = new ArrayList<Label>();
			
			List<SubCourse> SubCourseList = (ArrayList<SubCourse>) userInfoDAO.getSubCourseByCourseidOrName(id,0,null);
			
			for(SubCourse sub:SubCourseList){
				deleteSubCourseList.add(new Label(sub.getSubcourseid(),sub.getSubcoursename()));
			}
		            
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public String searchSubCourse(){
		try{
			
			initSubCourse(getSelectedSubCourse());
			
			setSelectedTab("tabs-2");
			setSelectedSubTab("tabs-2.1");
		}catch(Exception e){
			e.printStackTrace();
		}
		return "searchsubcourse";
	}
	
	public String AddSubCourse(){
		try{
			int status = userInfoDAO.saveObject(setSubCourseData());
			
			if(status==1){
				reset();
				addActionMessage("Sub-Course Added...");
			}else{
				addActionError("Fail...");
			}
			
			initSubCourse(getSelectedSubCourse());
			setSelectedTab("tabs-2");
			setSelectedSubTab("tabs-2.1");
		}catch(Exception e){
			e.printStackTrace();
		}
		return "addsubcourse";
	}
	
	String updateSubCourseName;
	String updatePreRequisites;
	String updateFastTrack;
	String updateRegular;
	String updateFees;
	String updateFeesRemark;
	String updateOnline;
	String updateHome;
	String updateCentreBased;
	String updateStructure;
	String updateParagraph1;
	
	public String EditSubCourse1(){
		
		try{
			HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get( ServletActionContext.HTTP_REQUEST);
			String courseId = request.getParameter("selectedCourseId");
			populateSubCourse(Integer.parseInt(courseId));
			
			initSubCourse(getSelectedSubCourse());
			setSelectedCourse1(Integer.parseInt(courseId));
			
			setSelectedTab("tabs-2");
			setSelectedSubTab("tabs-2.2");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "editsubcourse";
		
	}
	
	
	public String EditSubCourse2(){
		
		try{
			HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get( ServletActionContext.HTTP_REQUEST);
			String courseId = request.getParameter("selectedSubCourseId");
			
			
			List<SubCourse> SubCourseList = (ArrayList<SubCourse>) userInfoDAO.getSubCourseByCourseidOrName(0,Integer.parseInt(courseId),null);
			resetSubCourse();
			
			for(SubCourse subCourse:SubCourseList){
				setUpdateParagraph1(subCourse.getParagraph1());
		        setUpdateSubCourseName(subCourse.getSubcoursename());
				setSelectedSubCourse(subCourse.getSubcourseid());
				setUpdatePreRequisites(subCourse.getPrerequisites());
				setUpdateFastTrack(subCourse.getFasttrack());
				setUpdateRegular(subCourse.getRegular());
				setUpdateFees(subCourse.getFees());
				setUpdateFeesRemark(subCourse.getFeesremark());
				setUpdateOnline(subCourse.getOnline());
				setUpdateHome(subCourse.getHome());
				setUpdateCentreBased(subCourse.getCentrebased());
				setUpdateStructure(subCourse.getStructure());
				populateSubCourse(subCourse.getCourseid());
				setSelectedCourse1(subCourse.getCourseid());
			}
			
			
			setSelectedSubCourse(Integer.parseInt(courseId));
	        setSelectedTab("tabs-2");
			setSelectedSubTab("tabs-2.2");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "editsubcourse";
		
	}
	
	public String UpdateSubCourse(){
		
		try{
			int status = userInfoDAO.updateSubCourse(setSubCourseDataForUpdate());
			
			if(status==1){
				resetSubCourse();
				addActionMessage("Sub-Course Updated Successfully...");
			}else{
				addActionError("Fail...");
			}
			
//			populateSubCourse(getSelectedCourse());
//			setSelectedSubCourse(getSelectedSubCourse());
	        
			setSelectedTab("tabs-2");
			setSelectedSubTab("tabs-2.2");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "updatesubcourse";
		
	}

	public void resetSubCourse(){
		setUpdateParagraph1("");
		setUpdateSubCourseName("");
		setUpdatePreRequisites("");
		setUpdateFastTrack("");
		setUpdateRegular("");
		setUpdateFees("");
		setUpdateFeesRemark("");
		setUpdateOnline("");
		setUpdateHome("");
		setUpdateCentreBased("");
		setUpdateStructure("");
	}
	
	
	private SubCourse setSubCourseData(){
		SubCourse subcourse = new SubCourse();
		subcourse.setCourseid(getSelectedCourse());
		subcourse.setParagraph1(getParagraph1());
		subcourse.setSubcoursename(getSubcoursename());
		subcourse.setPrerequisites(getPrerequisites());
		subcourse.setFasttrack(getFasttrack());
		subcourse.setRegular(getRegular());
		subcourse.setFees(getFees());
		subcourse.setFeesremark(getFeesremark());
		subcourse.setOnline(getOnline());
		subcourse.setHome(getHome());
		subcourse.setCentrebased(getCentrebased());
		if(getStructure()!=null || getStructure()!="")
		{	
			subcourse.setStructure(getStructure().trim());
		}
		return subcourse;
	}
	
	private SubCourse setSubCourseDataForUpdate(){
		SubCourse subcourse = new SubCourse();
		subcourse.setCourseid(getSelectedCourse());
		subcourse.setParagraph1(getUpdateParagraph1());
		subcourse.setSubcourseid(getSelectedSubCourse());
		subcourse.setSubcoursename(getUpdateSubCourseName());
		subcourse.setPrerequisites(getUpdatePreRequisites());
		subcourse.setFasttrack(getUpdateFastTrack());
		subcourse.setRegular(getUpdateRegular());
		subcourse.setFees(getUpdateFees());
		subcourse.setFeesremark(getUpdateFeesRemark());
		subcourse.setOnline(getUpdateOnline());
		subcourse.setHome(getUpdateHome());
		subcourse.setCentrebased(getUpdateCentreBased());
		if(getUpdateStructure()!=null || getUpdateStructure()!="")
		{	
			subcourse.setStructure(getUpdateStructure().trim());
		}
		return subcourse;
	}
	
	public String courseDetails(){
		
		try{
			HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get( ServletActionContext.HTTP_REQUEST);
			String courseId = request.getParameter("paramCourseId");
			
			courseDetailsList = new ArrayList<Course>();
			courseDetailsList = userInfoDAO.getCourseById(Integer.parseInt(courseId));
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "coursepage";
	}

	//-----------------------------------------------------------------------------------------------------
	
	//--------------------------------Sub Course Page Details----------------------------------------------
	
	public String subCourseDetails(){
		
		try{
			HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get( ServletActionContext.HTTP_REQUEST);
			String subCourseName = request.getParameter("paramSubCourseName");
			
			subCourseList = new ArrayList<SubCourse>();
			subCourseList = userInfoDAO.getSubCourseByCourseidOrName(0,0,subCourseName);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "subcoursepage";
	}
	
	//-----------------------------------------------------------------------------------------------------
	
	
	Map<String, String> map;
	
	@Override
	public void setSession(Map map) {
		this.map = map;
	}

	public int getCourseid() {
		return courseid;
	}

	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}

	public int getSubcourseid() {
		return subcourseid;
	}

	public void setSubcourseid(int subcourseid) {
		this.subcourseid = subcourseid;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public String getSubcoursename() {
		return subcoursename;
	}

	public void setSubcoursename(String subcoursename) {
		this.subcoursename = subcoursename;
	}

	public int getSelectedCourse() {
		return selectedCourse;
	}

	public void setSelectedCourse(int selectedCourse) {
		this.selectedCourse = selectedCourse;
	}

	public List<Label> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<Label> courseList) {
		this.courseList = courseList;
	}

	public String getUpdateCourseName() {
		return updateCourseName;
	}

	public void setUpdateCourseName(String updateCourseName) {
		this.updateCourseName = updateCourseName;
	}

	public String getSelectedTab() {
		return selectedTab;
	}

	public void setSelectedTab(String selectedTab) {
		this.selectedTab = selectedTab;
	}

	public int getSelectedDeleteCourse() {
		return selectedDeleteCourse;
	}

	public void setSelectedDeleteCourse(int selectedDeleteCourse) {
		this.selectedDeleteCourse = selectedDeleteCourse;
	}

	public int getSelectedSubCourse() {
		return selectedSubCourse;
	}

	public void setSelectedSubCourse(int selectedSubCourse) {
		this.selectedSubCourse = selectedSubCourse;
	}

	public int getSelectedDeleteSubCourse() {
		return selectedDeleteSubCourse;
	}

	public void setSelectedDeleteSubCourse(int selectedDeleteSubCourse) {
		this.selectedDeleteSubCourse = selectedDeleteSubCourse;
	}

	public List<SubCourse> getSubCourseList() {
		return subCourseList;
	}

	public void setSubCourseList(List<SubCourse> subCourseList) {
		this.subCourseList = subCourseList;
	}

	public String getPrerequisites() {
		return prerequisites;
	}

	public void setPrerequisites(String prerequisites) {
		this.prerequisites = prerequisites;
	}

	public String getFasttrack() {
		return fasttrack;
	}

	public void setFasttrack(String fasttrack) {
		this.fasttrack = fasttrack;
	}

	public String getRegular() {
		return regular;
	}

	public void setRegular(String regular) {
		this.regular = regular;
	}

	public String getFees() {
		return fees;
	}

	public void setFees(String fees) {
		this.fees = fees;
	}

	public String getFeesremark() {
		return feesremark;
	}

	public void setFeesremark(String feesremark) {
		this.feesremark = feesremark;
	}

	public String getOnline() {
		return online;
	}

	public void setOnline(String online) {
		this.online = online;
	}

	public String getHome() {
		return home;
	}

	public void setHome(String home) {
		this.home = home;
	}

	public String getCentrebased() {
		return centrebased;
	}

	public void setCentrebased(String centrebased) {
		this.centrebased = centrebased;
	}

	public String getSelectedSubTab() {
		return selectedSubTab;
	}

	public void setSelectedSubTab(String selectedSubTab) {
		this.selectedSubTab = selectedSubTab;
	}

	public String getStructure() {
		return structure;
	}

	public void setStructure(String structure) {
		this.structure = structure;
	}

	public String getParagraph1() {
		return paragraph1;
	}

	public void setParagraph1(String paragraph1) {
		this.paragraph1 = paragraph1;
	}

	public List<Label> getEditSubCourseList() {
		return editSubCourseList;
	}

	public void setEditSubCourseList(List<Label> editSubCourseList) {
		this.editSubCourseList = editSubCourseList;
	}

	public List<Label> getEditCourseList() {
		return editCourseList;
	}

	public void setEditCourseList(List<Label> editCourseList) {
		this.editCourseList = editCourseList;
	}

	public int getSelectedEditSubCourse() {
		return selectedEditSubCourse;
	}

	public void setSelectedEditSubCourse(int selectedEditSubCourse) {
		this.selectedEditSubCourse = selectedEditSubCourse;
	}

	public String getUpdateFees() {
		return updateFees;
	}

	public void setUpdateFees(String updateFees) {
		this.updateFees = updateFees;
	}

	public String getUpdatePreRequisites() {
		return updatePreRequisites;
	}

	public void setUpdatePreRequisites(String updatePreRequisites) {
		this.updatePreRequisites = updatePreRequisites;
	}

	public String getUpdateFastTrack() {
		return updateFastTrack;
	}

	public void setUpdateFastTrack(String updateFastTrack) {
		this.updateFastTrack = updateFastTrack;
	}

	public String getUpdateRegular() {
		return updateRegular;
	}

	public void setUpdateRegular(String updateRegular) {
		this.updateRegular = updateRegular;
	}

	public String getUpdateFeesRemark() {
		return updateFeesRemark;
	}

	public void setUpdateFeesRemark(String updateFeesRemark) {
		this.updateFeesRemark = updateFeesRemark;
	}

	public String getUpdateOnline() {
		return updateOnline;
	}

	public void setUpdateOnline(String updateOnline) {
		this.updateOnline = updateOnline;
	}

	public String getUpdateHome() {
		return updateHome;
	}

	public void setUpdateHome(String updateHome) {
		this.updateHome = updateHome;
	}

	public String getUpdateCentreBased() {
		return updateCentreBased;
	}

	public void setUpdateCentreBased(String updateCentreBased) {
		this.updateCentreBased = updateCentreBased;
	}

	public String getUpdateStructure() {
		return updateStructure;
	}

	public void setUpdateStructure(String updateStructure) {
		this.updateStructure = updateStructure;
	}

	public String getUpdateParagraph1() {
		return updateParagraph1;
	}

	public void setUpdateParagraph1(String updateParagraph1) {
		this.updateParagraph1 = updateParagraph1;
	}

	public String getUpdateSubCourseName() {
		return updateSubCourseName;
	}

	public void setUpdateSubCourseName(String updateSubCourseName) {
		this.updateSubCourseName = updateSubCourseName;
	}

	public String getCourseparagraph1() {
		return courseparagraph1;
	}

	public void setCourseparagraph1(String courseparagraph1) {
		this.courseparagraph1 = courseparagraph1;
	}

	public String getCourseparagraph2() {
		return courseparagraph2;
	}

	public void setCourseparagraph2(String courseparagraph2) {
		this.courseparagraph2 = courseparagraph2;
	}

	public String getCourseparagraph3() {
		return courseparagraph3;
	}

	public void setCourseparagraph3(String courseparagraph3) {
		this.courseparagraph3 = courseparagraph3;
	}

	public String getSubcourselink() {
		return subcourselink;
	}

	public void setSubcourselink(String subcourselink) {
		this.subcourselink = subcourselink;
	}

	public List<Course> getCourseDetailsList() {
		return courseDetailsList;
	}

	public void setCourseDetailsList(List<Course> courseDetailsList) {
		this.courseDetailsList = courseDetailsList;
	}

	public String getUpdateCourseParagraph1() {
		return updateCourseParagraph1;
	}

	public void setUpdateCourseParagraph1(String updateCourseParagraph1) {
		this.updateCourseParagraph1 = updateCourseParagraph1;
	}

	public String getUpdateSubCourseLink() {
		return updateSubCourseLink;
	}

	public void setUpdateSubCourseLink(String updateSubCourseLink) {
		this.updateSubCourseLink = updateSubCourseLink;
	}

	public int getUpdateSelectedCourse() {
		return updateSelectedCourse;
	}

	public void setUpdateSelectedCourse(int updateSelectedCourse) {
		this.updateSelectedCourse = updateSelectedCourse;
	}

	public int getDeleteSelectedCourse() {
		return deleteSelectedCourse;
	}

	public void setDeleteSelectedCourse(int deleteSelectedCourse) {
		this.deleteSelectedCourse = deleteSelectedCourse;
	}

	public int getDeleteSelectedSubCourse() {
		return deleteSelectedSubCourse;
	}

	public void setDeleteSelectedSubCourse(int deleteSelectedSubCourse) {
		this.deleteSelectedSubCourse = deleteSelectedSubCourse;
	}

	public List<Label> getDeleteSubCourseList() {
		return deleteSubCourseList;
	}

	public int getSelectedCourse1() {
		return selectedCourse1;
	}

	public void setSelectedCourse1(int selectedCourse1) {
		this.selectedCourse1 = selectedCourse1;
	}

	public void setDeleteSubCourseList(List<Label> deleteSubCourseList) {
		this.deleteSubCourseList = deleteSubCourseList;
	}


}
