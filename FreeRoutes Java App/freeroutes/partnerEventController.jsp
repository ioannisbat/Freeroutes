<%--
/**
 *
 * @author Freeroutes 
 */
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="FRErrorPage.jsp"%>
<%@ page import= "java.io.*,Events.*,SUser.*,Partner.*,JoinUsers.*,java.lang.*,Login_signUp.*,java.util.*"%>
  <%
    request.setCharacterEncoding( "UTF-8" );
    Partner partner = (Partner) session.getAttribute("partner-object");
    if (partner == null) {
      throw new Exception("Λυπούμαστε δεν έχετε συνδεθεί ως συνεργάτης!");
    }

    User user = (User) session.getAttribute("user-object");

    if (partner!=null){
      String username = user.getUsername();
      String eventCode = request.getParameter("eventCode");
      try{
        EventsPDAO ep = new EventsPDAO();
		    JoinUsers ju = new JoinUsers();
        Events eventP = ep.getEventPartner(username, eventCode);
		    List<JoinSuser> users =  ju.getUsers(eventCode);
        List<JoinSuser> joinUsers =  ju.getJoinUsers(eventCode);
		    session.setAttribute("susers",users);
        session.setAttribute("event-object", eventP);%>
        session.setAttribute("joins-users",joinUsers);
        <jsp:forward page="partnerevent.jsp"/>
      <%} catch(Exception e) {
        throw new Exception(e.getMessage());
      }
    } else {
        throw new Exception("Λυπουμάστε αλλά δεν έχετε συνδεθεί ως Συνεργάτης μας.");
    }
	%>
