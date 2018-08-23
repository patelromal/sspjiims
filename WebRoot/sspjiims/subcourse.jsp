<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Mirrored from isbm.org.in/overview.html by HTTrack Website Copier/3.x [XR&CO'2013], Sat, 17 Aug 2013 07:54:14 GMT -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="ISBM" />
<meta name="description" content="ISBM offers Master in Business Adminsitration, EMBA programs , Doctorate Certificates , Post Graduate Certificates." />
<meta name="keywords" content="ISBM, MBA Pograms, Distance Learning, About ISBM, Why ISBM, MBA in India , Doctorate, Correspondence." />
<title>SSPJIIMS Course Details</title>
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
		<s:iterator value="subCourseList">
			<h1><s:property value="subcoursename"/></h1>
		</s:iterator>	
		</div>
	</div>

	<!-- end: subheader -->
	<div class="clear"></div>	   
	<!-- Start: main -->
	<div id="main">
		<!-- Start: Rightpart -->
			
		<div>
				
			<div class="box">

					<s:iterator value="subCourseList">
						<p>
							<s:property value="paragraph1"/>
						</p>
					</s:iterator>
					<br /> <br />

					
						
						<s:tabbedPanel id="test" cssStyle="width:450px;">
						
					 	  <s:div id="tabs-1" label="Course Structure" theme="ajax" cssStyle="height:500px;">
							
							<table width="100%" cellpadding="0" cellspacing="0"></br>
								<tr class="title-1">
									<td width="100%" class="tableTd"><strong>Code:</strong>
									<display:table name="subCourseList">
										<display:column property="structure" title=""/>
									</display:table>
									</td>		
								</tr>
								<tr>
									<td height="10" colspan="2" valign="top"></td>
								</tr>
							</table>

						</s:div>
						
						<s:iterator value="subCourseList">
						<s:div id="tabs-2" label="Eligibility" theme="ajax" cssStyle="height:500px;">

							<table width="100%" cellpadding="0" cellspacing="0"></br>
								<tr class="title-1">
									<td height="25" class="tableTd"><strong>Pre-Requisites
									</strong></td>
									<td><strong>Duration</strong></td>
								</tr>
								<tr>
									<td height="25" class="tableTd"><s:property value="prerequisites"/></td>
									<td>Fast Track:<s:property value="fasttrack"/><br /> Regular:<s:property value="regular"/>
									</td>
								</tr>
								<tr>
									<td height="10" colspan="2" valign="top"></td>
								</tr>
							</table>

						</s:div>

						<s:div id="tabs-3" label="Fees" theme="ajax" cssStyle="height:500px;">

							<table width="100%" cellpadding="0" cellspacing="0">
								<tr></br>
									<td width="28%" height="20" valign="top" class="tableTd"><strong>Fees
											:</strong><strong><br /> </strong></td>
									<td width="72%" valign="top" class="title-2"><strong><s:property value="fees"/></strong>
											<br /><s:property value="feesremark"/></td>
								</tr>
								<tr>
									<td height="10" colspan="2" valign="top"></td>
								</tr>
								<tr>
									<td height="20" valign="top" class="tableTd"><strong>Examination:</strong></td>
									<td class="title-2"><strong>Online: </strong><s:property value="online"/><strong><br />
															    Home: </strong><s:property value="home"/><br /> <strong>
															    Centre Based: </strong><s:property value="centrebased"/></td>
								
								</tr>
								<tr>
									<td height="10" colspan="2" valign="top"></td>
								</tr>
							</table>


						</s:div>
						</s:iterator>
						
						</s:tabbedPanel>
						
					
			    </div>

		  <!-- end:box -->

		</div>

		<div align="left" class="tableTd">
			<table>
			<tr>
				<td><a href="#">Apply Online</a>&nbsp;&nbsp;&nbsp;</td>
				<td><a href="#">Download Application Form</a>&nbsp;&nbsp;&nbsp;</td>
				<td><a href="#">Request Info</a></td>
			</tr>
			</table>
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