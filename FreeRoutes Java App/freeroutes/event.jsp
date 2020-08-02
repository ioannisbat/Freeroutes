<%--
/**
 *
 * @author Freeroutes */
--%>

<%--   Set content type --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%--   Define error page --%>
<%@ page errorPage="FRErrorPage.jsp"%>

<%--   Import necessary libs --%>
<%@ page import= "java.io.*,Partner.*,Events.*,java.util.Date,java.util.ArrayList,java.util.List"%>
<%
request.setCharacterEncoding( "UTF-8" );
Partner partner = (Partner) session.getAttribute("partner-object");
%>
<!DOCTYPE html>
<html lang="en">

	<head>
	  <link rel="shortcut icon" type="image/x-icon" href="images/rounded.png"/>
	  <title>Freeroutes</title>
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


		<div class="container">
			<br>
			<h1>Όλα τα events
			<%if (partner!=null){%><span class="pull-right"><a href="form.jsp" class="btn btn-warning" role="button">Δημιουργία event</a></span><%}%>
			</h1>
			<br>
			<br>
			<div class="btn-group">
				<button type="button" class="btn btn-warning">Ταξινόμηση κατά:</button>
				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
															Είδος <span class="caret"></span></button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="Categories.jsp?id=1">Τρέξιμο</a></li>
							<li><a href="Categories.jsp?id=2">Ποδηλασία</a></li>
							<li><a href="Categories.jsp?id=3">Ορειβασία</a></li>
							<li><a href="Categories.jsp?id=4">Roller skating</a></li>
						</ul>
				</div>

				<div class="btn-group">
					<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
														Ημερομηνία <span class="caret"></span></button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="Categories.jsp?id=5">Πιο πρόσφατα</a></li>
							<li><a href="Categories.jsp?id=6">Μελλοντικά</a></li>
						</ul>
				</div>

			</div>
			<br>
			<br>

			<div class="row text-center">
			<br>
			<br>
			<% if(request.getAttribute("ListE")!= null) {
					try {

						List<Events> event = (List)request.getAttribute("ListE");
						int sum = 0;

						for (Events i : event){

							sum = sum + 1;%>
							<div class="col-md-3">
								<div class="image-rounded" style="position: relative;">
								<a href="fulleventController.jsp?eventCode=<%=i.getEventCode()%>">
									<h2 style="position: absolute; right: 0; width: 100%; ">
										<span class="Span1" style="font-size: 12px;"> <%=i.getEvenTitle()%> : <%=i.getDate()%> </span>
									</h2>
									
										<img class="img-responsive img-rounded center-block imagX" src=<%=i.getPhoto()%> alt="Freeday Photo" style="width:300px;height:200px">
									</a>
								</div>
								<br>
							</div>

						<%}
						%>
			</div>

					<%
						if (sum == 0) {%>
							<div class="alert alert-danger text-center" role="alert">Λυπούμαστε! Δεν υπάρχει κάποιο σχετικό Event!</div>
					<%}

				} catch (Exception e) {

					throw new Exception(e.getMessage());
				}

			} else {

				List<Events> events = new ArrayList<Events>();
				EventsDAO eVd = new EventsDAO();
				events = eVd.returnAllEv ();

					for (Events i : events){%>

						<div class="col-md-3">
							<div class="image-rounded" style="position: relative;">
								<h2 style="position: absolute; right: 0; width: 100%; ">
									<span class="Span1" style="font-size: 12px;"> <%=i.getEvenTitle()%> : <%=i.getDate()%> </span>
								</h2>
								<a href="fulleventController.jsp?eventCode=<%=i.getEventCode()%>">
									<img class="img-responsive img-rounded center-block imagX" src=<%=i.getPhoto()%> alt="Freeday Photo" style="width:300px;height:200px">
								</a>
							</div>
							<br>
						</div>

				  <%}%>
			</div>
				<%
			}%>
			<br>
			<br>
			<br>
			<br>
	</div>
	<!-- footer -->
	<%--    Include the page "footer.jsp"  --%>
			<jsp:include page="footer.jsp" />
			<!-- End footer -->


	</body>

</html>
