<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<script>
function submitPayuForm() {
	

      var payuForm = document.forms.payuForm;
      payuForm.submit();
    }
</script>

<body>

<s:form action="PaymentAction.action" method="post" name="payuForm">

firstname:<s:textfield name="firstname" id="firstname" value="firstname"/>

<!-- <input type="submit" value="submit" onclick="submitPayuForm();"/> -->
<s:submit value="Payment" action="PaymentAction" method="processPayment">
	<s:param id="txnid" name="txnid" value="706719ce213bcc8d5b08"/>
	<s:param id="key" name="key" value="JBZaLc"/>
	<s:param id="amount" name="amount" value="100"/>
	<s:param id="productinfo" name="productinfo" value="testprod"/>
	<s:param id="firstname" name="firstname" value="romal"/>
	<s:param id="email" name="email" value="romal@gmail.com"/>
	<s:param id="phone" name="phone" value="1234567890"/>
	<s:param id="service_provider" name="service_provider" value="payu_paisa"/>
	<s:param id="surl" name="surl" value="http://sspjiims.org/sspjiims/Course.action"/>
	<s:param id="furl" name="furl" value="http://sspjiims.org/sspjiims/Course.action"/>
</s:submit>

</s:form>

</body>
</html>