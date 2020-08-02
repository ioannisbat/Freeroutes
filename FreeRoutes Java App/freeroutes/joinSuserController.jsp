<%--
/**
 *
 * @author Freeroutes
 */
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="FRErrorPage.jsp"%>
<%@ page import= "java.io.*,Suser.*,Events.*,java.lang.*,Login_signUp.*,java.util.*,JoinUsers.*"%>
  <%
    request.setCharacterEncoding( "UTF-8" );
	User user = (User) session.getAttribute("user-object");
	Events event = (Events) session.getAttribute("fullevent-object");
	try {
		if(user!=null){
		  JoinSuserDAO js = new JoinSuserDAO();
		  String join=js.joinSuser(event.getEventCode(),user.getUsername());
		  
		  if (join!=null){
		  request.setAttribute("joinOk", join);
		  }
		}else{
			String error="Δεν έχετε συνδεθεί ως χρήστης μας";
			request.setAttribute("error",error);
		}
  %>
      <jsp:forward page="fullevent.jsp"/>
  <%
		} catch(Exception e) {
			throw new Exception(e.getMessage());
		}
	%>