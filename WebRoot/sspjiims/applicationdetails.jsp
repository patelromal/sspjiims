<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="SSPJIIMS" />
<meta name="description" content="About SSPJIIMS" />
<meta name="keywords" content="SSPJIIMS" />
<title>Online Application Details - SSPJIIMS</title>
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
			<h1>Online Application Details</h1>
		</div>
	</div>

	<!-- end: subheader -->
	<div class="clear"></div>	   
	<!-- Start: main -->
	<div>
		<!-- Start: Rightpart -->
		<s:form action="examdetails.action">	
		<div>

			<div>
			
				<p>

					<display:table export="true" id="messageData4" name="onlineAppList" requestURI="/userAction.do" pagesize="10" >
			            <display:setProperty name="basic.msg.empty_list" value="display No Message" />
			            <display:setProperty name="paging.banner.item_name" value="Application Records"/>
			            <display:column property="firstName" title="firstName" sortable="true"   />
			            <display:column property="lastName" title="lastName" sortable="true"   />
			            <display:column property="fatherFirst" title="fatherFirst" sortable="true"  />
			            <display:column property="addForCorres" title="addForCorres" sortable="true"  />
			            <display:column property="permanentAddress" title="permanentAddress" sortable="true"  />
			            <display:column property="admissionDate" title="admissionDate" sortable="true"  format="{0,date,dd/MM/yyyy}" />
			            <display:column property="course" title="course" sortable="true"  />
			            <display:column property="gender" title="gender" sortable="true"  />
			            <display:column property="mobile" title="mobile" sortable="true"  />
			            <display:column property="examOption" title="examOption" sortable="true"   />
			            <display:column property="fees" title="fees" sortable="true"  />
			        </display:table>
					
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