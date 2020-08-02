<%--
/**
 *
 * @author Freeroutes
 */
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="FRErrorPage.jsp"%>
<%@ page import= "java.io.*,Events.*,Partner.*,SUser.*,java.lang.*,Login_signUp.*,java.util.*"%>

<%
request.setCharacterEncoding( "UTF-8" );
Events event = (Events) session.getAttribute("fullevent-object");
Partner fPartner = (Partner) session.getAttribute("fullPartner-object");
SUser suser = (SUser) session.getAttribute("suser-object");
Partner partner = (Partner)  session.getAttribute("partner-object");
String join = (String) request.getAttribute("joinOk");

%>

<!DOCTYPE html>
<html lang="en">

	<head>
	  <link rel="shortcut icon" type="image/x-icon" href="images/rounded.png"/>
	  <title><%=event.getEvenTitle()%></title>
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
  <div class="container">
    <div class="col-sm-12" >
	<%if (event!=null){%>
      <div class="thumbnail">
          <h3 class="text-center">Σχετικά με το event:</h3>
					<div class="row">
						<br>
						<div class="col-md-4 text-center">
							<div class="image-rounded" style="position: relative;">
								<h2 style="position: absolute; right: 0; width: 100%;">
								<span class="Span1" style="font-size: 14px;">
								<%=event.getEvenTitle()%>:<br> <%=event.getDate()%>
								</span>
								</h2>
							<img class="img-responsive img-rounded" src="<%=event.getPhoto()%>" alt="<%=event.getEvenTitle()%> Photo" style="width:300px;height:200px">
							</div>
							<br>
						</div>
						<div class="col-md-8">
							<% if (partner==null) {
								if (join!=null){%>
								<span class="pull-right">
									<a href=""><button type="button" class="btn btn-success">Συμμετέχετε</button>
								  </a>
								</span>
								<%}else{%>
									  <span class="pull-right">
									  <a href="joinSuserController.jsp">
									  <button type="button" class="btn btn-warning">Συμμετοχή</button></a>
									</span>
								<br>
								<%}
							}%>
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
	<%}else{
		  throw new Exception("Κάποιο πρόβλημα υπήρχε με τον εντοπισμό του event");
	  }%>
	  <%if (fPartner!=null){%>
      <div class="thumbnail">
        <h3 class="text-center">Σχετικά με τον διοργανωτή:</h3>
        <div class="row">
          <div class="col-sm-2">
            <img src="<%=fPartner.getPhoto()%>" class="img-rounded" alt="<%=fPartner.getPartnersName()%>" style="max-width: 100%;display:block" height="150">
            <br>
          </div>
          <div class="col-sm-10">
            <br>
              <p>
				<%=fPartner.getDescription()%>
              </p>
              <br>
              <span class="glyphicon glyphicon-road"></span>
              <%=fPartner.getTypeEvent()%>
              <span class="glyphicon glyphicon-envelope"></span>
              <a href="mailto:<%=fPartner.getEmail()%>"><%=fPartner.getEmail()%></a>
              <span class="glyphicon glyphicon-earphone"></span>
              <%=fPartner.getContactPhone()%>
              <span class="glyphicon glyphicon-globe"></span>
      				<a href="<%=fPartner.getFacebook()%>" target="_blank">Facebook Page</a>
          </div>
        </div>
      </div>
	  <%}else{
		  throw new Exception("Κάποιο πρόβλημα υπήρχε με τον εντοπισμό του συνεργάτη");
	  }%>
  </div>
</div>

 <br>
<br>
<br>
<br>  
<% if(request.getAttribute("error") != null) { %>
  <script type="text/javascript">
    $(window).load(function(){
      $('#errorLogin').modal('show');
    });
  </script>
<%}%>
		<div class="modal fade" id="errorLogin" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal">&times;</button>
					  <h4 class="modal-title">Δεν έχετε συνδεθεί</h4>
					</div>
					<div class="modal-body" style="text-align:center">	
						<h4>Δεν έχετε συνδεθεί ή εγγραφεί για να μπορέσετε να συμμετάσχετε!</h4>
					</div>
					<div class="form-group modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal">Επιστροφή</button>
							
							</div>
				</div>
			</div>
		</div>



<!-- footer -->
	<%--    Include the page "footer.jsp"  --%>
<jsp:include page="footer.jsp" />
	<!-- End footer -->
</body>
</body>

</html>
