package actions;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.ExamRegistration;
import model.OnlineApplication;

import com.opensymphony.xwork2.ActionSupport;

import dao.OnlineApplicationDAO;
import dao.UserInfoDAO;

public class OnlineApplicationAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1662066667613075235L;
	
	private List<String> courseLst = new ArrayList<String>();
	private List<String> specializationList = new ArrayList<String>();
	private List<String> monthList = new ArrayList<String>();
	private List<String> yearList = new ArrayList<String>();
	
	private String course;
	private String specialization;
	private String lastName;
	private String firstName;
	private String middleName;
	private String fatherLast;
	private String fatherFirst;
	private String fatherMiddle;
	private String addForCorres;
	private String permanentAddress;
	private Date admissionDate;
	private String gender;
	private String nationality;
	private String teleResidence;
	private String teleOffice;
	private String mobile;
	private String email;
	
	private String degree1;
	private String collage1;
	private String examMonth1;
	private String examYear1;
	private String subjects1;
	private String results1;
	
	private String degree2;
	private String collage2;
	private String examMonth2;
	private String examYear2;
	private String subjects2;
	private String results2;
	
	private String degree3;
	private String collage3;
	private String examMonth3;
	private String examYear3;
	private String subjects3;
	private String results3;
	
	private String degree4;
	private String collage4;
	private String examMonth4;
	private String examYear4;
	private String subjects4;
	private String results4;
	
	private String degree5;
	private String collage5;
	private String examMonth5;
	private String examYear5;
	private String subjects5;
	private String results5;
	
	private String experienceA;
	private String experienceB;
	private String experienceC;
	private String experienceD;
	private String experienceE;
	private String experienceF;
	
	private String examOption;
	private String fees;
	
	List<OnlineApplication> onlineAppList;
	
	public OnlineApplicationAction(){
		init();
	}
	
	public void init(){
		try{
			addCourse();
			addSpecialization();
			addMonth();
			addYear();
			setExamOption("From Home");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}	
	OnlineApplicationDAO OnlineapplicationDAO = new OnlineApplicationDAO();
	
	public String onlineApplicationDetails(){
		
		onlineAppList = new ArrayList<OnlineApplication>();
		
		try{
			
			onlineAppList = OnlineapplicationDAO.getAppList();
			
			return "appdetails";
		}catch(Exception e){
			e.printStackTrace();
		}
		return "";
	}

	public String submitApplication(){
		
		try{
			
			int status = OnlineapplicationDAO.saveOnlineApplication(setOnlineApplicationData(0));
			
			if(status==1){
				reset();
				addActionMessage("Online Application submmited succesfully...");
			}else{
				addActionError("Fail...");
			}
			init();
			
			return "success";
		}catch(Exception e){
			e.printStackTrace();
		}
		return "";
	}
	
	private OnlineApplication setOnlineApplicationData(int id){
		OnlineApplication Onlineapplication = new OnlineApplication();
		
		Onlineapplication.setCourse(getCourse());
		Onlineapplication.setSpecialization(getSpecialization());
		Onlineapplication.setLastName(getLastName());
		Onlineapplication.setFirstName(getFirstName());
		Onlineapplication.setMiddleName(getMiddleName());
		Onlineapplication.setFatherLast(getFatherLast());
		Onlineapplication.setFatherFirst(getFatherFirst());
		Onlineapplication.setFatherMiddle(getFatherMiddle());
		Onlineapplication.setAddForCorres(getAddForCorres());
		Onlineapplication.setPermanentAddress(getPermanentAddress());
		Onlineapplication.setAdmissionDate(getAdmissionDate());
		Onlineapplication.setGender(getGender());
		Onlineapplication.setNationality(getNationality());
		Onlineapplication.setTeleResidence(getTeleResidence());
		Onlineapplication.setTeleOffice(getTeleOffice());
		Onlineapplication.setMobile(getMobile());
		Onlineapplication.setEmail(getEmail());
			
		Onlineapplication.setDegree1(getDegree1());
		Onlineapplication.setCollage1(getCollage1());
		Onlineapplication.setExamMonth1(getExamMonth1());
		Onlineapplication.setExamYear1(getExamYear1());
		Onlineapplication.setSubjects1(getSubjects1());
		Onlineapplication.setResults1(getResults1());
		
		Onlineapplication.setDegree2(getDegree2());
		Onlineapplication.setCollage2(getCollage2());
		Onlineapplication.setExamMonth2(getExamMonth2());
		Onlineapplication.setExamYear2(getExamYear2());
		Onlineapplication.setSubjects2(getSubjects2());
		Onlineapplication.setResults2(getResults2());
		
		Onlineapplication.setDegree3(getDegree3());
		Onlineapplication.setCollage3(getCollage3());
		Onlineapplication.setExamMonth3(getExamMonth3());
		Onlineapplication.setExamYear3(getExamYear3());
		Onlineapplication.setSubjects3(getSubjects3());
		Onlineapplication.setResults3(getResults3());
		
		Onlineapplication.setDegree4(getDegree4());
		Onlineapplication.setCollage4(getCollage4());
		Onlineapplication.setExamMonth4(getExamMonth4());
		Onlineapplication.setExamYear4(getExamYear4());
		Onlineapplication.setSubjects4(getSubjects4());
		Onlineapplication.setResults4(getResults4());
		
		Onlineapplication.setDegree5(getDegree5());
		Onlineapplication.setCollage5(getCollage5());
		Onlineapplication.setExamMonth5(getExamMonth5());
		Onlineapplication.setExamYear5(getExamYear5());
		Onlineapplication.setSubjects5(getSubjects5());
		Onlineapplication.setResults5(getResults5());
		
		Onlineapplication.setExperienceA(getExperienceA());
		Onlineapplication.setExperienceB(getExperienceB());
		Onlineapplication.setExperienceC(getExperienceC());
		Onlineapplication.setExperienceD(getExperienceD());
		Onlineapplication.setExperienceE(getExperienceE());
		Onlineapplication.setExperienceF(getExperienceF());
		
		Onlineapplication.setExamOption(getExamOption());
		Onlineapplication.setFees(getFees());
		
		
		return Onlineapplication;
	}
	
	private void addCourse(){
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
	}
	private void addMonth(){
		monthList.add("MM");
		try{
			for(int i=1;i<=12;i++){
				monthList.add(String.valueOf(i));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	private void addYear(){
		SimpleDateFormat df = new SimpleDateFormat("yyyy");
		String yr = df.format(new Date());
		int year=Integer.parseInt(yr);
		
		yearList.add("YY");
		try{
			for(int i=1940;i<=year+5;i++) 				
			{	
				yearList.add(String.valueOf(i));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	private void addSpecialization(){
		specializationList.add("Advertising Management");
        specializationList.add("Communication Management");
        specializationList.add("Information Management");
        specializationList.add("Mass Communication");
        specializationList.add("Media Management");
        specializationList.add("Portfolio Management");
        specializationList.add("Public Relationship Management");
        specializationList.add("Telecom Management");
        specializationList.add("Architectural Management");
        specializationList.add("Construction Management");
        specializationList.add("Interior Management");
        specializationList.add("Banking Management");
        specializationList.add("Foreign Exchange Management");
        specializationList.add("Asset Management ");
        specializationList.add("Mutual Fund Management");
        specializationList.add("Finance Management");
        specializationList.add("Investment Analysis Management");
        specializationList.add("Risk and Insurance Management");
        specializationList.add("Taxation Management");
        specializationList.add("Investment Management");
        specializationList.add("International Finance Management");
        specializationList.add("Takeover and Acquisition Management");
        specializationList.add("Corporate and Finance Management");
        specializationList.add("Equity Research Management");
        specializationList.add("Treasury Management");
        specializationList.add("Audit Management");
        specializationList.add("Chartered Finance Management");
        specializationList.add("Cost and Management Accounting");
        specializationList.add("Market Risk Management");
        specializationList.add("Contemporary Auditing");
        specializationList.add("Equality Research Management");
        specializationList.add("BPO Management");
        specializationList.add("Customer Relationship Management");
        specializationList.add("Customer Care Management");
        specializationList.add("Call center Management");
        specializationList.add("Marketing Management");
        specializationList.add("Consumer Management");
        specializationList.add("International Management");
        specializationList.add("Sales Management");
        specializationList.add("Export Management");
        specializationList.add("International Trade");
        specializationList.add("Foreign Trade");
        specializationList.add("Industrial Marketing");
        specializationList.add("Retail Management");
        specializationList.add("Business Marketing");
        specializationList.add("Marketing Finance Management");
        specializationList.add("Pharmacology Management");
        specializationList.add("Bio-Technology Management");
        specializationList.add("Hospital Administration");
        specializationList.add("Health Care Management");
        specializationList.add("Pathology Lab Management");
        specializationList.add("Clinical Pharmacology");
        specializationList.add("Clinical Research");
        specializationList.add("Holistic Management");
        specializationList.add("Hospital Management");
        specializationList.add("General Management");
        specializationList.add("Business Administration");
        specializationList.add("Co-operative Management");
        specializationList.add("Hotel Management");
        specializationList.add("Hospitality Management");
        specializationList.add("Travel and Tourism Management");
        specializationList.add("Transport Management");
        specializationList.add("Material Management");
        specializationList.add("Supply chain Management");
        specializationList.add("Logistics Management");
        specializationList.add("Total Quality Management");
        specializationList.add("Software Project Management");
        specializationList.add("SAP Consultancy Management");
        specializationList.add("Software Management");
        specializationList.add("Information Technology");
        specializationList.add("E-Business System");
        specializationList.add("Cyber Law Management");
        specializationList.add("Hardware Management");
        specializationList.add("E-commerce");
        specializationList.add("Networking Management");
        specializationList.add("Purchasing Management");
        specializationList.add("Fashion Management");
        specializationList.add("Textile ManagementHuman Resource Management");
        specializationList.add("Personal Management");
        specializationList.add("Public Administration");
        specializationList.add("Corporate Law");
        specializationList.add("Corporate Training");
        specializationList.add("Dairy Management");
        specializationList.add("Rural Management");
        specializationList.add("Environmental Management");
        specializationList.add("Family Business Management");
        specializationList.add("Aviation Management");
        specializationList.add("School Management");
        specializationList.add("Labour Law Management");
        specializationList.add("Shipping Management");
        specializationList.add("Safety Management");
        specializationList.add("Event Management");
        specializationList.add("Packaging Management");
        specializationList.add("Entrepreneur Management");
        specializationList.add("Agriculture Management");
        specializationList.add("Air Transport Management");
        specializationList.add("Energy Management");
        specializationList.add("Risk Management");
        specializationList.add("Intellectual Property Rights");
        specializationList.add("Petroleum Management");
        specializationList.add("Ware House Management");
        specializationList.add("Library Management");
        specializationList.add("Operation Management");
        specializationList.add("Industrial Management");
        specializationList.add("Production Management");
        specializationList.add("Project Management");
        specializationList.add("Total Quality Management");
        specializationList.add("Total Safety Management");
	}
	
	UserInfoDAO userInfoDAO = new UserInfoDAO();
	
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
		
		
		
		return examRegistration;
	}
	
	private void reset(){
		
		
	}
	
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public Date getAdmissionDate() {
		return admissionDate;
	}
	public void setAdmissionDate(Date admissionDate) {
		this.admissionDate = admissionDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public List<String> getCourseLst() {
		return courseLst;
	}
	public void setCourseLst(List<String> courseLst) {
		this.courseLst = courseLst;
	}
	public List<String> getSpecializationList() {
		return specializationList;
	}
	public void setSpecializationList(List<String> specializationList) {
		this.specializationList = specializationList;
	}
	public String getSpecialization() {
		return specialization;
	}
	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}
	public List<String> getMonthList() {
		return monthList;
	}
	public void setMonthList(List<String> monthList) {
		this.monthList = monthList;
	}
	public List<String> getYearList() {
		return yearList;
	}

	public void setYearList(List<String> yearList) {
		this.yearList = yearList;
	}

	public String getExamOption() {
		return examOption;
	}

	public void setExamOption(String examOption) {
		this.examOption = examOption;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getFatherLast() {
		return fatherLast;
	}

	public void setFatherLast(String fatherLast) {
		this.fatherLast = fatherLast;
	}

	public String getFatherFirst() {
		return fatherFirst;
	}

	public void setFatherFirst(String fatherFirst) {
		this.fatherFirst = fatherFirst;
	}

	public String getFatherMiddle() {
		return fatherMiddle;
	}

	public void setFatherMiddle(String fatherMiddle) {
		this.fatherMiddle = fatherMiddle;
	}

	public String getAddForCorres() {
		return addForCorres;
	}

	public void setAddForCorres(String addForCorres) {
		this.addForCorres = addForCorres;
	}

	public String getPermanentAddress() {
		return permanentAddress;
	}

	public void setPermanentAddress(String permanentAddress) {
		this.permanentAddress = permanentAddress;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getTeleResidence() {
		return teleResidence;
	}

	public void setTeleResidence(String teleResidence) {
		this.teleResidence = teleResidence;
	}

	public String getTeleOffice() {
		return teleOffice;
	}

	public void setTeleOffice(String teleOffice) {
		this.teleOffice = teleOffice;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getDegree1() {
		return degree1;
	}

	public void setDegree1(String degree1) {
		this.degree1 = degree1;
	}

	public String getCollage1() {
		return collage1;
	}

	public void setCollage1(String collage1) {
		this.collage1 = collage1;
	}

	public String getExamMonth1() {
		return examMonth1;
	}

	public void setExamMonth1(String examMonth1) {
		this.examMonth1 = examMonth1;
	}

	public String getExamYear1() {
		return examYear1;
	}

	public void setExamYear1(String examYear1) {
		this.examYear1 = examYear1;
	}

	public String getSubjects1() {
		return subjects1;
	}

	public void setSubjects1(String subjects1) {
		this.subjects1 = subjects1;
	}

	public String getResults1() {
		return results1;
	}

	public void setResults1(String results1) {
		this.results1 = results1;
	}

	public String getDegree2() {
		return degree2;
	}

	public void setDegree2(String degree2) {
		this.degree2 = degree2;
	}

	public String getCollage2() {
		return collage2;
	}

	public void setCollage2(String collage2) {
		this.collage2 = collage2;
	}

	public String getExamMonth2() {
		return examMonth2;
	}

	public void setExamMonth2(String examMonth2) {
		this.examMonth2 = examMonth2;
	}

	public String getExamYear2() {
		return examYear2;
	}

	public void setExamYear2(String examYear2) {
		this.examYear2 = examYear2;
	}

	public String getSubjects2() {
		return subjects2;
	}

	public void setSubjects2(String subjects2) {
		this.subjects2 = subjects2;
	}

	public String getResults2() {
		return results2;
	}

	public void setResults2(String results2) {
		this.results2 = results2;
	}

	public String getDegree3() {
		return degree3;
	}

	public void setDegree3(String degree3) {
		this.degree3 = degree3;
	}

	public String getCollage3() {
		return collage3;
	}

	public void setCollage3(String collage3) {
		this.collage3 = collage3;
	}

	public String getExamMonth3() {
		return examMonth3;
	}

	public void setExamMonth3(String examMonth3) {
		this.examMonth3 = examMonth3;
	}

	public String getExamYear3() {
		return examYear3;
	}

	public void setExamYear3(String examYear3) {
		this.examYear3 = examYear3;
	}

	public String getSubjects3() {
		return subjects3;
	}

	public void setSubjects3(String subjects3) {
		this.subjects3 = subjects3;
	}

	public String getResults3() {
		return results3;
	}

	public void setResults3(String results3) {
		this.results3 = results3;
	}

	public String getDegree4() {
		return degree4;
	}

	public void setDegree4(String degree4) {
		this.degree4 = degree4;
	}

	public String getCollage4() {
		return collage4;
	}

	public void setCollage4(String collage4) {
		this.collage4 = collage4;
	}

	public String getExamMonth4() {
		return examMonth4;
	}

	public void setExamMonth4(String examMonth4) {
		this.examMonth4 = examMonth4;
	}

	public String getExamYear4() {
		return examYear4;
	}

	public void setExamYear4(String examYear4) {
		this.examYear4 = examYear4;
	}

	public String getSubjects4() {
		return subjects4;
	}

	public void setSubjects4(String subjects4) {
		this.subjects4 = subjects4;
	}

	public String getResults4() {
		return results4;
	}

	public void setResults4(String results4) {
		this.results4 = results4;
	}

	public String getDegree5() {
		return degree5;
	}

	public void setDegree5(String degree5) {
		this.degree5 = degree5;
	}

	public String getCollage5() {
		return collage5;
	}

	public void setCollage5(String collage5) {
		this.collage5 = collage5;
	}

	public String getExamMonth5() {
		return examMonth5;
	}

	public void setExamMonth5(String examMonth5) {
		this.examMonth5 = examMonth5;
	}

	public String getExamYear5() {
		return examYear5;
	}

	public void setExamYear5(String examYear5) {
		this.examYear5 = examYear5;
	}

	public String getSubjects5() {
		return subjects5;
	}

	public void setSubjects5(String subjects5) {
		this.subjects5 = subjects5;
	}

	public String getResults5() {
		return results5;
	}

	public void setResults5(String results5) {
		this.results5 = results5;
	}

	public String getExperienceA() {
		return experienceA;
	}

	public void setExperienceA(String experienceA) {
		this.experienceA = experienceA;
	}

	public String getExperienceB() {
		return experienceB;
	}

	public void setExperienceB(String experienceB) {
		this.experienceB = experienceB;
	}

	public String getExperienceC() {
		return experienceC;
	}

	public void setExperienceC(String experienceC) {
		this.experienceC = experienceC;
	}

	public String getExperienceD() {
		return experienceD;
	}

	public void setExperienceD(String experienceD) {
		this.experienceD = experienceD;
	}

	public String getExperienceE() {
		return experienceE;
	}

	public void setExperienceE(String experienceE) {
		this.experienceE = experienceE;
	}

	public String getExperienceF() {
		return experienceF;
	}

	public void setExperienceF(String experienceF) {
		this.experienceF = experienceF;
	}

	public String getFees() {
		return fees;
	}

	public void setFees(String fees) {
		this.fees = fees;
	}

	public List<OnlineApplication> getOnlineAppList() {
		return onlineAppList;
	}

	public void setOnlineAppList(List<OnlineApplication> onlineAppList) {
		this.onlineAppList = onlineAppList;
	}

}
