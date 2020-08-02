<%--
/**
 * 
 * @author Freeroutes  */
--%>

<%--   Set content type --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%--   Define error page --%>
<%@ page errorPage="FRErrorPage.jsp"%>

<%@ page import="java.io.*, java.lang.*,Partner.*,java.lang.*,Login_signUp.*"%>   

<!DOCTYPE html>
<html lang="en">

	<head>
		<link rel="shortcut icon" type="image/x-icon" href="images/rounded.png"/>
		<%
		request.setCharacterEncoding("UTF-8");
		Partner partner = (Partner) session.getAttribute("partner-object");
		if (partner == null) {
			throw new Exception("Please sign in as a partner!");
		}

		%>
		<title>Freeroutes</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/style.css">  <link rel="stylesheet" href="style.css">
		<link rel="stylesheet" href="css/about-us.css">  <link rel="stylesheet" href="about-us.css">
		<link rel="stylesheet" href="css/framework.css">  <link rel="stylesheet" href="framework.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<%--   Include page "header.jsp" --%>
		<jsp:include page="header.jsp" />
		
		<div class="container">
			<br>
			
			<%
				
			  if( request.getAttribute("msg")!= null) { %>		
					<div class="alert alert-danger text-center alert-dismissable" role="alert">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">×</a><%=request.getAttribute("msg").toString() %>
					</div>
			<% } %>
			
			<h1>Δημιουργία event:</h1>
				<p>Συμπληρώστε όλα τα απαιτούμενα πεδία</p>
				<div class="progress">
					<div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar"
						aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width:50%">
						50%
					</div>
				</div>
			
			<form class="form-horizontal" action="formController.jsp" method="POST">
				
				<div class="form-group">
					<label class="col-sm-1" for="usr">Τίτλος:</label>
						<div class="col-sm-12">
							<input name ="title" type="text" class="form-control" id="usr" placeholder="Title" required>
						</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-1" for="sel1">Είδος:</label>
					<div class="col-sm-12">
						<select class="form-control" id="sel1"name="optlogin1" required>
							<option value = "Ποδηλασία">Ποδηλασία</option>
							<option value = "Τρέξιμο">Τρέξιμο</option>
							<option value = "Ορειβασία">Ορειβασία</option>
							<option value = "Roller skating">Roller skating</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-4"  for="date">Ημερομηνία:</label>
						<div class="col-sm-12">
							<input name = "date" type="text" class="form-control" id="date" placeholder="DATE in dd/mm/yyyy format" required>
						</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-4"  for="address">Διεύθυνση:</label>  
						<div class="col-sm-12">
							<input  name="address" type="text" class="form-control"  placeholder="ADDRESS in number,street,municipality,zip format" required>
						</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-4"  for="time">Ώρα Συγκέντρωσης:</label>
					<div class="col-sm-12">
						<input name = "time" type="text" class="form-control" id="time" placeholder="Time in hh:mm format" required>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-4"  for="start">Σημείο Εκκίνησης:</label>
					<div class="col-sm-12">
						<input name = "start" type="text" class="form-control" id="start" placeholder="Starting point" required>
					</div>
				</div>
	
				<div class="form-group">
					<label class="col-sm-1"  for="route">Διαδρομή:</label>
					<div class="col-sm-12">
						<input name = "route" type="text" class="form-control" id="route" placeholder="Route" required>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-4"  for="level">Επίπεδο Διαδρομής:</label>
					<div class="col-sm-12">
						<select class="form-control" id="level" name="optlogin2" required>
							<option value = "Εύκολη">Εύκολη</option>
							<option value = "Μέτρια">Μέτρια</option>
							<option value = "Δύσκολη">Δύσκολη</option>
						</select>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-4"  for="comment">Χαρακτηριστικά Διαδρομής:</label>
					<div class="col-sm-12">
						<textarea name = "comment" class="form-control" rows="5" id="comment" placeholder="Comments Please" required></textarea>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-30 col-sm-30">
						<button type="submit" class="btn btn-default pull-right btn-md">Next</button>
					</div>
				</div>
				
				
				
			</form>
	
		</div>
		<br>
		<br>
		<br>
		<br>
		<!-- footer -->
	<%--    Include the page "footer.jsp"  --%>    
		<jsp:include page="footer.jsp" />
	<!-- End footer -->
	</body>
</html>