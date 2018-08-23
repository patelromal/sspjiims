package mbeans;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class payment
 */
public class payment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public payment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#getServletConfig()
	 */
	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * @see Servlet#getServletInfo()
	 */
	public String getServletInfo() {
		// TODO Auto-generated method stub
		return null; 
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	String action1 ="";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost");
//		RequestDispatcher requestDispatcher = request.getRequestDispatcher("https://test.payu.in");
//      requestDispatcher.forward(request, response);
		
		String merchant_key="JBZaLc";
		String epo="NB";
		String salt="GQs7yium";
		
		String base_url="https://test.payu.in";
		int error=0;
		String hashString="";
		
	 

		
		Enumeration paramNames = request.getParameterNames();
		Map<String,String> params= new HashMap<String,String>();
//	    	while(paramNames.hasMoreElements()) 
//		{
//	      		String paramName = (String)paramNames.nextElement();
//	      
//	      		String paramValue = request.getParameter(paramName);

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
//		}
//		if(empty(params.get("txnid"))){
//			Random rand = new Random();
//			String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
//			txnid=hashCal("SHA-256",rndm).substring(0,20);
//		}
//		else
//		{
//			   txnid=params.get("txnid");
//	    }
			
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
		params.put("txnid",txnid);
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
		
		request.setAttribute("txnid",txnid);
		response.addHeader("key","JBZaLc");
		response.addHeader("txnid",txnid);
		response.addHeader("amount","100");
		response.addHeader("productinfo","testProduct");
		response.addHeader("firstname","romal");
		response.addHeader("email","romal@gmail.com");
		response.addHeader("phone","123456789");
		response.addHeader("surl","http://sspjiims.org/sspjiims/Course.action");
		response.addHeader("furl","http://sspjiims.org/sspjiims/aboutus.jsp");
		response.addHeader("service_provider","payu_paisa");
		response.sendRedirect("/paymentsuccess");
		
		processRequest(request, response);
		
//        response.sendRedirect(action1+"?txnid="+txnid+"&key="+"fB7m8s"+"&service_provider="+"payu_paisa"
//        +"&productinfo="+"testProduct"+"&amount="+"100"+"&firstname="+"romal"+"&email="+"romal@gmail.com"+"&phone="+"123456789"
//        +"&surl="+"http://sspjiims.org/sspjiims/Course.action"+"&furl="+"http://sspjiims.org/sspjiims/aboutus.jsp"		);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			  throws ServletException, IOException {
			    response.sendRedirect(action1);
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
	
	/**
	 * @see HttpServlet#doHead(HttpServletRequest, HttpServletResponse)
	 */
	protected void doHead(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
