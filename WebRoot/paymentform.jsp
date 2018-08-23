<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="author" content="SSPJIIMS" />
<meta name="description" content="About SSPJIIMS" />
<meta name="keywords" content="SSPJIIMS" />
<title>SSPJIIMS Payment</title>
<jsp:include page="include.jsp"/>
</head>


<%!
public boolean empty(String s)
	{
		if(s== null || s.trim().equals(""))
			return true;
		else
			return false;
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
<% 	
	String merchant_key="ycblpy";
	String epo="";
	String salt="VWhLb2ck";
	String action1 ="";
	String base_url="https://secure.payu.in/_payment";
	int error=0;
	String hashString="";
	String udf2="";
 

	
	Enumeration paramNames = request.getParameterNames();
	Map<String,String> params= new HashMap<String,String>();
    	while(paramNames.hasMoreElements()) 
	{
      		String paramName = (String)paramNames.nextElement();
      
      		String paramValue = request.getParameter(paramName);

		params.put(paramName,paramValue);
	}
	String txnid ="";
	if(empty(params.get("txnid"))){
		Random rand = new Random();
		String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
		txnid=hashCal("SHA-256",rndm).substring(0,20);
	}
	else
		txnid=params.get("txnid");
			udf2 = txnid;
	String txn="abcd";
	String hash="";
	String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
	if(empty(params.get("hash")) && params.size()>0)
	{
		if( empty(params.get("key"))
			|| empty(params.get("txnid"))
			|| empty(params.get("amount"))
			|| empty(params.get("firstname"))
			|| empty(params.get("email"))
			|| empty(params.get("phone"))
			|| empty(params.get("productinfo"))
			|| empty(params.get("surl"))
			|| empty(params.get("furl"))
			|| empty(params.get("udf1"))
			|| empty(params.get("service_provider"))
	)
			
			error=1;
		else{
			String[] hashVarSeq=hashSequence.split("\\|");
			
			for(String part : hashVarSeq)
			{
				hashString= (empty(params.get(part)))?hashString.concat(""):hashString.concat(params.get(part));
				hashString=hashString.concat("|");
			}
			hashString=hashString.concat(salt);
			

			 hash=hashCal("SHA-512",hashString);
			action1=base_url.concat("/_payment");
		}
	}
	else if(!empty(params.get("hash")))
	{
		hash=params.get("hash");
		action1=base_url.concat("/_payment");
	}
		

%>

<script>
var hash='<%= hash %>';
function submitPayuForm() {
	
	if (hash == '')
		return;

      var payuForm = document.forms.payuForm;
      payuForm.submit();
    }
</script>

<body id="subpage" onload="submitPayuForm();">

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
			<h1>FEES Details</h1>
		</div>
	</div>

	<!-- end: subheader -->
	<div class="clear"></div>	   
	<!-- Start: main -->
	<div id="main">
		<!-- Start: Rightpart -->

		<div>

			<div class="box">

	<form action="<%= action1 %>" method="post" name="payuForm">
	
	  <input type="hidden" name="key" value="<%= merchant_key %>" />
      <input type="hidden" name="hash" value="<%= hash %>"/>
      <input type="hidden" name="txnid" value="<%= txnid %>" />
<%--       <input type="hidden" name="udf2" value="<%= txnid %>" /> --%>
	  <input type="hidden" name="enforce_paymethod" value="<%= epo %>" />
	  <input type="hidden" name="service_provider" value="payu_paisa" />
	  <input type="hidden" name="surl" value="http://sspjiims.org/sspjiims/success.jsp" />
	  <input type="hidden" name="furl" value="http://sspjiims.org/sspjiims/success.jsp" />
      <table>
      	<tr>
      	  <td align="right">First Name: </td>
          <td><input name="firstname" id="firstname" value="<%= (empty(params.get("firstname"))) ? "" : params.get("firstname") %>" size="30"/></td>
      	  <td align="right">Last Name:</td>
          <td><input name="lastname" value="<%= (empty(params.get("lastname"))) ? "" : params.get("lastname") %>" size="30"/></td>
      	</tr>
      	<tr>
			<td><p></p>
			</td>
		</tr>
      	<tr>
      	  <td align="right">Phone: </td>
          <td><input name="phone" value="<%= (empty(params.get("phone"))) ? "" : params.get("phone") %>" size="30"/></td>
          <td align="right">Email: </td>
          <td><input name="email" id="email" value="<%= (empty(params.get("email"))) ? "" : params.get("email") %>" size="30"/></td>
      	</tr>
      	<tr>
			<td><p></p>
			</td>
		</tr>
      	<tr>
      	  <td align="right">Branch Name:</td>
          <td><input name="udf1" value="<%= (empty(params.get("udf1"))) ? "" : params.get("udf1") %>" size="30" /></td>
          <td align="right">Counselor Name:</td>
          <td><input name="productinfo" value="<%= (empty(params.get("productinfo"))) ? "" : params.get("productinfo") %>" size="30" /></td>
      	</tr>
      	<tr>
			<td><p></p>
			</td>
		</tr>
      	<tr>
          <td align="right">Courses Detail:</td>
          <td><input name="udf2" value="<%= (empty(params.get("udf2"))) ? "" : params.get("udf2") %>" size="30" /></td>
      	  <td align="right">Pay Amount:</td>
          <td><input name="amount" value="<%= (empty(params.get("amount"))) ? "" : params.get("amount") %>" size="30"/></td>
      	</tr>
      	<tr>
			<td><p></p>
			</td>
		</tr>
      	<tr>
      	  <td align="right">Transaction Type:</td>
          <td><input name="udf3" value="<%= (empty(params.get("udf3"))) ? "" : params.get("udf3") %>" size="30"/></td>
          <td align="right" style="padding-left: 8px;">Reference Number:</td>
          <td><input name="udf4" value="<%= (empty(params.get("udf4"))) ? "" : params.get("udf4") %>" size="30"/></td>	
      	</tr>
      	<tr>
			<td><p></p>
			</td>
		</tr>
      	<tr>
      	  <td align="right">Comment:</td>
          <td><input name="udf5" value="<%= (empty(params.get("udf5"))) ? "" : params.get("udf5") %>" size="30"/></td>          	
      	</tr>
		<tr>
			<td><p></p>
			</td>
		</tr>
        <tr>
        	<td></td>
          <% if(empty(hash)){ %>
            <td><input  type="submit" value="Submit" /></td>
          <% } %>
        </tr>     
        
<!--         <tr> -->
<!--           <td>Success URI: </td> -->
<%--           <td colspan="3"><input type="hidden" name="surl" value="<%= (empty(params.get("surl"))) ? "" : params.get("surl") %>" size="64" /></td> --%>
<!--         </tr> -->
<!--         <tr> -->
<!--           <td>Failure URI: </td> -->
<%--           <td colspan="3"><input type="hidden" name="furl" value="<%= (empty(params.get("furl"))) ? "" : params.get("furl") %>" size="64" /></td> --%>
<!--         </tr> -->
<!--         <tr> -->
<!--           <td><b>Optional Parameters</b></td> -->
<!--         </tr> -->
<!--         <tr> -->
<!--           <td>Last Name: </td> -->
<%--           <td><input name="lastname" id="lastname" value="<%= (empty(params.get("lastname"))) ? "" : params.get("lastname") %>" /></td> --%>
<!--           <td>Cancel URI: </td> -->
<!--           <td><input name="curl" value="" /></td> -->
<!--         </tr> -->
<!--         <tr> -->
<!--           <td>Address1: </td> -->
<%--           <td><input name="address1" value="<%= (empty(params.get("address1"))) ? "" : params.get("address1") %>" /></td> --%>
<!--           <td>Address2: </td> -->
<%--           <td><input name="address2" value="<%= (empty(params.get("address2"))) ? "" : params.get("address2") %>" /></td> --%>
<!--         </tr> -->
<!--         <tr> -->
<!--           <td>City: </td> -->
<%--           <td><input name="city" value="<%= (empty(params.get("city"))) ? "" : params.get("city") %>" /></td> --%>
<!--           <td>State: </td> -->
<%--           <td><input name="state" value="<%= (empty(params.get("state"))) ? "" : params.get("state") %>" /></td> --%>
<!--         </tr> -->
<!--         <tr> -->
<!--           <td>Country: </td> -->
<%--           <td><input name="country" value="<%= (empty(params.get("country"))) ? "" : params.get("country") %>" /></td> --%>
<!--           <td>Zipcode: </td> -->
<%--           <td><input name="zipcode" value="<%= (empty(params.get("zipcode"))) ? "" : params.get("zipcode") %>" /></td> --%>
<!--         </tr> -->
<!--         <tr> -->
<!--           <td>UDF1: </td> -->
<%--           <td><input name="udf1" value="<%= (empty(params.get("udf1"))) ? "" : params.get("udf1") %>" /></td> --%>
          
<!--         <tr> -->
<!--           <td>UDF3: </td> -->
<%--           <td><input name="udf3" value="<%= (empty(params.get("udf3"))) ? "" : params.get("udf3") %>" /></td> --%>
<!--           <td>UDF4: </td> -->
<%--           <td><input name="udf4" value="<%= (empty(params.get("udf4"))) ? "" : params.get("udf4") %>" /></td> --%>
<!--         </tr> -->
<!--         <tr> -->
<!--           <td>UDF5: </td> -->
<%--           <td><input name="udf5" value="<%= (empty(params.get("udf5"))) ? "" : params.get("udf5") %>" /></td> --%>
<!--           <td>PG: </td> -->
<%--           <td><input name="pg" value="<%= (empty(params.get("pg"))) ? "" : params.get("pg") %>" /></td> --%>
<!--         </tr> -->
		
      </table>
    </form>
    
				
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
