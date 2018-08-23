<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="s" uri="/struts-tags" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="SSPJIIMS" />
<meta name="description" content="About SSPJIIMS" />
<meta name="keywords" content="SSPJIIMS" />
<title>Exam Form - SSPJIIMS</title>
<jsp:include page="include.jsp"/>
<s:head theme="ajax" debug="true"/>

<style type="text/css">
.welcome {
	background-color:#DDFFDD;
	border:1px solid #009900;
	width:200px;
}
.welcome li{ 
	list-style: none; 
}

.errors {
	background-color:#FFCCCC;
	border:1px solid #CC0000;
	width:200px;
	margin-bottom:8px;
}
.errors li{ 
	list-style: none; 
}

</style>

</head>

<script>

function validate(){
if(document.getElementById('studentName').value==''){
	alert('studentName is required.');
	document.getElementById('studentName').focus();
	return false;
}else if(document.getElementById('regRefNo').value==''){
	alert('register Reference Number is required.');
	document.getElementById('regRefNo').focus();
	return false;
}else if(document.getElementById('course').value==''){
	alert('course is required.');
	document.getElementById('course').focus();
	return false;
}else if(document.getElementById('address').value==''){
	alert('address is required.');
	document.getElementById('address').focus();
	return false;
}else if(document.getElementById('admissionDate').value==''){
	alert('admission Date is required.');
	document.getElementById('admissionDate').focus();
	return false;
}else if(document.getElementById('branch').value==''){
	alert('branch is required.');
	document.getElementById('branch').focus();
	return false;
}else if(document.getElementById('contactNo').value==''){
	alert('contactNo is required.');
	document.getElementById('contactNo').focus();
	return false;
}else if(document.getElementById('email').value==''){
	alert('email is required.');
	document.getElementById('email').focus();
	return false;
}else if(document.getElementById('probableDate').value==''){
	alert('probableDate is required.');
	document.getElementById('probableDate').focus();
	return false;
}

}

</script>

<body id="subpage">


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
			<h1>Examination Form</h1>
		</div>
	</div>

	<!-- end: subheader -->
	<div class="clear"></div>	   
	<!-- Start: main -->
	<div id="main">
		<!-- Start: Rightpart -->
		<s:form action="exam.action">	
		<div>

			<div class="box">
			
				<p><img src="images/1.jpg" class="alignright" />

						<table width="516" border="0" align="center" cellspacing="0">

							<tbody>
								
								<tr><td></td>
									<td colspan="2" class="para">
										<s:if test="hasActionMessages()">
										   <div class="welcome">
										      <s:actionmessage/>
										   </div>
										</s:if>
										<s:if test="hasActionErrors()">
										   <div class="errors">
										      <s:actionerror/>
										   </div>
										</s:if>
									</td>
								</tr>
								<tr><td></br></td></tr>	
								<tr><td></td>
									<td colspan="2" class="para">
										All fields are compulsory
									</td>
								</tr>
								<tr><td></br></td></tr>		
								<tr>
									<td colspan="2" class="para">
										<s:textfield name="studentName" id="studentName" label="Name of the Student " cssStyle="width:210px;" onkeypress="returnonKeyPressBlockNumbers(event);"/>
									</td>
								</tr>
								<tr><td></td></tr>	
								
								<tr>
									<td height="19" colspan="2" class="para">
										<s:textfield name="regRefNo" id="regRefNo"  label="Reg/Ref No " cssStyle="width:210px;" onblur="return isNumeric(this.value);"/>
									</td>
								</tr>
								<tr><td></br></td></tr>	
								
								<tr>
									<td colspan="2" class="para">
										<s:select name="course" id="course" list="courseLst" label="course"/>
									</td>
								</tr>
								
								<tr><td></td></tr>	
								<tr>
									<td height="19" colspan="2" class="para">
										<s:textfield name="address" id="address" label="Address " cssStyle="width:210px;" onblur="return isNumeric(this.value);"/>
									</td>
								</tr>
								
								<tr><td></td></tr>	
								<tr>
									<td height="19" colspan="2" class="para">
										<s:datetimepicker label="Date of Admission " name="admissionDate" id="admissionDate" />
									</td>
								</tr>
								
								<tr><td></td></tr>	
								<tr>
									<td height="19" colspan="2" class="para">
										<s:textfield name="branch" id="branch" label="Branch " cssStyle="width:210px;" />
									</td>
								</tr>
								
								<tr><td></td></tr>	
								<tr>
									<td height="19" colspan="2" class="para">
										<s:textfield name="contactNo" id="contactNo" label="Contact No " onkeypress="return only_digits1(event);" cssStyle="width:210px;"/>
									</td>
								</tr>
								

								<tr><td></td></tr>	
								<tr>
									<td height="19" colspan="2" class="para">
										<s:textfield name="email" id="email" label="E-mail " onblur="ValidateForm(this);" cssStyle="width:210px;"/>
									</td>
								</tr>
								
								<tr><td></td></tr>	
								<tr>
									<td height="19" colspan="2" class="para">
										<s:datetimepicker label="Probable date for appearing " name="probableDate" id="probableDate" />
									</td>
								</tr>
								
								<tr><td></br></td></tr>	
								<tr>
									<td></td>
									<td colspan="2" class="para" align="left">
										<s:submit method="addExamRegistration" key="Submit" theme="simple" onclick="return validate();"/>
									</td>
								</tr>

							</tbody>

						</table>

						</form>
						</td>

						</tr>

						</tbody>

						</table>




					</p>
				
			</div>

		  <!-- end:box -->

		</div>
		</s:form>
		

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

</html>