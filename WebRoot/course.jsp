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
<title>About SSPJIIMS</title>
<jsp:include page="include.jsp"/>
<s:head theme="ajax" debug="true"/>

<script>
	function getSubCourse(id){
		window.location="subCourseDetails!subCourseDetails.action?paramSubCourseName="+id;
	}
</script>

<style>

#courseDetailsList{
	color: blue;
}

#courseDetailsList a:visited {color:#0101DF;} /* visited link */
#courseDetailsList a:hover {color:#FF00FF;}   /* mouse over link */
#courseDetailsList a:active {color:#0000FF;}  /* selected link */

</style>

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
			<h1>Overview</h1>
		</div>
	</div>

	<!-- end: subheader -->
	<div class="clear"></div>	   
	<!-- Start: main -->
	<div id="main">
		<!-- Start: Rightpart -->

		<div>

			<div class="box" style="height: 600px;">

				<p><img src="images/1.jpg" class="alignright" />
					<s:iterator value="courseDetailsList">
					  <p>
							<s:property value="courseparagraph1"/>
					  </p>
					</s:iterator>
				  <br />

				  <br />

				</p>
					
			 		<div class="clear" align="justify">
			 			<h2>Choose Your Program:</h2>
						<display:table name="courseDetailsList" id="courseDetailsList" class="courseDetailsList">
							<display:column property="subcourselink" class=""/>
						</display:table>

<%-- 					<s:a href="#" onclick="getSubCourse(id);" id="mca">Master Of Computer Application</s:a> --%>
					</div>

			    </div>

		  <!-- end:box -->

		</div>


<%-- 							<li><s:url action="subCourseDetails" id="subCourseURL" method="subCourseDetails"> --%>
<%-- 									<s:param name="paramSubCourseName">MBA</s:param> --%>
<%-- 								 </s:url>  --%>
<%-- 								 <s:a href="%{subCourseURL}">MBA</s:a> --%>
<!-- 							</li> -->
									

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