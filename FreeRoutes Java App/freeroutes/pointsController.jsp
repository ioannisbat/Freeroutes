<%--
/**
 *
 * @author Freeroutes  */
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="FRErrorPage.jsp"%>
<%@ page import= "java.io.*,Events.*,SUser.*,Partner.*,JoinUsers.*,java.lang.*,Login_signUp.*,java.util.*"%>

<%
request.setCharacterEncoding( "UTF-8" );
try{
	Partner partner = (Partner) session.getAttribute("partner-object");
	if (partner == null) {
		throw new Exception("Λυπούμαστε δεν έχετε συνδεθεί ως συνεργάτης!");
	}

	User user = (User) session.getAttribute("user-object");
	Events event = (Events) session.getAttribute("event-object");
	List<JoinSuser> susers = (List<JoinSuser>) session.getAttribute("susers");
	// List<JoinSuser> joinUsers = (List<JoinSuser>) session.getAttribute("joins-users");

	JoinSuserDAO ju = new JoinSuserDAO();

	int i = 0;
	int minus;

		String check = "";
		for (JoinSuser suser : susers) {
			minus = 0;
		  i++;
		  check = request.getParameter("user" + i);
		  if ((check.equals("true")) && (!suser.getStatus().equals("yes"))) {
				ju.pointsSUser(suser.getUsername(), event.getPoints());
				ju.updateJoinSuser("yes", event.getEventCode(), suser.getUsername());
			} else if (check.equals("false") && suser.getStatus().equals("yes")) {
				minus -= event.getPoints();
				ju.pointsSUser(suser.getUsername(), minus);
				ju.updateJoinSuser("no", event.getEventCode(), suser.getUsername());
			} else if (check.equals("false")) {
				ju.updateJoinSuser("no", event.getEventCode(), suser.getUsername());
			}

		}
		boolean ok =true;
	request.setAttribute("ok",ok);
}catch(Exception e) {
	String error="Δεν έχετε συμπληρώσει τη συμμετοχή όλων των συμμετεχόντων. Επιστρέψτε και επαναλάβετε τη διαδικασία.";
	request.setAttribute("error",error);
}

%>
<jsp:forward page="partnerevent.jsp"/>
