<%--
/**
 * 
 * @author Freeroutes
 */
--%>

<%--   Set content type --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%--   Define error page --%>
<%@ page errorPage="FRErrorPage.jsp"%>

<%--   Import necessary libs --%>
<%@ page import= "java.io.*,Events.*,java.util.ArrayList,java.util.List,java.util.Date"%>
<%
	String id = request.getParameter("id");
    List<Events> events = new ArrayList<Events>();
	EventsDAO eVd = new EventsDAO();
	if(id.equals("1")){
		events = (List) eVd.filterEvents("Τρέξιμο");
	} else if (id.equals("2")){
		events = (List) eVd.filterEvents("Ποδηλασία");
	} else if (id.equals("3")) {
		events = (List) eVd.filterEvents("Ορειβασία");
	} else if (id.equals("4")){
		events = (List) eVd.filterEvents("Roller skating");
	} else if (id.equals("5")){
		events = (List) eVd.filterTimE("Πρόσφατα");
	} else if (id.equals("6")){
		events = (List) eVd.filterTimE("Μελλοντικά");
	}
	
	request.setAttribute("ListE",events );
	
%>
	<jsp:forward page="event.jsp"/>