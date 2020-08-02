<%--
/**
 * 
 * @author Freeroutes 
 */
--%>

<%--   Set content type --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.io.*,java.util.*,Login_signUp.*,java.lang.*,java.text.SimpleDateFormat,java.time.*,Events.*"%>

<%--   Define error page --%>
<%@ page errorPage="FRErrorPage.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");
	User user = (User) session.getAttribute("user-object");
	String usrnm = user.getUsername();
	//reading parameters from request
	String title = request.getParameter("title");
	String eidos = request.getParameter("optlogin1");
	String datev = request.getParameter("date");
	String adressEv = request.getParameter("address");
	String time = request.getParameter("time");
	String route = request.getParameter("route");
	String level = request.getParameter("optlogin2");
	String startp = request.getParameter("start");
	String comments = request.getParameter("comment");
	int points = -1;
	String errormsg = null;
	List<String> mon30 = Arrays.asList("01","06","09","11");

	if(title == null || title.length() == 0) {
		
		errormsg = "<strong>Το πεδίο Τίτλος δεν είναι έγκυρο!</strong>";
		request.setAttribute("msg",errormsg );
		
%>
	<jsp:forward page="forma.jsp"/>
<%
		
	}
	
	if(eidos == null || eidos.length() == 0) {
		
		errormsg = "<strong>Το πεδίο Είδος δεν είναι έγκυρο!</strong>";
		request.setAttribute("msg",errormsg );
%>
	<jsp:forward page="forma.jsp"/>
<%
		
	}
	if( datev == null || datev.length() == 0) {
		
		errormsg = "<strong>Το πεδίο Ημερομηνία δεν είναι έγκυρο!</strong>";
		request.setAttribute("msg",errormsg );
%>
	<jsp:forward page="forma.jsp"/>

	
<%
	} else {
		
		String[] parts = datev.split("/");
		
		if (parts.length < 3) {
			
			errormsg = "<strong>To πεδίο Ημερομηνία δεν είναι επαρκές!</strong>";
			request.setAttribute("msg",errormsg );
		%>
			<jsp:forward page="forma.jsp"/>

		<%		
		}
		int year = Integer.parseInt(parts[2]);
		int month = Integer.parseInt(parts[1]);
		int day = Integer.parseInt(parts[0]);
		int flag = -1;
		
		if (month > 12 || month <= 0) {
			
			errormsg = "<strong>Ο μήνας στο πεδίο Ημερομηνία δεν είναι έγκυρος!</strong>";
			request.setAttribute("msg",errormsg );
%>
	<jsp:forward page="forma.jsp"/>

<%			
		} else {
			
			Iterator<String> itr = mon30.iterator();
			
			while (itr.hasNext()) {
				if(itr.next().equals(parts[1])) {
					flag = 1;
				}
			}
		}
		
		if ((day <= 0 || day > 31) || (day > 30 && flag == 1) || (day > 28 && parts[1].equals("02"))) {
			
			errormsg = "<strong>Η μέρα στο πεδίο Ημερομηνία δεν είναι έγκυρη!</strong>";
			request.setAttribute("msg",errormsg );
%>
	<jsp:forward page="forma.jsp"/>

<%		
		}
		int thisYear = Year.now().getValue();
		
		if (year < thisYear) {
			
			errormsg = "<strong>Το έτος στο πεδίο Ημερομηνία δεν είναι έγκυρο!</strong>";
			request.setAttribute("msg",errormsg );
%>
	<jsp:forward page="forma.jsp"/>

<%	
		}
	}
	if (adressEv == null || adressEv.length() == 0){
	
		errormsg = "<strong>Το πεδίο Διεύθυνση δεν είναι έγκυρο!</strong>";
		request.setAttribute("msg",errormsg );
%>	
	<jsp:forward page="forma.jsp"/>
<%
		
	} else {
		
		String[] parts = adressEv.split(",");
		if (parts.length < 4) {
			
			errormsg = "<strong>Το πεδίο Διεύθυνση δεν έχει συμπληρωθεί επαρκώς!</strong>";
			request.setAttribute("msg",errormsg );
%>	
	<jsp:forward page="forma.jsp"/>
<%
		}
		
	}
	if( time == null || time.length() == 0) {
		
		errormsg = "<strong>Το πεδίο Ώρα Συγκέντρωσης δεν είναι έγκυρο!</strong>";
		request.setAttribute("msg",errormsg );
%>
	<jsp:forward page="forma.jsp"/>
<%
		
	} else {
		String[] parts = time.split(":");
		if (parts.length < 2) {
			
			errormsg = "<strong>Το πεδίο Ώρα δεν έχει συμπληρωθεί επαρκώς!</strong>";
			request.setAttribute("msg",errormsg );
			
%>
	<jsp:forward page="forma.jsp"/>
<%
		}
		int hour = Integer.parseInt(parts[0]);
		int minutes = Integer.parseInt(parts[1]);
		
		if ( (hour > 23 || hour < 0) || (minutes < 0 || minutes > 59)){
			
			errormsg = "<strong>Το πεδίο Ώρα Συγκέντρωσης δεν είναι έγκυρο!</strong>";
			request.setAttribute("msg",errormsg );
%>
	<jsp:forward page="forma.jsp"/>
<%
			
		}
	}
	
	if( route == null || route.length() == 0) {
		
		errormsg = "<strong>Το πεδίο Διαδρομή δεν είναι έγκυρο!</strong>";
		request.setAttribute("msg",errormsg );

%>
	<jsp:forward page="forma.jsp"/>
<%
		
	}
	
	if( level == null || level.length() == 0) {
		
		errormsg = "<strong>Το πεδίο Επίπεδο Διαδρομής δεν είναι έγκυρο!</strong>"; 
		request.setAttribute("msg",errormsg );
%>
	<jsp:forward page="forma.jsp"/>
<%		
	} else {
		
		if (level.equals("Εύκολη")){
			points = 15;
		} else if (level.equals("Μέτρια")) {
			points = 25;
		} else {
			points = 35;
		}
	}
	
	if( startp == null || startp.length() == 0) {
		
		errormsg = "<strong>Το πεδίο Σημείο Εκκίνησης δεν είναι έγκυρο!</strong>";
		request.setAttribute("msg",errormsg );
%>
	<jsp:forward page="forma.jsp"/>
<%
		
	}
	
	if( comments == null || comments.length() == 0) {
		
		errormsg = "<strong>Το πεδίο Χαρακτηριστικά Διαδρομής δεν είναι έγκυρο!</strong>";
		request.setAttribute("msg",errormsg );
		
	
%>
	<jsp:forward page="forma.jsp"/>
<%
	
	}
	
	String[] parts = adressEv.split(",");
	int number = Integer.parseInt(parts[0]);
	String street = parts[1];
	String mun = parts[2];
	String zip = parts[3];
	if (zip.length() < 5 ) {
		
		errormsg = "<strong>Ο Τ.Κ στο πεδίο Διεύθυνση δεν είναι έγκυρος!</strong>";
		request.setAttribute("msg",errormsg );
	%>
	<jsp:forward page="forma.jsp"/>
	<%	
	}
		
		EventsDAO dao = new EventsDAO();
		String ev = dao.insertEvent(usrnm, title, eidos, datev, time, number, street, zip, mun, route, level, comments, points, startp );
		session.setAttribute("codeV",ev);
		

%>
<jsp:forward page="form2.jsp"/>