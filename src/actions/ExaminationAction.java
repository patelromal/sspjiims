package actions;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.ExamRegistration;

import com.opensymphony.xwork2.ActionSupport;

import dao.UserInfoDAO;

public class ExaminationAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1662066667613075235L;
	
	
	private String studentName;
	private String regRefNo;
	private String course;
	private String address;
	private Date admissionDate;
	private String branch;
	private int contactNo;
	private String email;
	private Date probableDate;
	private List<String> courseLst = new ArrayList<String>();
	
	public ExaminationAction(){
		init();
	}
	
	public void init(){
		try{
			
			
			courseLst.add("DBM");
			courseLst.add("EDEM");
			courseLst.add("PGDBM");
			courseLst.add("MBA");
			courseLst.add("EMBA");
			courseLst.add("GDM");
			courseLst.add("CCA");
			courseLst.add("CFM");
			courseLst.add("MBA 4 SEM");
			courseLst.add("PLM");
			courseLst.add("DMS");
			courseLst.add("MMS");
			courseLst.add("ADFM");
			courseLst.add("ADHRM");
			courseLst.add("ADMM");
			courseLst.add("ADBM");
			courseLst.add("ADBF");
			courseLst.add("ADRM");
			courseLst.add("ADMM");
			courseLst.add("ADFT");
			courseLst.add("MIB");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}	
	
	UserInfoDAO userInfoDAO = new UserInfoDAO();
	
	public String examRegistrationDetails(){
		
		try{
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "examdetails";
	}

	public String addExamRegistration(){
		
		try{
			int status = userInfoDAO.saveExamRegisrtation(setExamRegisterData(0));
			
			if(status==1){
				reset();
				addActionMessage("Exam Registration Done...");
			}else{
				addActionError("Fail...");
			}
			init();
		}catch(Exception e){
			e.printStackTrace();
		}
		return "success";
	}

	private ExamRegistration setExamRegisterData(int id){
		ExamRegistration examRegistration = new ExamRegistration();
		
		examRegistration.setStudentname(getStudentName());
		examRegistration.setRegrefno(getRegRefNo());
		examRegistration.setCourse(getCourse());
		examRegistration.setAddress(getAddress());
		
		examRegistration.setAdmissiondate(getAdmissionDate());
		examRegistration.setBranch(getBranch());
		examRegistration.setContactno(getContactNo());
		examRegistration.setEmail(getEmail());
		examRegistration.setProbabledate(getProbableDate());
		
		return examRegistration;
	}
	
	private void reset(){
		setStudentName(null);
		setRegRefNo(null);
		setCourse(null);
		setAddress(null);
		setAdmissionDate(null);
		setBranch(null);
		setContactNo(0);
		setEmail(null);
		setProbableDate(null);
		
	}
	
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getRegRefNo() {
		return regRefNo;
	}
	public void setRegRefNo(String regRefNo) {
		this.regRefNo = regRefNo;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getAdmissionDate() {
		return admissionDate;
	}
	public void setAdmissionDate(Date admissionDate) {
		this.admissionDate = admissionDate;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public int getContactNo() {
		return contactNo;
	}
	public void setContactNo(int contactNo) {
		this.contactNo = contactNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getProbableDate() {
		return probableDate;
	}
	public void setProbableDate(Date probableDate) {
		this.probableDate = probableDate;
	}

	public List<String> getCourseLst() {
		return courseLst;
	}

	public void setCourseLst(List<String> courseLst) {
		this.courseLst = courseLst;
	}

}
