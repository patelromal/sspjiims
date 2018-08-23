package model;

import java.util.Date;

public class ExamRegistration {

	private int examregisterid;
	private String studentname;
	private String regrefno;
	private String course;
	private String address;
	private Date admissiondate;
	private String branch;
	private int contactno;
	private String email;
	private Date probabledate;
	
	public int getExamregisterid() {
		return examregisterid;
	}
	public void setExamregisterid(int examregisterid) {
		this.examregisterid = examregisterid;
	}
	public String getStudentname() {
		return studentname;
	}
	public void setStudentname(String studentname) {
		this.studentname = studentname;
	}
	public String getRegrefno() {
		return regrefno;
	}
	public void setRegrefno(String regrefno) {
		this.regrefno = regrefno;
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
	public Date getAdmissiondate() {
		return admissiondate;
	}
	public void setAdmissiondate(Date admissiondate) {
		this.admissiondate = admissiondate;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public int getContactno() {
		return contactno;
	}
	public void setContactno(int contactno) {
		this.contactno = contactno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getProbabledate() {
		return probabledate;
	}
	public void setProbabledate(Date probabledate) {
		this.probabledate = probabledate;
	}
}
