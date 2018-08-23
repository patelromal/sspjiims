<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="s" uri="/struts-tags" %>
<!-- Mirrored from isbm.org.in/overview.html by HTTrack Website Copier/3.x [XR&CO'2013], Sat, 17 Aug 2013 07:54:14 GMT -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="ISBM" />
<meta name="description" content="ISBM offers Master in Business Adminsitration, EMBA programs , Doctorate Certificates , Post Graduate Certificates." />
<meta name="keywords" content="ISBM, MBA Pograms, Distance Learning, About ISBM, Why ISBM, MBA in India , Doctorate, Correspondence." />
<title>Admin SSPJIIMS</title>
<jsp:include page="include.jsp"/>
<s:head theme="ajax" debug="true"/>
</head>

<script>
function OnClickCourseTab(){
	document.getElementById("courseTab").style.display="block";
	document.getElementById("SubCourseTab").style.display="none";
}
function OnClickSubCourseTab(){
	document.getElementById("courseTab").style.display="none";
	document.getElementById("SubCourseTab").style.display="block";
	
}
function onClickSubCourseUpdate(){
	document.getElementById("SCUpdate1").style.display="none";
	document.getElementById("SCUpdate2").style.display="none";
	document.getElementById("subCourseListTD").style.display="none";
	
}
function onDeleteChangeSelectCourse(id){
	var selectedCourseId= id.value;
	window.location="SubCourse!DeleteSubCourse1.action?selectedCourseId="+selectedCourseId;
	document.getElementById("subCourseListTD").style.display="block";
}

function onDeleteChangeSelectSubCourse(id){
	var selectedSubCourseId= id.value;	
	window.location="SubCourse!DeleteSubCourse2.action?selectedSubCourseId="+selectedSubCourseId;
}

function onChangeSelectCourse(id){
	var selectedCourseId= id.value;
	
// 	document.getElementById("SCUpdate1").style.display="block";
// 	document.getElementById("SCUpdate2").style.display="block";
// 	document.getElementById("subCourseListTD").style.display="block";
	
	window.location="SubCourse!EditSubCourse1.action?selectedCourseId="+selectedCourseId;
	document.getElementById("subCourseListTD").style.display="block";
}

function onChangeSelectEditCourse(id){
	var selectedCourseId= id.value;
	window.location="Course!EditCourse.action?selectedCourseId="+selectedCourseId;
	document.getElementById("subCourseListTD").style.display="block";
// 	<s:submit method="EditCourse" key="Edit" theme="simple" />
}

function onChangeSelectSubCourse(id){
	var selectedSubCourseId= id.value;
// 	document.getElementById("SCUpdate1").style.display="block";
// 	document.getElementById("SCUpdate2").style.display="block";
// 	document.getElementById("subCourseListTD").style.display="block";
	
	window.location="SubCourse!EditSubCourse2.action?selectedSubCourseId="+selectedSubCourseId;
	
	document.getElementById("SCUpdate1").style.display="block";
	document.getElementById("SCUpdate2").style.display="block";
	document.getElementById("subCourseListTD").style.display="block";

}
</script>

<body id="subpage" onload="test1();">

<!-- start: Wrapper -->

<div id="Wrapper">

    <!-- ///////////////////////////////////////////////// Start //////////////////////////////////////////////////////////////////////////////// -->

	<!-- start: header -->

	<div id="header">
			<jsp:include page="header.jsp"/>
	</div>

	<!-- end: header -->	<!-- /////////////////////////////////////////////////// END //////////////////////////////////////////////////////////////////////////////// -->

	<div class="clear"></div>	

	<!-- start: subheader --> 

	<div id="subheader">
		<div class="subheader_left">
			<h1>Welcome Admin</h1>
		</div>
		<div class="subheader_right">
			<a href="examdetails.action">Check Exam Details</a>&nbsp;
			<a href="onlineappdetails.action">Online Application Details</a>
		</div>
	</div>

	<!-- end: subheader -->
	<div class="clear"></div>	   
	<!-- Start: main -->
	<div id="main">
		<!-- Start: Rightpart -->

			<div>

				<div class="box">
					
							<s:tabbedPanel id="test" cssStyle="width:800px;height:730px;" selectedTab="%{selectedTab}">

								<s:div id="tabs-1" label="Course" theme="ajax" cssStyle="height:670px;">
									<s:form action="Course.action">
										<table width="100%" cellpadding="0" cellspacing="0">
											<tr class="title-1">
												<td width="100%" class="tableTd">
												
													<s:tabbedPanel id="courseTab" selectedTab="%{selectedSubTab}" onclick="OnClickCourseTab()">
														<s:div id="tabs-1.1" label="Course Add" theme="ajax" cssStyle="height:640px;" cssClass="tableTd">
															
															<table>
																<tr><td><p></p></td></tr>
																<tr><td><s:textfield name="coursename" label="Course Name " cssStyle="width:210px;"/></td></tr>
																<tr><td><p></p></td></tr>
																<tr>
																	<td>
																		<s:textarea name="courseparagraph1" label="Course Details " cssStyle="width:617px;height:180px;"/>
																	</td>
																</tr>
																<tr><td><p></p></td></tr>
																<tr>
																	<td>
																		<s:textarea name="subcourselink" label="Sub Course Url " cssStyle="width:617px;height:200px;"/>
																	</td>
																</tr>
																<tr><td><p></p></td></tr>
																
															</table>	
															<table>
																<tr><td style="padding-left: 93px;">
																		<s:submit method="AddCourse" key="Add Course" theme="simple" cssStyle="width:210px;"/>
																	</td>
																</tr>
															</table>		
															
															
														</s:div>
														<s:div id="tabs-1.2" label="Course Update" theme="ajax" cssStyle="height:640px;" cssClass="tableTd">
															
															<table>
																<tr><td><p></p></td></tr>
																<tr><td><s:select name="updateSelectedCourse" list="courseList" label="Select Course "
																	  						   listValue="value" listKey="key" onchange="onChangeSelectEditCourse(this);"
																	  						   />
																	</td>
																</tr>
																<tr><td><p></p></td></tr>
																<tr><td><s:textfield name="updateCourseName" label="Course Name " cssStyle="width:210px;"/></td></tr>
											 					<tr><td><p></p></td></tr>
																<tr>
																	<td>
																		<s:textarea name="updateCourseParagraph1" label="Course Details " cssStyle="width:617px;height:180px;"/>
																	</td>
																</tr>
																<tr><td><p></p></td></tr>
																<tr>
																	<td>
																		<s:textarea name="updateSubCourseLink" label="Sub Course Url " cssStyle="width:617px;height:200px;"/>
																	</td>
																</tr>
																<tr><td><p></p></td></tr>
																</table>
																<table>
																<tr><td style="padding-left: 93px;">
																		<s:submit method="UpdateCourse" key="Update Course" theme="simple" cssStyle="width:210px;"/>
																	</td>
																</tr>
																</table>
																		
															
														</s:div>
														<s:div id="tabs-1.3" label="Course Delete" theme="ajax" cssStyle="height:500px;">
															
															<table>
																<tr class="title-1"></br>
																	<td class="tableTd">
																	  Select Course: <s:select name="selectedDeleteCourse" list="courseList" label="department" 
																	  						   listValue="value" listKey="key" onchange="" theme="simple"/>
																	  <s:submit method="DeleteCourse" key="Delete" theme="simple" />
																	</td>
																</tr>
															</table>			
															
														</s:div>
													</s:tabbedPanel>
													
												</td>
											</tr>
										</table>
									</s:form>
								</s:div>

								<s:div id="tabs-2" label="Sub-Course" theme="ajax" cssStyle="height:670px;">
									<s:form action="SubCourse.action">
									<table width="100%" align="center" >
										<tr class="title-1">
											<td width="100%" class="tableTd">
											
												<s:tabbedPanel id="subCourseTab" selectedTab="%{selectedSubTab}" onclick="OnClickCourseTab()">
												
													<s:div id="tabs-2.1" label="Sub-Course Add" theme="ajax" cssStyle="height:640px;" cssClass="tableTd">
														<table>
															<tr><td><p></p><p></p>
																	<s:textarea name="paragraph1" label="Course Details " cssStyle="width:617px;height:150px;"/>
																</td>
															</tr>
														</table>
														<table>
														  <tr>
														   <td width="50%">
														    <table>
															<tr><td><p></p></td></tr>
															<tr><td><p></p></td></tr>
															<tr><td><s:select name="selectedCourse" list="courseList" listValue="value" listKey="key" label="Select Course " cssStyle=""/></td></tr>
															<tr><td><p></p></td></tr>
															<tr><td><s:textfield name="subcoursename" label="Sub-Course Name " cssStyle="width:210px;"/></td></tr>
											 				<tr><td><p></p></td></tr>
															<tr><td><s:textfield name="prerequisites" label="Pre-Requisites " cssStyle="width:210px;"/></td></tr>
											 				<tr><td><p></p></td></tr>
											 				<tr><td><s:textfield name="fasttrack" label="Fasttrack Duration" cssStyle="width:210px;"/></td></tr> 
											 				<tr><td><p></p></td></tr>
											 				<tr><td><s:textfield name="regular" label="Regular Duration" cssStyle="width:210px;"/></td></tr>
											 				<tr><td><p></p></td></tr>
											 				<tr><td><s:textfield name="fees" label="Fees " cssStyle="width:210px;"/></td></tr>
											 				<tr><td><p></p></td></tr>
											 				<tr><td><s:textfield name="feesremark" label="Fees Remark " cssStyle="width:210px;"/></td></tr>
											 				<tr><td><p></p></td></tr>
															<tr><td><s:textfield name="online" label="Online Exam" cssStyle="width:210px;"/></td></tr>
											 				<tr><td><p></p></td></tr>
															<tr><td><s:textfield name="home" label="Home Exam" cssStyle="width:210px;"/></td></tr>
											 				<tr><td><p></p></td></tr>
															<tr><td><s:textfield name="centrebased" label="Centre Based Exam" cssStyle="width:210px;"/></td></tr>
															<tr><td><p></p></td></tr>
											 				<tr><td><p></p></td><td><s:submit method="AddSubCourse" key="Submit" theme="simple" cssStyle="width:210px;"/></td></tr>
															</table>
															</td>
															<td  width="50%">
																	<table>
																		<tr><td><p></p></td></tr>
																		<tr><td class="tableTd"><p></p>
																			<s:textarea name="structure" label="Course Structure " cssStyle="width:250px;height:365px;"/>
																			</td>
																		</tr>
															</td>
															</tr>
															</table>
														</td>
														</tr>
														</table>
													</s:div>
													
													<s:div id="tabs-2.2" label="Sub-Course Update" theme="ajax" cssStyle="height:640px;width:700px;" cssClass="tableTd">
														<table>
															<tr>
																<td><p></p><p></p>
																	<s:select name="selectedCourse1" list="courseList" listValue="value" listKey="key" label="Select Course " 
																			  theme="simple" onchange="onChangeSelectCourse(this);">&nbsp;&nbsp;&nbsp;Course:</s:select>
																</td>
																<td id="subCourseListTD"><p></p><p></p>
																	<s:select name="selectedSubCourse" list="editSubCourseList" listValue="value" listKey="key" label="Select Sub-Course " 
																			  theme="simple" onchange="onChangeSelectSubCourse(this);">&nbsp;&nbsp;&nbsp;Sub-Course:</s:select>
																</td>
															</tr>
														</table>
														<table id="SCUpdate1">
															<tr><td><p></p><p></p>
																	<s:textarea name="updateParagraph1" label="Course Details " cssStyle="width:617px;height:170px;"/>
																</td>
															</tr>
														</table>
														<table id="SCUpdate2">
														  <tr>
															   <td width="50%">
																    <table>
																	    <s:hidden name="tempSelectedSubCourse"/>
																		<tr><td><p></p></td></tr>
																		<tr><td><s:textfield name="updateSubCourseName" label="Sub-Course Name " cssStyle="width:210px;"/></td></tr>
														 				<tr><td><p></p></td></tr>
																		<tr><td><s:textfield name="updatePreRequisites" label="Pre-Requisites " cssStyle="width:210px;"/></td></tr>
														 				<tr><td><p></p></td></tr>
														 				<tr><td><s:textfield name="updateFastTrack" label="Fasttrack Duration" cssStyle="width:210px;"/></td></tr> 
														 				<tr><td><p></p></td></tr>
														 				<tr><td><s:textfield name="updateRegular" label="Regular Duration" cssStyle="width:210px;"/></td></tr>
														 				<tr><td><p></p></td></tr>
														 				<tr><td><s:textfield name="updateFees" label="Fees " cssStyle="width:210px;"/></td></tr>
														 				<tr><td><p></p></td></tr>
														 				<tr><td><s:textfield name="updateFeesRemark" label="Fees Remark " cssStyle="width:210px;"/></td></tr>
														 				<tr><td><p></p></td></tr>
																		<tr><td><s:textfield name="updateOnline" label="Online Exam" cssStyle="width:210px;"/></td></tr>
														 				<tr><td><p></p></td></tr>
																		<tr><td><s:textfield name="updateHome" label="Home Exam" cssStyle="width:210px;"/></td></tr>
														 				<tr><td><p></p></td></tr>
																		<tr><td><s:textfield name="updateCentreBased" label="Centre Based Exam" cssStyle="width:210px;"/></td></tr>
																		<tr><td><p></p></td></tr>
														 				<tr><td><p></p></td><td><s:submit method="UpdateSubCourse" key="Update" theme="simple" cssStyle="width:210px;"/></td></tr>
																	</table>
																</td>
																<td  width="50%">
																		<table>
																			<tr><td class="tableTd"><p></p>
																					<s:textarea name="updateStructure" label="Course Structure " cssStyle="width:250px;height:375px;"/>
																				</td>
																			</tr>
																		</table>	
																</td>
															</tr>
														</table>
														
													</s:div>
													
													<s:div id="tabs-2.3" label="Sub-Course Delete" theme="ajax" cssStyle="height:640px;" cssClass="tableTd">
															<table>
															<tr><td><p></p><p></p>
																	<s:select name="deleteSelectedCourse" list="courseList" listValue="value" listKey="key" label="Select Course " 
 																			  theme="simple" onchange="onDeleteChangeSelectCourse(this);">&nbsp;&nbsp;&nbsp;Select Course:</s:select> 
																</td>
																<td id="subCourseListTD"><p></p><p></p>
																	<s:select name="deleteSelectedSubCourse" list="deleteSubCourseList" listValue="value" listKey="key" label="Select Sub-Course " 
 																			  theme="simple" onchange="onDeleteChangeSelectSubCourse(this);">&nbsp;&nbsp;&nbsp;Select Sub Course:</s:select> 
																</td>
															</tr>
															<tr><td><p></p></td></tr>		
														
															<tr>
															   <td>
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																<s:submit method="DeleteSubCourse2" key="Delete Sub-Course" theme="simple" cssStyle="width:215px;"/>
															   </td>
															</tr>
														</table>	
													</s:div>
													
												</s:tabbedPanel>
											</td>
										</tr>
									</table>
									</s:form>
								</s:div>

							</s:tabbedPanel>

				</div>

				<!-- end:box -->

			</div>



			<!-- end:right content -->		

	</div>

	<!-- end: main -->

</div>

<!-- end: wrapper -->

	<div class="clear"></div>

	<!-- Main Footer ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!--start #footer -->

	<div id="footer_wrap">
		<jsp:include page="footer.jsp"/>		 
	</div>

	<!--end: footer_wrap -->

	<div class="clear"></div>

	<!-- start: copyright -->

	<div id="copyright">
		<jsp:include page="copyright.jsp"/>
	</div>

	<!-- end: copyright -->
	<script>
		$('#slide').jqFancyTransitions({ width: 940, height: 310 });
	</script>

</body>


<!-- Mirrored from sspjiims.org/ by HTTrack Website Copier/3.x [XR&CO'2013], Sat, 17 Aug 2013 07:53:42 GMT -->
</html>