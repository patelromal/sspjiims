<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="SSPJIIMS" />
<meta name="description" content="About SSPJIIMS" />
<meta name="keywords" content="SSPJIIMS" />
<title>About SSPJIIMS</title>
<jsp:include page="include.jsp"/>
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
			<h1>Payment Status:</h1>
		</div>
	</div>

	<!-- end: subheader -->
	<div class="clear"></div>	   
	<!-- Start: main -->
	<div id="main">
		<!-- Start: Rightpart -->

		<div>

			<div class="box">


			<%
        String amount = request.getParameter("amount");
	String productinfo= request.getParameter("productinfo");
	String txnid = request.getParameter("txnid");
	String phone = request.getParameter("phone");
	String firstname = request.getParameter("firstname");
	String key = "JBZaLc";
	String salt = "GQs7yium";
	String status = request.getParameter("status");
	String r_h =request.getParameter("hash");
        String hashString="";
        String udf1 =request.getParameter("udf1");
        String udf2 =request.getParameter("udf2");
        String udf3 =request.getParameter("udf3");
        String udf4 =request.getParameter("udf4");
        String udf5 =request.getParameter("udf5");
        String p_Id = request.getParameter("payuMoneyId");
        String additionalCharges = request.getParameter("additionalCharges");
        out.println("Your payment with Payment ID is :" + p_Id + " ");
        //String udf2 = request.getParameter("udf2");
        String hash;
        String email = request.getParameter("email");
        if(status=="success"){
                if(additionalCharges!=null){
		String hashSequence = additionalCharges+"|"+salt+"|"+status+"||||||"+udf5+"|"+udf4+"|"+udf3+"|"+udf2+"|"+udf1+"|"+email+"|"+firstname+"|"+productinfo+"|"+amount+"|"+txnid+"|";
		
		
			hashString=hashSequence.concat(key);
                        out.println(hashString);
                        hash=hashCal("SHA-512",hashString);
                        out.println(hash);
			if(r_h.equals(hash)){
		         			out.println("Successfull with additiona charges");
                        	out.println("Transaction details:");
                            out.println("Amount:"+amount);
                            out.println("additionalCharges:"+additionalCharges);
                            out.println("Status of Transaction:"+status);}
			                  
                        else {out.println("Transaction details:");
                            out.println("Amount:"+amount);
                            out.println("additionalCharges:"+additionalCharges);
                            out.println("Status of Transaction:"+status);
                        }
                }
                else {
                String hashSequence = salt+"|"+status+"||||||"+udf5+"|"+udf4+"|"+udf3+"|"+udf2+"|"+udf1+"|"+email+"|"+firstname+"|"+productinfo+"|"+amount+"|"+txnid+"|";
		
		
			hashString=hashSequence.concat(key);
                        out.println(hashString);
                        hash=hashCal("SHA-512",hashString);
                        out.println(hash);
			if(r_h.equals(hash)){
		         out.println("Successfull");
                        out.println("Transaction details:");
                            out.println("Amount:"+amount);
                            out.println("additionalCharges:"+additionalCharges);
                            out.println("Status of Transaction:"+status);}
			                  
                        else{ out.println("failure");
                        out.println("Transaction details:");
                            out.println("Amount:"+amount);
                            out.println("additionalCharges:"+additionalCharges);
                            out.println("Status of Transaction:"+status);}
                }	
        }else {out.println("Transaction details:");
                            out.println("Amount:"+amount);
                            out.println("additionalCharges:"+additionalCharges);
                            out.println("Status of Transaction:"+status);
                        }
	%>
<%!
	public String hashCal(String type,String str){
		byte[] hashseq=str.getBytes();
		StringBuffer hexString = new StringBuffer();
		try{
		MessageDigest algorithm = MessageDigest.getInstance(type);
		algorithm.reset();
		algorithm.update(hashseq);
		byte messageDigest[] = algorithm.digest();
            
		

		for (int i=0;i<messageDigest.length;i++) {
			String hex=Integer.toHexString(0xFF & messageDigest[i]);
			if(hex.length()==1) hexString.append("0");
			hexString.append(hex);
		}
			
		}catch(NoSuchAlgorithmException nsae){ }
		
		return hexString.toString();


	}
%>

				
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