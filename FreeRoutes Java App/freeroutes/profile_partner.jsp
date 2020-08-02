<%--
/**
 *
 * @author Freeroutes  */
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="FRErrorPage.jsp"%>
<%@ page import= "java.io.*,Events.*,Partner.*,java.lang.*,Login_signUp.*,java.util.*, java.sql.Date"%>

<!DOCTYPE html>
<html lang="en">

	<head>
	  <link rel="shortcut icon" type="image/x-icon" href="images/rounded.png"/>
	  <%
		request.setCharacterEncoding( "UTF-8" );
		Partner partner = (Partner) session.getAttribute("partner-object");
		if (partner == null) {
			throw new Exception("Λυπούμαστε δεν έχετε συνδεθεί ως συνεργάτης!");
		}


		User user = (User) session.getAttribute("user-object");
		List<Events> eventsP  = (List<Events>) session.getAttribute("eventP-list");
		java.util.Date utilDate = new java.util.Date();
	  %>
	  <title><%=partner.getPartnersName()%> Profile</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	  <link rel="stylesheet" href="css/style.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	</head>

	<body>

		<%--   Include page "header.jsp" --%>
		<jsp:include page="header.jsp" />
	<br>
	<br>
	<br>
	  <div class="container">
		<div class="col">
		  <div class="col-md-4">
			  <div class="thumbnail">
				<h3 class="text-center"><%=partner.getPartnersName()%></h3>
				<%if (partner.getPhoto()==null){%>
					<p style="text-align:center"><a href="addimage.jsp" title="Add Image" ><img class="img-circle img-responsive center-block" src="images/photoavatar.jpg" width="200" height="200"></a></p>
				<%}else{ %>
					<a href="addimage.jsp" title="Upload new photo"><img class="img-circle img-responsive center-block" src="<%=partner.getPhoto()%>" alt="<%=partner.getPartnersName()%>" width="200" height="200"></a>
				<%}%>
				<div class="container-fluid">
					<h4 class="text-center"> <span class="glyphicon glyphicon-info-sign"></span> Γενικά στοιχεία</h4>
				  <p>
					<span class="glyphicon glyphicon-road"></span> <%=partner.getTypeEvent()%>
				  </p>
				  <p>
					<span class="glyphicon glyphicon-home"></span>
					<%=partner.getStreet()%> <%=partner.getNumber()%>, <%=partner.getZip()%>, <%=partner.getMunicipality()%>
				  </p>
				  <p>
						<span class="glyphicon glyphicon-envelope"></span> <%=user.getEmail()%>
				  </p>
				  <p>
					<span class="glyphicon glyphicon-globe"></span> <a href="<%=partner.getFacebook()%>" target="_blank">Facebook Page</a>
				</p>
				<h4 class="text-center"> <span class="glyphicon glyphicon-user"></span> Στοιχεία Υπεύθυνου</h4>
				<p><%=partner.getContactName()%> <%=partner.getContactSurname()%></p>
				  <p>
						<span class="glyphicon glyphicon-earphone"></span> <%=partner.getContactPhone()%>
				  </p>
				  <h4 class="text-center"><span class="glyphicon glyphicon-pencil"></span> Περιγραφή</h4>
				  <p><%=partner.getDescription()%></p>
			  </div>
			</div>
		  </div>
		  <div class="col-md-8 text-center">
				<div class="thumbnail">
				<h3>Μελλοντικά events</h3><br>
				  <div class="row">
					<%try {
						for (Events event : eventsP) {
							if (event.getDate().after(utilDate)) {%>
								<div class="col-md-4">
								  <div class="image-rounded" style="position: relative;">
									<h2 style="position: absolute; right: 0; width: 100%;">
									<span class="Span1" style="font-size: 12px;">
									<%=event.getEvenTitle()%>: <%=event.getDate()%>
									</span>
									</h2>
									<a href="partnerEventController.jsp?eventCode=<%=event.getEventCode()%>">
									  <img class="img-responsive img-rounded" src="<%=event.getPhoto()%>" alt="<%=event.getEvenTitle()%> Photo" style="width:300px;height:200px">
									</a>
								  </div>
								  <br>
								</div>
							<%}
						}
					}catch (Exception e2){
						throw new Exception(e2.getMessage());
					}%>
				  <br>
				  </div>
			  </div>
			  <div class="thumbnail">
				<h3>Events που έχουν διοργανωθεί <span><a href="form.jsp" class="btn btn-warning pull-right" role="button">Δημιουργία event</a></span></h3><br>
				  <div class="row">
					<%try {
						for (Events event2 : eventsP) {
							if (event2.getDate().before(utilDate)) {%>
								<div class="col-md-4">
								  <div class="image-rounded" style="position: relative;">
								  <a href="partnerEventController.jsp?eventCode=<%=event2.getEventCode()%>">
									<h2 style="position: absolute; right: 0; width: 100%;">
									<span class="Span1" style="font-size: 12px;">
									<%=event2.getEvenTitle()%>: <%=event2.getDate()%>
									</span>
									</h2>

									  <img class="img-responsive img-rounded" src="<%=event2.getPhoto()%>" alt="<%=event2.getEvenTitle()%> Photo" style="width:300px;height:200px">
									</a>
								  </div>
								  <br>
								</div>
							<%}
						}
					}catch (Exception e2){
						throw new Exception(e2.getMessage());
					}%>
				  <br>
				  </div>
			  </div>
		  </div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>  <!-- footer -->
	<%--    Include the page "footer.jsp"  --%>
<jsp:include page="footer.jsp" />
	</body>

</html>
