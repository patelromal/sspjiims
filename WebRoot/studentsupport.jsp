<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="author" content="SSPJIIMS" />
<meta name="description" content="SSPJIIMS" />
<meta name="keywords" content="SSPJIIMS" />
<title>SSPJIIMS</title>

<!-- Favorites icon -->
<jsp:include page="include.jsp"/>
</head>

<body id="mainpage" onload="goToAnchor();">

	
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

		

		<!-- start: SliderPart -->

		<div class="clear"></div>

		<!-- Start: main -->

		<div id="main">

			<!-- Start: Rightpart -->

			<div id="content">

				
				
				<div class="box">

						<p>SSPJIIMS extends a warm hand to the students by giving them all the support them throughout their journey. </p>

		    <table cellpadding="0" cellspacing="0" height="113" width="414">

              <tbody>

                <tr>

                  <td valign="top" width="226"><h2>Nature of Query</h2></td>

                  <td valign="top" width="186"><h2>Email us on</h2></td>

                </tr>

                <tr>

                  <td height="24" valign="top" width="226"><p>  Course Material/Courseware</p></td>

                  <td valign="top" width="186"><p><a href="mailto:support@sspjiims.org">support@sspjiims.org</a></p></td>

                </tr>

                <tr>

                  <td height="21" valign="top" width="226"><p>  Examination Related</p></td>

                  <td valign="top" width="186"><p><a href="mailto:exams@sspjiims.org">exams@sspjiims.org</a></p></td>

                </tr>

                <tr>

                  <td height="23" valign="top" width="226"><p>  Information on Courses</p></td>

                  <td valign="top" width="186"><p><a href="mailto:enquiry@sspjiims.org">enquiry@sspjiims.org</a></p></td>

                </tr>

                <tr>

                  <td height="21" valign="top" width="226"><p>  Any other information</p></td>

                  <td valign="top" width="186"><p><a href="mailto:info@sspjiims.org">info@sspjiims.org</a></p></td>

                </tr>

              </tbody>

            </table>
						
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

										<h2>Enquiry Form</h2></td>
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

				</div>

			</div>

			<!-- end: sidebar -->

			<!-- end: content -->

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