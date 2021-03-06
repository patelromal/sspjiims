﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta name="author" content="SSPJIIMS" />
<meta name="description" content="SSPJIIMS" />
<meta name="keywords" content="SSPJIIMS" />
<title>SSPJIIMS</title>

<h:form>            
    <h:outputLink value="javascript:void(0)" onclick="PF('dlg').show();" title="login">
        <p:graphicImage name="/demo/images/login.png" />
    </h:outputLink>
 
    <p:growl id="growl" sticky="true" showDetail="true" life="3000" />
 
    <p:dialog header="Login" widgetVar="logindlg" resizable="false">
        <h:panelGrid columns="2" cellpadding="5">
            <h:outputLabel for="username" value="Username:" />
            <p:inputText id="username" value="#{userLoginView.username}" required="true" label="username" />
 
            <h:outputLabel for="password" value="Password:" />
            <p:password id="password" value="#{userLoginView.password}" required="true" label="password" />
 
            <f:facet name="footer">
                <p:commandButton value="Login" update="growl" actionListener="#{userLoginView.login}"
                                 oncomplete="handleLoginRequest(xhr, status, args)" />
            </f:facet>  
        </h:panelGrid>
    </p:dialog>
</h:form>

<!-- Favorites icon -->
<jsp:include page="include.jsp"/>
</head>



<script>
function test(){
	//window.location.href = window.location.href.replace('Course.action', '');
	
	window.history.pushState(“object or string”, “Title”, “/new-url”);
    
	return false;
}
</script>
<body id="mainpage" onload="goToAnchor();return test();">

	
	<!-- start: Wrapper -->
	<script>

$(document).ready(function() { 

	 $('#Send').click(function() {  
	 	
			// name validation
			
			var nameVal = $("#name").val();
			if(nameVal == '') {
				
				$("#name_error").html('');
				$("#name").after('<label class="error" id="name_error">Please enter your name.</label>');
				return false
			}
			else
			{
				$("#name_error").html('');
			}
			
			var phoneVal = $("#phone").val();
			if(phoneVal == '') {
				
				$("#phone_error").html('');
				$("#phone").after('<label class="error" id="phone_error">Please enter your Phone.</label>');
				return false
			}
			else
			{
				$("#phone_error").html('');
			}
			
			var cityVal = $("#city").val();
			if(cityVal == '') {
				
				$("#city_error").html('');
				$("#city").after('<label class="error" id="city_error">Please enter your city.</label>');
				return false
			}
			else
			{
				$("#city_error").html('');
			}
			
			/// email validation
			
			var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
			var emailaddressVal = $("#email").val();
			
			if(emailaddressVal == '') {
				$("#email_error").html('');
				$("#email").after('<label class="error" id="email_error">Please enter your email address.</label>');
				return false
			}
			else if(!emailReg.test(emailaddressVal)) {
				$("#email_error").html('');
				$("#email").after('<label class="error" id="email_error">Enter a valid email address.</label>');
				return false
			 
			}
			else
			{
				$("#email_error").html('');
			}
		
		
			$.post("mail_processd41d.html?"+$("#registration").serialize(), {
		
			}, function(response){
			
			if(response==0)
			{
				$("#after_submit").html('');
				$("#Send").before('<label class="error" id="after_submit">Error ! invalid captcha code .</label>');
			}
			else
			{
				
				$("#after_submit").html('');
				$("#Send").before('<label class="success" id="after_submit">Your message has been submitted.</label>');
				change_captcha();
				clear_form();
			}
			
			
		});
				
		return false;
	 });
	 
	 // refresh captcha
	 $('img#refresh').click(function() {  
			
			change_captcha();
	 });
	 
	 function change_captcha()
	 {
	 	document.getElementById('captcha').src="get_captcha4051.png?rnd=" + Math.random();
	 }
	 
	 function clear_form()
	 {
	 	$("#name").val('');
		$("#email").val('');
		$("#phone").val('');
		$("#city").val('');
		$("#code").val('');
		$("#message").val('');
	 }
});
 
 
 	
</script>

	<style>
body {
	font-family: Georgia, "Times New Roman", Times, serif;
	font-size: 14px
}

#wrap {
	border: solid #CCCCCC 0px;
	width: 230px;
	padding: 3px;
}

.error {
	color: #CC0000;
	font-size: 12px;
	margin: 4px;
	font-style: italic;
	width: 200px;
}

.success {
	color: #009900;
	font-size: 12px;
	margin: 4px;
	font-style: italic;
	width: 200px;
}

img#refresh {
	float: right;
	margin-left: 4px;
	cursor: pointer;
}

label {
	float: left;
	color: #666666;
	width: 80px;
}
</style>
	<div id="Wrapper">

		<!-- ///////////////////////////////////////////////// Start //////////////////////////////////////////////////////////////////////////////// -->

		<!-- start: header -->

		<div id="header">
			<jsp:include page="header.jsp"/>
		</div>
		<!-- end: header -->

		<!-- start:Sliderbg -->

		<div class="sliderbg">

			<div id="slide">

				<a href="ISBM_National_Academy_of_Indian_Payroll.html"><img src="images/slides5.jpg" alt="Payroll Management Courses" /></a> 
				<a href="#"><img src="images/slides2.jpg" alt="Best online mba programs" /></a>
				<a href="#"><img src="images/slides3.jpg" alt="Online mba degree programs" /></a>
				<a href="#"><img src="images/slides2.jpg" alt="Part-time mba programs in India" /></a>
				<a href="#"><img src="images/slides1.jpg" alt="Fast track mba" /></a>

			</div>

			<div id="ft-button-IDOFHOLDER-active"></div>

		</div>

		<!-- start: SliderPart -->

		<div class="clear"></div>

		<!-- Start: main -->

		<div id="main">

			<!-- Start: Rightpart -->

			<div id="content">

				<!--        <p><marquee behavior="scroll" direction="left">

			  <strong style="color:#990000;"> <span dir="ltr" id=":3g">ISBM is offering UGC , DEC , NAAC approved courses from a government recognised University</span><span dir="ltr" id=":2y"> which&nbsp;is also recognised by the joint commitee and HRD Minsitry Govt. of India.</span></strong>

	              </marquee></p>-->

				<div class="box">
					<p>
						<marquee> SSPJIIMS courses are now also approved by UGC
						recognized University. Students can also take admission for Joint
						Program </marquee>
					</p>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="55%"><h2>Welcome to SSPJIIMS!</h2>
								<h3>&quot;Your first step towards right career !&quot;</h3>
								<p>SSPJIIMS paves a path to early success in life through its fast track short duration correspondence courses. 
								These courses consist of concepts and case studies that provide broad exposure to relevant business concepts and management specifics. 
								This helps them to get started as Managers by enhancing their productivity, capability to formulate business policies, strategies and 
								their implications for the organization. </p>
								</td>
							
						</tr>
					</table>
					

					<p>SSPJIIMS was established in 2000 by a well known SHARDA EDUCATION SOCIETY. 
							It is also ranked among the top International B-Schools that provide management courses through correspondence. 
							SSPJIIMS has over 100 specializations and management courses to choose from SSPJIIMS is SOCIETY working its way to reaching 
							towards people in the most distant corners of not only India but world in providing Correspondence courses in management field, 
							with specially designed courses for working professionals; from Diploma in management courses to the Doctorate and Laureate level. 
							At SSPJIIMS, the courses are designed for those who have burning desire to pursue a career in business and management. 
							The students will get qualified without disrupting their current career progression and earning.
					</p>

				</div>

			</div>

			<!-- Start: sidebar -->

			<div id="sidebar">

				<div class="box">

					<form action="#" name="registration" id="registration">

						<table width="250" cellspacing="0" cellpadding="0" border="0">

							<tbody>

								<tr>

									<td class="tit" colspan="3"><a name="enquiry" id="enquiry"></a>

										<h2>Request Info</h2></td>

								</tr>



								<tr>

									<td width="7">&nbsp;</td>

									<td width="92"><label class="para">Name</label></td>

									<td width="201"><input type="text" id="name" name="Name"
										class="para" size="25"
										onkeypress="return onKeyPressBlockNumbers(event);" /></td>

								</tr>

								<tr>

									<td>&nbsp;</td>

									<td>&nbsp;</td>

									<td>&nbsp;</td>

								</tr>

								<tr>

									<td>&nbsp;</td>

									<td><label class="para">Email</label></td>

									<td><input type="text" name="email" id="email"
										class="para" size="25" onblur="ValidateForm(this);" /></td>

								</tr>

								<tr>

									<td>&nbsp;</td>

									<td>&nbsp;</td>

									<td>&nbsp;</td>

								</tr>

								<tr>

									<td>&nbsp;</td>

									<td><label class="para">Phone</label></td>

									<td><input type="text" name="phone" id="phone"
										class="para" size="25"
										onkeypress="return only_digits1(event);" /></td>

								</tr>

								<tr>

									<td>&nbsp;</td>

									<td>&nbsp;</td>

									<td>&nbsp;</td>

								</tr>

								<tr>

									<td>&nbsp;</td>

									<td><label class="para">City</label></td>

									<td><input type="text" name="city" id="city" class="para"
										size="25" /></td>

								</tr>

								<tr>

									<td>&nbsp;</td>

									<td>&nbsp;</td>

									<td>&nbsp;</td>

								</tr>

								<tr>

									<td>&nbsp;</td>

									<td><label class="para">Course</label></td>

									<td><select name="courses" id="courses" class="para"
										style="width: 160px;">

											<option selected="selected" value="0">---Select
												Course---</option>

											<option value="Doctorate ">Doctorate</option>
											<option value="MBA 4 Sem">MBA 4 Sem</option>
											<option value="EMBA">EMBA</option>
											<option value="MIB">MIB</option>
											<option value="MMS">MMS</option>
											<option value="Post Grad">Post Grad</option>
											<option value="MBA">Chartered Finance Manager</option>
											<option value="Chartered Finance Manager">Chartered
												Certified Accountant</option>
											<option value="Graduate/ BMS">Graduate/ BMS</option>
											<option value="Advance Diploma">Advance Diploma</option>
											<option value="Diploma ">Diploma</option>
											<option value="Advance Certificate ">Advance
												Certificate</option>
											<option value="Information Technology">Information
												Technology</option>
											<option value="Hotel Management ">Hotel Management</option>
											<option value="Bio-Technology">Bio-Technology</option>
											<option value="Animation and Multimedia">Animation
												and Multimedia</option>
											<option value="Commerce and Arts ">Commerce and Arts</option>

									</select></td>

								</tr>

								<tr>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td colspan="2">Please type the verification code

										<div id="wrap" align="center">

											<img src="get_captcha.png" alt="" id="captcha" /> <br
												clear="all" /> <input name="code" type="text" id="code">
												<img src="refresh.jpg" width="25" alt="" id="refresh" />
										</div>


									</td>
								</tr>
								<tr>

									<td>&nbsp;</td>

									<td>&nbsp;</td>

									<td><input type="submit" style="margin-top: 5px;"
										name="submit" class="submit_jn" value="Submit" id="Send" /></td>

								</tr>

								<tr>

									<td>&nbsp;</td>

									<td>&nbsp;</td>

									<td>&nbsp;</td>

								</tr>

							</tbody>

						</table>
					</form>

					<p>
						<img border="0" src="images/home_welcome.png"
							alt="Masters in business administration" />
					</p>

				</div>

			</div>

			<!-- end: sidebar -->

			<!-- end: content -->

			<div class="divider"></div>

			<div class="fullwidth">

				<!-- Start boxes -->

				<table width="100%" border="0" cellspacing="0" cellpadding="0">

					<tr>

						<td width="3%" valign="top" class="feat_box">&nbsp;</td>

						<td width="28%" valign="top" class="feat_box"><h2
								class="font_bt">Featured Courses</h2>

							<p>
								<img src="images/d1.jpg" width="304" height="125"
									alt="Best Management institutes in India" />
							</p>

							<ul>

								<li><strong>Master in Business Administration
										(MBA)</strong></li>

								<li><strong>Graduate Diploma in Management (GDM) </strong></li>

								<li><strong>Post Graduate Diploma in Business
										Management (PGDBM) </strong></li>

								<li><strong>Executive Masters in Business
										Administration (EMBA) </strong></li>

								<li><strong> Masters in International Business
										(MIB)</strong></li>

							</ul>

							<p>
								<a href="ISBM_School_of_Management.html">View All Courses</a>
							</p></td>

						<td width="5%" valign="top" class="feat_box">&nbsp;</td>

						<td width="28%" valign="top" class="feat_box"><h2
								class="font_bt">MBA Programs</h2>

							<p>
								<img src="images/d2.jpg" alt="Fast track mba institute in india" />
							</p>

							<ul>

								<li>Value for time</li>

								<li>Value for money</li>

								<li>Customized courses</li>

								<li>Comprehensive study material</li>

								<li>Customized for better career opportunities</li>

								<li>Integrated practical as well as theoretical learning
									approach</li>

								<li>Great advantage of study while working</li>

							</ul>

							<p>
								<a href="MBA.html">Learn more about MBA </a>
							</p></td>

						<td width="2%" valign="top" class="feat_box">&nbsp;</td>

						<td width="2%" valign="top"
							style="border-left: 1px dotted #8a8a8a">&nbsp;</td>

						<td width="28%" valign="top" class="feat_box"><h2>
								<span class="font_bt">Latest News</span>
							</h2>
							<a class="twitter-timeline"  href="https://twitter.com/info_sspjiims"  data-widget-id="427858413272330240"  width="275" height="300">Tweets by @info_sspjiims</a>
    						<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
	
						</td>

						<td width="3%" valign="top" class="feat_box">&nbsp;</td>

					</tr>

				</table>

				<!-- end boxes -->

			</div>

			<!-- end: fullwidth -->

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