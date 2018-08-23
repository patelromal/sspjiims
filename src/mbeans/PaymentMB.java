package mbeans;

import java.io.Serializable;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@ManagedBean(name="paymentMB")
@RequestScoped
public class PaymentMB implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2341422508318442123L;
	private String fName;
	private String lName;
	private String amount;
	private String address1;
	private String address2;
	private String city;
	private String state;
	private String country;
	private String zipcode;
	private String email;
	private String phone;
	private String productinfo;
	
	
	
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	
	public void paymentAction(ActionEvent actionEvent) {

		try
		{
			System.out.println(getfName());
			System.out.println(getlName());
			
			HttpServletRequest request = (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();
			HttpServletResponse response = (HttpServletResponse)FacesContext.getCurrentInstance().getExternalContext().getResponse();
			
			
			
			
			String merchant_key="JBZaLc";
			String epo="NB";
			String salt="GQs7yium";
			String action1 ="";
			String base_url="https://test.payu.in";
			int error=0;
			String hashString="";
			
		 

			
			Enumeration paramNames = request.getParameterNames();
			Map<String,String> params= new HashMap<String,String>();
//		    	while(paramNames.hasMoreElements()) 
//			{
//		      		String paramName = (String)paramNames.nextElement();
//		      
//		      		String paramValue = request.getParameter(paramName);

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
//			}
//			if(empty(params.get("txnid"))){
//				Random rand = new Random();
//				String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
//				txnid=hashCal("SHA-256",rndm).substring(0,20);
//			}
//			else
//			{
//				   txnid=params.get("txnid");
//		    }
				
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
					action1=base_url.concat("/_payment");
				}
			}
			else if(!empty(params.get("hash")))
			{
				hash=params.get("hash");
				action1=base_url.concat("/_payment");
			}
			
//			URL url = new URL("http://localhost:8080/sspjiims/payment");
//	        HttpURLConnection connection = (HttpURLConnection)url.openConnection();
//	        connection.setRequestMethod("POST");
//	        connection.setRequestProperty("hash", params.get("hash"));
//	        connection.connect();
			HttpSession session = request.getSession(false);
			session.setAttribute("txnid",txnid);
			
	        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/payment");
	        requestDispatcher.forward(request, response);
	        
//	        int code = connection.getResponseCode();
//	        System.out.println("Response code of the object is "+code);
//	        if (code==200)
//	        {
//	        	System.out.println("OK : " + connection.getInputStream());
//	        	System.out.println("OK : " + connection.getFileNameMap());
//	        }
			
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
	
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
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
	public String getProductinfo() {
		return productinfo;
	}
	public void setProductinfo(String productinfo) {
		this.productinfo = productinfo;
	}

}
