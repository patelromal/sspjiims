<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="s" uri="/struts-tags" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="SSPJIIMS" />
<meta name="description" content="About SSPJIIMS" />
<meta name="keywords" content="SSPJIIMS" />
<title>Online Application SSPJIIMS</title>
<jsp:include page="include.jsp"/>
<s:head theme="ajax" debug="true"/>
</head>

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
			<h1>Online Application</h1>
		</div>
	</div>

	<!-- end: subheader -->
	<div class="clear"></div>	   
	<!-- Start: main -->
	<div id="main">
		<!-- Start: Rightpart -->

		<div>

			<div class="box1">

			  <h2><strong>Applications</strong></h2>

			  <p>This page is an electronic version of the application form.  Filling   and submitting this form will navigate to an online payment    process/page. If you don't wish to do an online payment, you are   requested to  download the form, fill it and send it to your nearest  SSPJIIMS center.</p>

			  <p><a href="download/ApplicationFormPDF.pdf"><strong>Click  here to download the form</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>

			  <s:form action="OnlineApplication.action">

			    <table width="100%" border="0" cellspacing="0" cellpadding="0">

                  <tr>
                    <td align="left" valign="top"><strong>Course Name</strong></td>
                    <td align="left" valign="top">
                    	<s:select name="course" id="course" list="courseLst" theme="simple"/>
                    </td>
                  </tr>

                  <tr>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>
                  </tr>

                  <tr>
                    <td align="left" valign="top"><strong>Specialization</strong></td>
                  	<td align="left" valign="top">
                    	<s:select name="specialization" id="specialization" list="specializationList" theme="simple"/>
                    </td>
                  </tr>

                  <tr>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>
                  </tr>

                  <tr>
                    <td align="left" valign="top"><strong>Full Name </strong>(In Block Letters)</td>
                    <td align="left" valign="top">
                     <table width="500" cellspacing="0" cellpadding="0" border="0">
                        <tbody>
                          <tr>

                            <td width="214"><span class="para"><strong>Last Name </strong></span>
                                  <s:textfield onkeypress="return onKeyPressBlockNumbers(event);" id="lastName" name="lastName" theme="simple"/>
                            </td>
                            <td width="215"><span class="para"><strong>First Name </strong></span>
                                <s:textfield onkeypress="return onKeyPressBlockNumbers(event);" id="firstName" name="firstName" theme="simple"/>
                            </td>
                            <td width="221"><span class="para"><strong>Middle Name </strong></span>
                                <s:textfield onkeypress="return onKeyPressBlockNumbers(event);" id="middleName" name="middleName" theme="simple"/>
                            </td>

                            <td width="10">&nbsp;</td>

                          </tr>
                        </tbody>
                    </table>
                    </td>
                  </tr>

                  <tr>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>
                  </tr>

                  <tr>
                    <td align="left" valign="top"><strong>Fathers/Husbands Name</strong><strong><br />
                    </strong>(In Block Letters)</td>
                    <td align="left" valign="top">
                       <table border="0" cellpadding="0" cellspacing="0" width="500">
                        <tbody>
                          <tr>
                            <td width="213"><label><strong>Last Name</label></strong>
                                  <s:textfield name="fatherLast" id="fatherlast" onkeypress="return onKeyPressBlockNumbers(event);" theme="simple"/>
                            </td>
                            <td width="216"><strong>First Name</strong>
                                <s:textfield name="fatherFirst" id="fatherfirst" onkeypress="return onKeyPressBlockNumbers(event);" theme="simple"/>
                            </td>
                            <td width="220"><strong>Middle Name</strong>
                                <s:textfield name="fatherMiddle" id="fathermiddle" onkeypress="return onKeyPressBlockNumbers(event);" theme="simple"/>
                             </td>
                            <td width="12"></td>
                          </tr>
                        </tbody>
                       </table>
                     </td>
                  </tr>

                  <tr>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>
                  </tr>

                  <tr>
                    <td align="left" valign="top"><strong>Address for correspondence</strong></td>
                    <td align="left" valign="top"><s:textarea name="addForCorres" cols="30" id="addcorres" theme="simple"/></td>
                  </tr>

                  <tr>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>
                  </tr>

                  <tr>
                    <td align="left" valign="top"><strong>Permanent Address</strong></td>
                    <td align="left" valign="top"><s:textarea name="permanentAddress" cols="30" id="permanentadd" theme="simple"/></td>
                  </tr>

                  <tr>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>
                  </tr>

                  <tr>
                    <td align="left" valign="top"><strong>Date of Birth</strong></td>
                    <td align="left" valign="top"><s:datetimepicker label="Date of Admission " name="admissionDate" id="admissionDate" theme="simple"/></td>
                  </tr>

                  <tr>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>
                  </tr>

                  <tr>
                    <td align="left" valign="top"><strong>Gender</strong></td>
                    <td align="left" valign="top">
	                    <s:radio name="gender" list="#{'Male':'Male','Female':'Female'}" value="Male" theme="simple"/>
                    </td>
                  </tr>

                  <tr>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>
                  </tr>

                  <tr>
                    <td align="left" valign="top"><strong>Nationality</strong></td>
                    <td align="left" valign="top">
                      <s:textfield name="nationality" id="nationality" onkeypress="return onKeyPressBlockNumbers(event);" theme="simple"/>
                    </td>
                  </tr>

                  <tr>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>
                  </tr>

                  <tr>
                    <td align="left" valign="top"><strong>Telephone</strong></td>
                    <td align="left" valign="top">
                      <table border="0" cellpadding="0" cellspacing="0" width="500">
                        <tbody>
                          <tr>
                            <td width="253"><label><strong>Residence</strong></label>
                                  <input name="teleResidence" id="teleResidence" onkeypress="return only_digits1(event);" type="text" />
                            </td>
                            <td width="232"><strong>Office</strong>
                                <s:textfield name="teleOffice" id="teleOffice" onkeypress="return only_digits1(event);" theme="simple"/>
                            </td>
                            <td width="197"><strong>Mobile</strong>
                                <s:textfield name="mobile" id="mobile" onkeypress="return only_digits1(event);" theme="simple"/>
                            </td>
                          </tr>
                        </tbody>
                    </table>
                   </td>
                 </tr>

                 <tr>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>
                  </tr>

                  <tr>
                    <td align="left" valign="top"><strong>Email</strong></td>
                    <td align="left" valign="top"><s:textfield name="email" id="email" onblur="ValidateForm(this);" size="40" theme="simple"/></td>
                  </tr>

                  <tr>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>
                  </tr>

                  <tr>
                    <td colspan="2" align="left" valign="top"><p><strong>Academic Details<br />
                      </strong>Examination taken (Please list in chronological order including examinations with results pending)</p>
                        <p>&nbsp;</p>
                      <table width="100%" height="215" border="0" cellpadding="0" cellspacing="2" class="apptable">
                         <tr>
                            <td rowspan="2"><div align="center" class="para"><strong>Degree</strong></div></td>
                            <td rowspan="2"><div align="center" class="para"><strong>Name of the<br />Institution / College / School </strong></div></td>
                            <td colspan="2"><div align="center" class="para"><strong>Exam Date</strong></div></td>
                            <td rowspan="2" class="para"><div align="center"><strong>Subjects / Specialization</strong></div></td>
                            <td rowspan="2"><div align="center" class="para"><strong>Results / Grades / Percentage</strong></div></td>
                          </tr>
                          <tr>
                            <td width="59"><div align="center" class="para"><strong>Month</strong></div></td>
                            <td width="73"><div align="center" class="para"><strong>Year</strong></div></td>
                          </tr>
                          <tr>
                            <td><s:textfield name="degree1" cssClass="input_class" id="degree1" theme="simple"/></td>
                            <td><s:textfield name="collage1" cssClass="input_class" id="collage1" theme="simple"/></td>
                            <td><s:select name="examMonth1" id="examMonth1" list="monthList" theme="simple"/></td>
                            <td class="para"><s:select name="examYear1" id="examYear1" list="yearList" theme="simple"/></td>
                            <td><s:textfield name="subjects1" cssClass="input_class" id="subjects1" theme="simple"/></td>
                            <td><s:textfield name="results1" cssClass="input_class" id="results1" theme="simple"/></td>
                          </tr>

						  <tr>
                            <td><s:textfield name="degree2" cssClass="input_class" id="degree2" theme="simple"/></td>
                            <td><s:textfield name="collage2" cssClass="input_class" id="collage2" theme="simple"/></td>
                            <td><s:select name="examMonth2" id="examMonth2" list="monthList" theme="simple"/></td>
                            <td class="para"><s:select name="examYear2" id="examYear2" list="yearList" theme="simple"/></td>
                            <td><s:textfield name="subjects2" cssClass="input_class" id="subjects2" theme="simple"/></td>
                            <td><s:textfield name="results2" cssClass="input_class" id="results2" theme="simple"/></td>
                          </tr>
                          
                          <tr>
                            <td><s:textfield name="degree3" cssClass="input_class" id="degree3" theme="simple"/></td>
                            <td><s:textfield name="collage3" cssClass="input_class" id="collage3" theme="simple"/></td>
                            <td><s:select name="examMonth3" id="examMonth3" list="monthList" theme="simple"/></td>
                            <td class="para"><s:select name="examYear3" id="examYear3" list="yearList" theme="simple"/></td>
                            <td><s:textfield name="subjects3" cssClass="input_class" id="subjects3" theme="simple"/></td>
                            <td><s:textfield name="results3" cssClass="input_class" id="results3" theme="simple"/></td>
                          </tr>
                          
                          <tr>
                            <td><s:textfield name="degree4" cssClass="input_class" id="degree4" theme="simple"/></td>
                            <td><s:textfield name="collage4" cssClass="input_class" id="collage4" theme="simple"/></td>
                            <td><s:select name="examMonth4" id="examMonth4" list="monthList" theme="simple"/></td>
                            <td class="para"><s:select name="examYear4" id="examYear4" list="yearList" theme="simple"/></td>
                            <td><s:textfield name="subjects4" cssClass="input_class" id="subjects4" theme="simple"/></td>
                            <td><s:textfield name="results4" cssClass="input_class" id="results4" theme="simple"/></td>
                          </tr>
                          
                          <tr>
                            <td><s:textfield name="degree5" cssClass="input_class" id="degree5" theme="simple"/></td>
                            <td><s:textfield name="collage5" cssClass="input_class" id="collage5" theme="simple"/></td>
                            <td><s:select name="examMonth5" id="examMonth5" list="monthList" theme="simple"/></td>
                            <td class="para"><s:select name="examYear5" id="examYear5" list="yearList" theme="simple"/></td>
                            <td><s:textfield name="subjects5" cssClass="input_class" id="subjects5" theme="simple"/></td>
                            <td><s:textfield name="results5" cssClass="input_class" id="results5" theme="simple"/></td>
                          </tr>
				</table>
				</td>
				</tr>
                          
                  <tr>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>
                  </tr>

                  <tr>
                    <td align="left" valign="top"><strong>Work Experience</strong><br/>(Starting with the latest one)</td>
                    <td align="left" valign="top">
                      <table border="0" cellpadding="0" cellspacing="0" height="141" width="502">
                        <tbody>
                          <tr>
                            <td width="325"><table border="0" cellpadding="0" cellspacing="2" width="326">
                                <tbody>
                                  <tr>
                                    <td width="37">i</td>
                                    <td width="283"><s:textfield name="experienceA" id="experienceA" size="45" theme="simple"/></td>
                                  </tr>
                                  <tr>
                                    <td>ii</td>
                                    <td><s:textfield name="experienceB" id="experienceB" size="45" theme="simple"/></td>
                                  </tr>
                                  <tr>
                                    <td>iii</td>
                                    <td><s:textfield name="experienceC" id="experienceC" size="45" theme="simple"/></td>
                                  </tr>
                                  <tr>
                                    <td>iv</td>
                                    <td><s:textfield name="experienceD" id="experienceD" size="45" theme="simple"/></td>
                                  </tr>
                                  <tr>
                                    <td>v</td>
                                    <td><s:textfield name="experienceE" id="experienceE" size="45" theme="simple"/></td>
                                  </tr>
                                  <tr>
                                    <td>vi</td>
                                    <td><s:textfield name="experienceF" id="experienceF" size="45" theme="simple"/></td>
                                  </tr>
                                </tbody>
                            </table></td>
                          </tr>
                        </tbody>
                    </table></td>
                  </tr>

                  <tr>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>
                  </tr>

                  <tr>
                    <td align="left" valign="top"><strong>Exam Option</strong></td>
                    <td align="left" valign="top">
                    	<s:radio name="examOption" list="#{'From Home':'From Home','Study Centre':'Study Centre'}" value="Study Centre" theme="simple"/>
                    </td>
                  </tr>

                  <tr>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>
                  </tr>

                  <tr>
                    <td align="left" valign="top"><strong>Fees Paid (INR</strong>)</td>
                    <td align="left" valign="top"><s:textfield id="fees" name="fees" size="20" onkeypress="return only_digits(event);" theme="simple"/></td>
                  </tr>

                  <tr>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>
                  </tr>

                  <tr>
                    <td align="left" valign="top"><strong>Declaration by the Candidate</strong></td>
                    <td align="left" valign="top">I certify that all information provided in this application proforma is complete and accurate.
                    	I agree to familiarize myself with all the rules and regulations of the program set forth by SSPJIIMS and abide by them.
                    	I would uplift the standards and respect the principles of SSPJIIMS as an organization of higher learning.</td>
                  </tr>

                  <tr>
                    <td align="left" valign="top">&nbsp;</td>
                    <td align="left" valign="top">&nbsp;</td>
                  </tr>

                  <tr>
                    <td width="181" align="left" valign="top">&nbsp;</td>
                    <td width="524" align="left" valign="top"><label>
                      <s:submit method="submitApplication" key="Submit" theme="simple" onclick="return validate();"/>
                      &nbsp;&nbsp;
                      <s:submit method="reset" key="Reset" theme="simple" onclick="return validate();"/>

                    </label></td>

                  </tr>

                </table>

			  </s:form>

			  <p align="justify">&nbsp;</p>

	      </div>

		  <!-- end:box -->

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

</html>