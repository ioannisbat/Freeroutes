<%--
/**
 * A header, included in top of every jsp page.
 *
 * @author Freeroutes
 */
--%>

<%--   Set content type --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%--   Define error page --%>
<%@ page errorPage="FRErrorPage.jsp" %>

<%@ page import= "java.io.*,Login_signUp.*,Partner.*, SUser.*,java.lang.*"%>

<nav class="navbar navbar-default" style="margin-bottom: 0;">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.jsp">Freeroutes</a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
          <li><a href="index.jsp">Home</a></li>
          <li><a href="event.jsp">Events</a></li>
          <li><a href="partners_listController.jsp">Partners</a></li>
        </ul>
		<%
		request.setCharacterEncoding( "UTF-8" );
		Login fr = new Login();
		User user = (User) session.getAttribute("user-object");
		if (user!=null){
				String username=user.getUsername();%>
			<ul class="nav navbar-nav navbar-right">
			<% SUser suser = fr.authenticateSUser(username);
				if (suser == null){
					Partner partner = fr.authenticatePartner(username);
					session.setAttribute("partner-object",partner);
					%>
				<li class="active"><a href="partnerController.jsp"><span class="glyphicon glyphicon-user"></span> <%=username%></a></li>
				<%}else{
					session.setAttribute("suser-object",suser);%>
			<li class="active"><a href="profile_user.jsp"><span class="glyphicon glyphicon-user"></span> <%=username%></a></li>
				<%}%>
				<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
			</ul>
		<%}  else {%>
        <ul class="nav navbar-nav navbar-right">
          <li><a href="" data-toggle="modal" data-target="#parthnersignup"><span class="glyphicon glyphicon-briefcase"></span> Partner Sign Up</a></li>
          <li><a href="" data-toggle="modal" data-target="#usersignup"><span class="glyphicon glyphicon-user"></span> User Sign Up</a></li>
          <li><a href="" data-toggle="modal" data-target="#login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        </ul>
		<%}%>
      </div>
    </div>
</nav>
<% if(request.getAttribute("msgl") != null) { %>
  <script type="text/javascript">
    $(window).load(function(){
      $('#login').modal('show');
    });
  </script>
<%}%>
	<div class="modal fade" id="login" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Login</h4>
				</div>
				<div class="modal-body">
					<% if(request.getAttribute("msgl") != null) { %>
						<div class="alert alert-danger text-center" role="alert"><%=request.getAttribute("msgl").toString() %></div>
					<%}%>
						<form method='POST' action='loginController.jsp'>
							<div class="form-group">
							  <label for="logmail">Username:</label>
							  <input type="text" class="form-control" id="loguser" name="username" required>
							</div>
							<div class="form-group">
							  <label for="logpwd">Password:</label>
							  <input type="password" class="form-control" id="logpwd" name="password" required>
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-success">Log in</button>
							</div>
						  </form>
				</div>
			</div>
		</div>
	</div>
    <% if(request.getAttribute("msgS") != null || request.getAttribute("msgSU") != null ) {		%>
        <script type="text/javascript">
      $(window).load(function(){
        $('#usersignup').modal('show');
      });
    </script>
    <%}%>
		<div class="modal fade" id="usersignup" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal">&times;</button>
					  <h4 class="modal-title">User Sign Up</h4>
					</div>
					<div class="modal-body">
					<% if(request.getAttribute("msgS") != null || request.getAttribute("msgSU") != null) { %>
						<%if (request.getAttribute("msgSU") != null){%>
							<div class="alert alert-danger text-center" role="alert"><%= request.getAttribute("msgSU").toString() %></div>
						<%}else if(request.getAttribute("msgS") != null){%>
							<div class="alert alert-danger text-center" role="alert"><%=request.getAttribute("msgS").toString() %></div>
						<%}}%>
						
						<form method='POST' action='signUpUserController.jsp'>
							<div class="form-group">
							  <label for="email">Email:</label>
							  <input type="email" class="form-control" id="email" name="email_user" required>
							</div>
							<div class="form-group">
							  <label for="pwd">Password:</label>
							  <input type="password" class="form-control" id="pwd" name="password_user" required>
							</div>
							<div class="form-group">
							  <label for="cpwd">Επιβεβαίωση password:</label>
							  <input type="password" class="form-control" id="cpwd" name="password_user_2" required>
							</div>
							<div class="form-group">
							  <label for="fname">Όνομα:</label>
							  <input type="text" class="form-control" id="fname" name="name_user" required>
							</div>
							<div class="form-group">
							  <label for="lname">Επώνυμο:</label>
							  <input type="text" class="form-control" id="lname" name="surname_user" required>
							</div>
							<%if(request.getAttribute("msgSU") != null){%>
								<div class="form-group has-error has-feedback">
								  <label for="lname">Username:</label>
								  <input type="text" class="form-control" id="lname" name="username" required>
								  <span class="glyphicon glyphicon-remove form-control-feedback"></span>
								</div>
							<%}else{%>
								<div class="form-group">
								  <label for="lname">Username:</label>
								  <input type="text" class="form-control" id="lname" name="username" required>
								</div>
							<%}%>
							<div class="form-group modal-footer">
							<button type="submit" class="btn btn-success">Sign up</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<% if(request.getAttribute("msgP") != null || request.getAttribute("msgPU") != null) { %>
		<script type="text/javascript">
		  $(window).load(function(){
			$('#parthnersignup').modal('show');
		  });
		</script>
		<%}%>
		<div class="modal fade" id="parthnersignup" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal">&times;</button>
					  <h4 class="modal-title">Partner Sign Up</h4>
					</div>
					<div class="modal-body">
						<% if(request.getAttribute("msgP") != null || request.getAttribute("msgPU") != null) { %>
							<%if (request.getAttribute("msgPU") != null){%>
								<div class="alert alert-danger text-center" role="alert"><%=request.getAttribute("msgPU").toString() %></div>
							<%}else if(request.getAttribute("msgP") != null){%>
								<div class="alert alert-danger text-center" role="alert"><%=request.getAttribute("msgP").toString() %></div>
							<%}
						}%>
						<form method='POST' action='signUpPartnerController.jsp'>
							<div class="form-group">
							  <label for="pmail">Όνομα Οργανισμού:</label>
							  <input type="text" class="form-control" id="pname" name="name_partner" required>
							</div>
							<div class="form-group">
							  <label for="pmail">Email Οργανισμού:</label>
							  <input type="email" class="form-control" id="pmail" name="email_partner" required>
							</div>
							<div class="form-group">
							  <label for="ppwd">Password:</label>
							  <input type="password" class="form-control" id="ppwd" name="password_partner" required>
							</div>
							<div class="form-group">
							  <label for="pcpwd">Επιβεβαίωση password:</label>
							  <input type="password" class="form-control" id="pcpwd" name="password_partner_2" required>
							</div>
							<div class="form-group">
							  <label for="cfname">Όνομα Υπεύθυνου:</label>
							  <input type="text" class="form-control" id="cfname" name="name_cf" required>
							</div>
							<div class="form-group">
							  <label for="clname">Επίθετο Υπεύθυνου:</label>
							  <input type="text" class="form-control" id="clname" name="surname_cf" required>
							</div>
							<div class="form-group">
							  <label for="phone">Τηλέφωνο Υπεύθυνου:</label>
							  <input type="text" class="form-control" id="phone" name="phone_cf" required>
							</div>
							<div class="form-group">
							  <label for="type">Δραστηρότητα οργανισμού:</label>
							  <select class="form-control" id="type" name="type" required>
								<option>Διάφορα</option>
								<option>Ποδηλασία</option>
								<option>Τρέξιμο</option>
								<option>Ορειβασία</option>
								<option>Roller skating</option>
							  </select>
							</div>
							<div class="form-group">
							  <label for="city">Πόλη:</label>
							  <input type="text" class="form-control" id="city" name="city" required>
							</div>
							<div class="form-group">
							  <label>Οδός:</label>
							  <input type="text" class="form-control" id="street" name="street" required>
							</div>
							<div class="form-group">
							  <label>Αριθμός:</label>
							  <input type="text" class="form-control" id="number" name="number" required>
							</div>
							<div class="form-group">
							  <label for="zip">ΤΚ:</label>
							  <input type="text" class="form-control" id="zip" name="zip" required>
							</div>
							<div class="form-group">
							  <label>Περιγραφή οργανισμού:</label>
							  <textarea class="form-control" rows="5" id="description" name="description" required></textarea>
							</div>
							<div class="form-group">
							  <label for="fb">Facebook Page:</label>
							  <input type="text" class="form-control" id="fb" name="facebook" required>
							</div>
							<% if(request.getAttribute("msgPU") != null){%>
							<div class="form-group has-error has-feedback">
							  <label for="lname">Username:</label>
							  <input type="text" class="form-control" id="lname" name="username" required>
							   <span class="glyphicon glyphicon-remove form-control-feedback"></span>
							</div>
							<%}else{%>
							<div class="form-group">
							  <label for="lname">Username:</label>
							  <input type="text" class="form-control" id="lname" name="username" required>
							</div>
							<%}%>
							<div class="form-group modal-footer">
							<button type="submit" class="btn btn-success">Sign up</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
