<%--
/**
 *
 * @author Freeroutes
 */
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="FRErrorPage.jsp"%>
<%@ page import= "java.io.*,Partner.*,Events.*,java.lang.*,Login_signUp.*,java.util.*"%>
  <%
	  request.setCharacterEncoding( "UTF-8" );
	  Partner partner = (Partner) session.getAttribute("partner-object");
		User user = (User) session.getAttribute("user-object");
	  if (partner!=null){
		  String username = user.getUsername();
  		try{
  			EventsPDAO ep = new EventsPDAO();
  			List<Events> eventsP = ep.getEventsPartner(username);
  			session.setAttribute("eventP-list", eventsP);%>
  			<jsp:forward page="profile_partner.jsp"/>
  		<%} catch(Exception e) {
  			throw new Exception(e.getMessage());
  		}
  	} else {
  		  throw new Exception("Λυπουμάστε αλλά δεν έχετε συνδεθεί ως Συνεργάτης μας.");
  	}
	%>
