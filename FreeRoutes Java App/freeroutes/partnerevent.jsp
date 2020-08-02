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
Partner partner = (Partner) session.getAttribute("partner-object");
if (partner == null) {
	throw new Exception("Λυπούμαστε δεν έχετε συνδεθεί ως συνεργάτης!");
}

User user = (User) session.getAttribute("user-object");
Events event = (Events) session.getAttribute("event-object");
List<JoinSuser> susers = (List<JoinSuser>) session.getAttribute("susers");
List<JoinSuser> joinUsers = (List<JoinSuser>) session.getAttribute("joins-users");
%>

<!DOCTYPE html>
<html lang="en">

	<head>
	  <link rel="shortcut icon" type="image/x-icon" href="images/rounded.png"/>
	  <title>Freeroutes <%=event.getEvenTitle()%></title>
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
			<div class="col-sm-12" >
				<div class="thumbnail">
					<div class="row">
						<br>
						<div class="col-md-4 text-center">
							<div class="image-rounded" style="position: relative;">
								<h2 style="position: absolute; right: 0; width: 100%;">
								<span class="Span1" style="font-size: 12px;">
								<%=event.getEvenTitle()%>:<br> <%=event.getDate()%>
								</span>
								</h2>
							<img class="img-responsive img-rounded" src="<%=event.getPhoto()%>" alt="<%=event.getEvenTitle()%> Photo" style="width:300px;height:200px">
							</div>
							<br>
						</div>
						<div class="col-md-8">
							<p>
								<b>Ημερομηνία:</b> <%=event.getDate()%><br>
								<b>Ώρα συγκέντρωσης:</b> <%=event.getTime()%><br>
							</p>
							<p>
								<b>Διαδρομή:</b> <%=event.getRoute()%> <b>[<%=event.getLevel()%>]</b><br>
								<b>Σημείο εκκίνησης:</b> <%=event.getStartPoint()%><br>
							</p>
							<p>
								<b>Σχόλια διαδρομής:</b> <%=event.getComments()%><br>
							</p>
							<p>
								<h4><span class="label label-warning">Έπαθλο συμμετοχής:</span> <%=event.getPoints()%></h4>
							</p>
						</div>
						<br>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table table-striped" style="background-color : #FFFFFF;" >
						<thead>
							<tr>
								<th>Όνομα</th>
								<th>Επώνυμο</th>
								<th>Username</th>
								<th>Συμμετοχή</th>
							</tr>
						</thead>
						<tbody>
						<% int i=0;
							try {
									for (JoinSuser suser : susers) {
										i++;                              %>
										<tr>
											<td><%=suser.getName()%></td>
											<td><%=suser.getSurname()%></td>
											<td><%=suser.getUsername()%></td>
											<form method = 'get' action = 'pointsController.jsp'>
											<td>
											<% if (suser.getStatus().equals("yes")) { %>
												<label class="radio-inline active">
											  	<input type="radio" name="user<%=i%>" value="true" checked="">Ήρθε
												</label>
												<label class="radio-inline">
													<input type="radio" name="user<%=i%>" value="false">Δεν ήρθε
												</label>
											<% } else if (suser.getStatus().equals("no")) { %>
												<label class="radio-inline">
											  	<input type="radio" name="user<%=i%>" value="true" >Ήρθε
												</label>
												<label class="radio-inline active">
													<input type="radio" name="user<%=i%>" value="false" checked="">Δεν ήρθε
												</label>
											<% } else { %>
												<label class="radio-inline">
													<input type="radio" name="user<%=i%>" value="true">Ήρθε
												</label>
												<label class="radio-inline">
													<input type="radio" name="user<%=i%>" value="false">Δεν ήρθε
												</label>
											<% } %>
											</td>
										</tr>
									<%}
										if(i>0){%><tr>
										<td colspan="4">
													<button type="submit" class="btn btn-warning pull-right">Επιβεβαίωση</button>
												</form>
											</td></tr>
									<%}else{%>
									<tr class='warning'>
										<td colspan='4' style='text-align: center;'>Δεν βρέθηκαν Χρήστες που να έχουν κάνει Συμμετοχή ακόμη</td>
									</tr>
								<%}
							}catch (Exception e){
								throw new Exception(e.getMessage());
							}%>
						</tbody>
					</table>
				</div>
				<br>
			</div>
		</div>


 <br>
<br>
<br>
<br>


 <% if(request.getAttribute("ok") != null) {		%>
        <script type="text/javascript">
      $(window).load(function(){
        $('#checkJoins').modal('show');
      });
    </script>
    <%}%>
		<div class="modal fade" id="checkJoins" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal">&times;</button>
					  <h4 class="modal-title">Check Join Complete</h4>
					</div>
					<div class="modal-body" style="text-align:center">
						<h4>Ο έλεγχος των συμμετεχόντων έγινε με επιτυχία!</h4>
						<h4>Πατήστε "Επιστροφή" για να επιστρέψετε στο προφίλ σας</h4>

					</div>
					<div class="form-group modal-footer">
							<a href="profile_partner.jsp"><button type="button" class="btn btn-success">Επιστροφή</button></a>
							</div>
				</div>
			</div>
		</div>


	<% if(request.getAttribute("error") != null) {		%>
        <script type="text/javascript">
      $(window).load(function(){
        $('#error').modal('show');
      });
    </script>
    <%}%>
		<div class="modal fade" id="error" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal">&times;</button>
					  <h4 class="modal-title">Ελλειπής συμπλήρωση!</h4>
					</div>
					<div class="modal-body">
						<div class="alert alert-danger text-center" role="alert"><p>Δεν έχετε συμπληρώσει τη συμμετοχή όλων των συμμετεχόντων. </p>
						<p>Επιστρέψτε και επαναλάβετε τη διαδικασία.</p></div>
					</div>
					<div class="modal-footer">
        <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
      </div>
				</div>
			</div>
		</div>
<!-- footer -->
	<%--    Include the page "footer.jsp"  --%>
<jsp:include page="footer.jsp" />
	<!-- End footer -->
	</body>
</html>
