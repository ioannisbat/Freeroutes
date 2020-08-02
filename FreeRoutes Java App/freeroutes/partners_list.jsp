<%--
/**
 * 
 * @author Freeroutes  */
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="FRErrorPage.jsp"%>
<%@ page import= "java.io.*,Partner.*,java.lang.*,java.util.*"%>

<!DOCTYPE html>
<html lang="en">

	<head>
	  <link rel="shortcut icon" type="image/x-icon" href="images/rounded.png"/>
	  <title>Freeroutes - Partners</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	  <link rel="stylesheet" href="css/style.css"> 
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	</head>

	<body>
	 <%
		request.setCharacterEncoding( "UTF-8" );
		List<Partner> partners  = (List<Partner>) request.getAttribute("partners-list");
	  %>

		<%--   Include page "header.jsp" --%>
		<jsp:include page="header.jsp" /> 
		<br>
		<br>
		<div class="container">
			<div class="col-sm-12" >
			<%if (partners != null){
				try {
				for (Partner partner : partners) {%>
				<div class="thumbnail">
					<h4 class="text-center"><strong><%=partner.getPartnersName()%>: </strong><%=partner.getTypeEvent()%></h4>
					<div class="row">
						<div class="col-sm-2">
							<img src="<%=partner.getPhoto()%>" class="img-rounded" alt="<%=partner.getPartnersName()%>" style="max-width: 100%;display:block" height="150">
							<br>
						</div>
						<div class="col-sm-10">
							<br>
							<p>
							<%=partner.getDescription()%>
							</p>
							<br>
							<br>
							<span class="glyphicon glyphicon-road"></span>
							<%=partner.getTypeEvent()%>
							<span class="glyphicon glyphicon-envelope"></span>
							<a href="mailto:<%=partner.getEmail()%>"><%=partner.getEmail()%></a>
							<span class="glyphicon glyphicon-earphone"></span>
							<%=partner.getContactPhone()%>
							<span class="glyphicon glyphicon-globe"></span>
							<a href="<%=partner.getFacebook()%>" target="_blank">Facebook Page</a>
						</div>
					</div>
				</div>
				<%}
					}catch (Exception e){
						throw new Exception(e.getMessage());
					}
			}else{
				throw new Exception("Δεν βρέθηκαν Συνεργάτες");
			}%>
			</div>
		</div>
		<br>
		<br>
		<br>
		<br> 
		<!-- footer -->
	<%--    Include the page "footer.jsp"  --%>    
<jsp:include page="footer.jsp" />
	</body>
</html>
