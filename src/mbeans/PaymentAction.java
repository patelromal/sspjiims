package mbeans;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class PaymentAction extends ActionSupport implements SessionAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5236393379284169917L;
	private String txnid;
	private String key;
	private String amount;
	private String productinfo;
	private String firstname;
	private String email;
	private String phone;
	private String surl;
	private String furl;
	private String service_provider;
	
	public String processPayment()
	{
		try{
			
//			setAction1("https://test.payu.in");
//			setLocation("https://test.payu.in");
			validateUrl();
			
			
			HttpServletRequest request = ServletActionContext.getRequest();
			
			Random rand = new Random();
			String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
			String txnid=hashCal("SHA-256",rndm).substring(0,20);
			
			request.setAttribute("txnid",txnid);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return "success";
	}
	
	private String action1;
	
	private void validateUrl()
	{
		String merchant_key="JBZaLc";
		String epo="NB";
		String salt="GQs7yium";
		
		String base_url="https://test.payu.in";
		int error=0;
		String hashString="";
		String action="";
	 
		try
		{
		
//		Enumeration paramNames = request.getParameterNames();
		Map<String,String> params= new HashMap<String,String>();
	//    	while(paramNames.hasMoreElements()) 
	//	{
	//      		String paramName = (String)paramNames.nextElement();
	//      
	//      		String paramValue = request.getParameter(paramName);
	
			Random rand = new Random();
			String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
			String txnid=hashCal("SHA-256",rndm).substring(0,20);
		
			params.put("key","JBZaLc");
			params.put("txnid",txnid);
			params.put("amount","100");
			params.put("productinfo","testProduct");
			params.put("firstname","romal");
			params.put("email","romal@gmail.com");
			params.put("phone","123456789");
			params.put("surl","http://sspjiims.org/sspjiims/Course.action");
			params.put("furl","http://sspjiims.org/sspjiims/aboutus.jsp");
			params.put("service_provider","payu_paisa");
	//	}
	//	if(empty(params.get("txnid"))){
	//		Random rand = new Random();
	//		String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
	//		txnid=hashCal("SHA-256",rndm).substring(0,20);
	//	}
	//	else
	//	{
	//		   txnid=params.get("txnid");
	//    }
			
		String udf2 = txnid;
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
				 action=base_url.concat("/_payment");
			}
		}
		else if(!empty(params.get("hash")))
		{
			hash=params.get("hash");
			action=base_url.concat("/_payment");
		}
		
//		setAction1(action);
		setAction1("http://localhost:8080/sspjiims/success.jsp");
		setTxnid(txnid);
		setKey("JBZaLc");
		setAmount("100");
		setProductinfo("testProduct");
		setFirstname("romal");
		setEmail("romal@gmail.com");
		setPhone("1234567890");
		setSurl("http://sspjiims.org/sspjiims/Course.action");
		setFurl("http://sspjiims.org/sspjiims/aboutus.jsp");
		setService_provider("payu_paisa");
		
//		params.put("txnid",txnid);
//		params.put("key","JBZaLc");
//		params.put("amount","100");
//		params.put("productinfo","testProduct");
//		params.put("firstname","romal");
//		params.put("email","romal@gmail.com");
//		params.put("phone","123456789");
//		params.put("surl","http://sspjiims.org/sspjiims/Course.action");
//		params.put("furl","http://sspjiims.org/sspjiims/aboutus.jsp");
//		params.put("service_provider","payu_paisa");
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	
	
	public boolean empty(String s)
	{
		if(s== null || s.trim().equals(""))
			return true;
		else
			return false;
	}
	
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

	@Override
	public void setSession(Map arg0) {
		// TODO Auto-generated method stub
		
	}

	public String getAction1() {
		return action1;
	}

	public void setAction1(String action1) {
		this.action1 = action1;
	}


	public String getTxnid() {
		return txnid;
	}


	public void setTxnid(String txnid) {
		this.txnid = txnid;
	}


	public String getKey() {
		return key;
	}


	public void setKey(String key) {
		this.key = key;
	}


	public String getAmount() {
		return amount;
	}


	public void setAmount(String amount) {
		this.amount = amount;
	}


	public String getProductinfo() {
		return productinfo;
	}


	public void setProductinfo(String productinfo) {
		this.productinfo = productinfo;
	}


	public String getFirstname() {
		return firstname;
	}


	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getSurl() {
		return surl;
	}


	public void setSurl(String surl) {
		this.surl = surl;
	}


	public String getFurl() {
		return furl;
	}


	public void setFurl(String furl) {
		this.furl = furl;
	}


	public String getService_provider() {
		return service_provider;
	}


	public void setService_provider(String service_provider) {
		this.service_provider = service_provider;
	}

}
