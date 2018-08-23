<%@ taglib prefix="s" uri="/struts-tags" %>
<ul class="sf-menu">

					<li><a href="Course.action">Home Page</a></li>
					<li><a href="aboutus.jsp">About Us</a>
						<ul>
							<li><a href="aboutus.jsp">OVER VIEW</a></li>
							<li><a href="mission.jsp">MISSION & VISION</a></li>
							<li><a href="goalandobjective.jsp">Goals and Objectives</a></li>
							<li><a href="quality.jsp">QUALITY POLICY</a></li>
							<li><a href="why.jsp">WHY SSPJIIMS?</a></li>
							<li><a href="faq.jsp">FAQ</a></li>
						</ul>
					</li>
					<li><a href="#">Our Courses</a>
						<ul>
							
							<s:iterator value="courseList">
								<li><s:url action="courseDetails" id="courseURL" method="courseDetails">
									<s:param name="paramCourseId"><s:property value="key"/></s:param>
								 </s:url> 
								 <s:a href="%{courseURL}"><s:property value="value"/></s:a>
								</li>
							</s:iterator>
							
<%-- 							<li><s:url action="subCourseDetails" id="subCourseURL" method="subCourseDetails"> --%>
<%-- 									<s:param name="paramSubCourseName">MBA</s:param> --%>
<%-- 								 </s:url>  --%>
<%-- 								 <s:a href="%{subCourseURL}">MBA</s:a> --%>
<!-- 							</li> -->
<%-- 							<li><s:url action="subCourseDetails" id="subCourseURL" method="subCourseDetails"> --%>
<%-- 									<s:param name="paramSubCourseName">MCA</s:param> --%>
<%-- 								 </s:url>  --%>
<%-- 								 <s:a href="%{subCourseURL}">MCA</s:a> --%>
<!-- 							</li> -->
						</ul>
					</li>
					<li><a href="#">Colleges and Schools</a></li>
					<li><a href="#">ADMISSION</a>
						<ul>
						
							<li><a href="OnlineApplication.action">ONLINE APPLICATION</a></li>
							<li><a href="admission.jsp">ADMISSION PROCEDURE</a></li>
<!-- 							<li><a href="Course.action">ONLINE FEES PAYMENT</a></li> -->
							<li><a href="support.jsp">SUPPORT</a></li>
						</ul>
					</li>
					<li><a href="#">Students Corner</a>
						<ul>
							<li><a href="exam.action">EXAMINATION</a></li>
<!-- 								<ul> -->
<!-- 									<li><a href="Course.action">Examination Form</a></li> -->
<!-- 									<li><a href="Course.action" target="_blank">Online Examination</a></li> -->
<!-- 								</ul></li> -->
<!-- 							<li><a href="Course.action">Verification</a></li> -->
<!-- 							<li><a href="Course.action">Alumni</a> -->
<!-- 								<ul> -->
<!-- 									<li><a href="Course.action">Post Testimonial</a></li> -->
<!-- 									<li><a href="Course.action">Our Students Speak</a></li> -->
<!-- 									<li><a href="Course.action">DMS Star Students</a></li> -->
<!-- 								</ul> -->
<!-- 							</li> -->
<!-- 							<li><a href="Course.action">Complaints</a></li> -->
<!-- 							<li><a href="Course.action">Upgrade Your Course</a></li> -->
<!-- 							<li><a href="Course.action" target="_blank">Placement and Career</a></li> -->
<!-- 							<li><a href="Course.action">Refer a Friend</a></li> -->
<!-- 							<li><a href="Course.action">Download and Resources</a></li> -->
						</ul>
					</li>
					<li><a href="#">SSPJIIMS Difference</a>
<!-- 						<ul> -->
<!-- 							<li><a href="Course.action">Pedagogy</a></li> -->
<!-- 							<li><a href="Course.action">Education Methodology</a></li> -->
<!-- 							<li><a href="Course.action">Case Study Focus</a></li> -->
<!-- 							<li><a href="Course.action">Course Benefits</a></li> -->
<!-- 							<li><a href="Course.action">SSPJIIMS â MBA Advantages</a></li> -->
<!-- 						</ul> -->
					</li>
					<li><a href="contact.jsp">Contacts</a>
						<ul>
<!-- 							<li><a href="Course.action">Our Locations</a></li> -->
<!-- 							<li><a href="Course.action">Our Network</a></li> -->
<!-- 							<li><a href="Course.action">Feedback Form</a></li> -->
<!-- 							<li><a href="Course.action">Career @ SSPJIIMS</a></li> -->
<!-- 							<li><a href="Course.action">Live Chat</a></li> -->
<!-- 							<li><a href="Course.action">Franchise Enquiry</a></li> -->
							<li><a href="studentsupport.jsp">Student Support</a></li>
						</ul>
					</li>
				</ul>