<%--
/**
 *
 * @author Freeroutes
 */
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="FRErrorPage.jsp"%>
<%@ page import= "java.io.*,Partner.*,Events.*,SUser.*,java.lang.*,Login_signUp.*,JoinUsers.*,java.util.*"%>
  <%
    request.setCharacterEncoding( "UTF-8" );
    String eventCode = request.getParameter("eventCode");
	Events event = (Events) session.getAttribute("fullevent-object");
	User user = (User) session.getAttribute("user-object");
	try {
      EventsDAO ep = new EventsDAO();
      Events eventP = ep.getFullevent(eventCode);
      session.setAttribute("fullevent-object", eventP);
	  PartnersDAO pa = new PartnersDAO();
      Partner partner = pa.getPartner(eventCode);
      session.setAttribute("fullPartner-object", partner);
	  if (user!=null){
		JoinSuserDAO js = new JoinSuserDAO();
		String join = js.getJoinSuser(eventCode, user.getUsername());
		request.setAttribute("joinOk",join);
	 }
  %>
      <jsp:forward page="fullevent.jsp"/>
  <%
		} catch(Exception e) {
			throw new Exception("Error "+e.getMessage());
		}
	%>
