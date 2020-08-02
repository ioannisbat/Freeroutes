 <%--
/**
  * 
  * @author Freeroutes 
  */
--%>

<%@ page import="java.util.*, java.sql.*, java.io.*,Events.*,java.lang.*,Login_signUp.*, SUser.*, Coupon.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="FRErrorPage.jsp"%>

<!DOCTYPE html>
<html lang="en">
	<%  request.setCharacterEncoding("ISO-8859-7"); 
		User user1 = (User)session.getAttribute("user-object");
		SUser suser1 = (SUser)session.getAttribute("suser-object");
		if (suser1 == null) {
			throw new Exception("Please sign in as a user!");
		}
		UsersEventsDAO user_dao = new UsersEventsDAO();
		EventsDAO events_dao = new EventsDAO();
		List<Events> yesUsersList = user_dao.getYesUsersEvents(user1.getUsername()); 
		List<Events> noUsersList  = user_dao.getNoUsersEvents(user1.getUsername()); 
		List<Events> pendingUsersList  = user_dao.getPendingUsersEvents(user1.getUsername()); 
		List<Events> usersList  = user_dao.getUsersEvents(user1.getUsername()); 
		List<Events> allEvList = events_dao.returnAllEv(); 
		CouponDAO coupon_dao = new CouponDAO();
		Coupon coupon = new Coupon();
		%>
	
	<head>
	  <link rel="shortcut icon" type="image/x-icon" href="images/rounded.png"/>
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
		
				
		<%-- Include page "header.jsp" --%>
		<jsp:include page="header.jsp" /> 
		<br>
		  <div class="container">
			<div class="col">
			  <div class="col-md-4">
				  <div class="thumbnail">
					<h3 class="text-center"> <%= suser1.getName() %> <%= suser1.getSurname() %></h3>
					<%if (suser1.getPhoto()== null){%>
					<a href="insertPhoto_new.jsp" title="Add Image">
					<img class="img-circle img-responsive center-block" src="images/photoavatar.jpg" alt="Add Image"width="200" height="200">
					</a>
					<%}else{ %>
					<a href="insertPhoto_new.jsp" title="Upload new photo">
					<img class="img-circle img-responsive center-block" src="<%= suser1.getPhoto() %>" alt="<%= suser1.getName() %> <%= suser1.getSurname() %>" width="200" height="200">
					</a>
					<%}%>
					<br>
					<div class="container-fluid">
					  <p>
						  <span class="glyphicon glyphicon-envelope"></span>
								  <a href="#"> <%= user1.getEmail() %> </a>
					  </p>
					  <p>
						<span class="glyphicon glyphicon-star"></span>
							<% if(suser1.getPoints() <= 15 ) { %>
								<% suser1.setLevel(1); %>
								Freshman
							<% } else if(suser1.getPoints() > 15 && suser1.getPoints() <= 50 ) {%> 
								<% suser1.setLevel(2); %>
								Amateur
							<% } else if(suser1.getPoints() > 50 && suser1.getPoints() <= 100 ) {%>
								<% suser1.setLevel(3); %>
								Hardworker
							<% } else if(suser1.getPoints() > 100 && suser1.getPoints() <= 200) {%> 	
								<% suser1.setLevel(4); %>
								Superstar
							<% } else if(suser1.getPoints() > 200 && suser1.getPoints() <= 400) {%> 									
								<% suser1.setLevel(5); %>
								Pro
							<% } else if(suser1.getPoints() > 400 && suser1.getPoints() <= 800) {%>
								<% suser1.setLevel(6); %>
								Athlete
							<% } %>
					  </p>
					  <p>
						<span class="glyphicon glyphicon-arrow-up"></span>
							<%= suser1.getPoints() %> points
					  </p>
							</div>
				</div>
			  </div>
			  <div class="col-md-8 text-center">
				  <div class="thumbnail">
					<% boolean hasEvent = false; 
					if (usersList.size() > 0) {
						hasEvent = true;	%>
							<h3>Συμμετοχή σε events</h3><br>
							<div class="row">
							<% try { 									
									for (Events event1 : yesUsersList) {
										%>
												<div class="col-md-4">
												  <div class="image-rounded" style="position: relative;">
													<h2 id="H21" style="position: absolute; right: 0; width: 100%;">
														<span class="Span1" style="font-size: 12px;">
													<%=event1.getEvenTitle()%>: <%=event1.getDate()%>  <i class="glyphicon glyphicon-ok-sign"></i>
													</span>
													</h2>
													<a href="fulleventController.jsp?eventCode=<%=event1.getEventCode() %>">
													  <img class="img-responsive img-rounded" src="<%=event1.getPhoto()%>" alt="<%=event1.getEvenTitle()%> Photo" style="width:300px;height:200px">
													</a>
												  </div>
												  <br>
												</div>
												
											<% } 
									 	
								}  catch (Exception e2) {
									throw new Exception(e2.getMessage());
								}%>
								
								<% try { 									
									for (Events event1 : noUsersList) {
										%>
												<div class="col-md-4">
												  <div class="image-rounded" style="position: relative;">
													<h2 id="H21" style="position: absolute; right: 0; width: 100%;">
														<span class="Span1" style="font-size: 12px;">
													<%=event1.getEvenTitle()%>: <%=event1.getDate()%>  <i class="glyphicon glyphicon-remove-sign"></i>
													</span>
													</h2>
													<a href="fulleventController.jsp?eventCode=<%=event1.getEventCode() %>">
													  <img class="img-responsive img-rounded" src="<%=event1.getPhoto()%>" alt="<%=event1.getEvenTitle()%> Photo" style="width:300px;height:200px">
													</a>
												  </div>
												  <br>
												</div>
												
											<% } 
									 	
								}  catch (Exception e2) {
									throw new Exception(e2.getMessage());
								}%>
								
								<% try { 									
									for (Events event1 : pendingUsersList) {
										%>
												<div class="col-md-4">
												  <div class="image-rounded" style="position: relative;">
													<h2 id="H21" style="position: absolute; right: 0; width: 100%;">
														<span class="Span1" style="font-size: 12px;">
													<%=event1.getEvenTitle()%>: <%=event1.getDate()%>  <i class="glyphicon glyphicon-plus-sign"></i>
													</span>
													</h2>
													<a href="fulleventController.jsp?eventCode=<%=event1.getEventCode() %>">
													  <img class="img-responsive img-rounded" src="<%=event1.getPhoto()%>" alt="<%=event1.getEvenTitle()%> Photo" style="width:300px;height:200px">
													</a>
												  </div>
												  <br>
												</div>
												
											<% } 
									 	
								}  catch (Exception e2) {
									throw new Exception(e2.getMessage());
								}%>
								
								
					<% } else { %> 
							 <h3>Προτεινόμενα events</h3><br>
							 <div class="row">
							 <% int counter1 = 0; //counts four suggested events 
								try { 									
									for (Events event1 : allEvList) {
										counter1 = counter1 + 1;
										if (counter1 <=4 ) { 
										%>
												<div class="col-md-4">
												  <div class="image-rounded" style="position: relative;">
													<h2 id="H21" style="position: absolute; right: 0; width: 100%;">
														<span class="Span1" style="font-size: 12px;">
													<%=event1.getEvenTitle()%>: <%=event1.getDate()%>  <i class="glyphicon glyphicon-plus-sign"></i>
													</span>
													</h2>
													<a href="fulleventController.jsp?eventCode=<%=event1.getEventCode() %>">
													  <img class="img-responsive img-rounded" src="<%=event1.getPhoto()%>" alt="<%=event1.getEvenTitle()%> Photo" style="width:300px;height:200px">
													</a>
												  </div>
												  <br>
												</div>
												
											<% } // end of if 
									
									} //end of for	
								
								}  catch (Exception e2) {
									
									throw new Exception(e2.getMessage());
									
								} // end of trycatch
							
							 } //end of else %>
					  
					  </div>
				  </div>
				  
				  <div class="thumbnail">
					<div class="row">
					  <div class="col-md-2">
						<h4>Freshman</h4>
						<img class="img-responsive center-block" src="images/badge1.jpg" alt="Badge"><br>
						<% int situ = coupon_dao.couponSituation(suser1.getPoints(), 0, 15);
							String descr = coupon_dao.nameSitu(situ);
							if (descr == "Εξαργύρωση") {
								coupon = coupon_dao.authCoupon(1);
								coupon.setCouponLevel(1); 		%>
								<button type="button" class="btn btn-success active btn-sm pull-center" data-toggle="modal" data-target="#myModal2">Εξαργύρωση</button>
								
						<%	} else if(descr == "Κλειδωμένο") { %>
							<button type="button" class="btn btn-danger disabled btn-sm pull-center" data-toggle="modal" data-target="#myModal">Κλειδωμένο</button>
					       
						<%	} else { %>
							<div class="progress" style="height: 30px">
								<div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar"
								aria-valuenow="<%= suser1.getPoints() %>" aria-valuemin="0" aria-valuemax="15" style="width: 100%; line-height: 30px;">
									<%= suser1.getPoints() %>/15.0
								</div>
							</div>
							
						<%	}
							%>
					</div>	
					  <div class="col-md-2">
						<h4>Amateur</h4>
						<img class="img-responsive center-block" src="images/badge2.jpg" alt="Badge"><br>
						<% int situ1 = coupon_dao.couponSituation(suser1.getPoints(), 16, 50);
							String descr1 = coupon_dao.nameSitu(situ1);
							if (descr1 == "Εξαργύρωση") {
								coupon = coupon_dao.authCoupon(2);
								coupon.setCouponLevel(2); 								%>
								<button type="button" class="btn btn-success active btn-sm pull-center" data-toggle="modal" data-target="#myModal2">Εξαργύρωση</button>
								
						<%	} else if(descr1 == "Κλειδωμένο") { %>
							<button type="button" class="btn btn-danger disabled btn-sm pull-center" data-toggle="modal" data-target="#myModal">Κλειδωμένο</button>
					       
						<%	} else {  %>
							<div class="progress" style="height: 30px">
								<div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" aria-valuenow="<%= suser1.getPoints()%>" 
								aria-valuemin="16" aria-valuemax="50" style="width: 100%; line-height: 30px;">
									<%= suser1.getPoints() %>/50.0
								</div>
							</div>
						<%	}
							%>
						</div>
					  <div class="col-md-2">
						<h4>Hardworker</h4>
						<img class="img-responsive center-block" src="images/badge3.jpg" alt="Badge"><br>
							<% int situ2 = coupon_dao.couponSituation(suser1.getPoints(), 51, 100);
							String descr2 = coupon_dao.nameSitu(situ2);
							if (descr2 == "Εξαργύρωση") {
								coupon = coupon_dao.authCoupon(3);
								coupon.setCouponLevel(3); %>
								<button type="button" class="btn btn-success active btn-sm pull-center" data-toggle="modal" data-target="#myModal2">Εξαργύρωση</button>
								
						<%	} else if(descr2 == "Κλειδωμένο") { %>
							<button type="button" class="btn btn-danger disabled btn-sm pull-center" data-toggle="modal" data-target="#myModal">Κλειδωμένο</button>
					       
						<%	} else {  %>
							<div class="progress" style="height: 30px">
								<div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar" aria-valuenow="<%= suser1.getPoints()%>" 
								aria-valuemin="51" aria-valuemax="100" style="width: 100%; line-height: 30px;">
									<%= suser1.getPoints() %>/100.0
								</div>
							</div>
						<%	}
							%>
					  </div>
					  <div class="col-md-2">
						<h4>Superstar</h4>
						<img class="img-responsive center-block" src="images/badge4.jpg" alt="Badge"><br>
						<% int situ3 = coupon_dao.couponSituation(suser1.getPoints(), 101, 200);
							String descr3 = coupon_dao.nameSitu(situ3);
							if (descr3 == "Εξαργύρωση") {
								coupon = coupon_dao.authCoupon(4);
								coupon.setCouponLevel(4); %>
							<button type="button" class="btn btn-success active btn-sm pull-center" data-toggle="modal" data-target="#myModal2">Εξαργύρωση</button>
								
						<%	} else if(descr3 == "Κλειδωμένο") { %>
							<button type="button" class="btn btn-danger disabled btn-sm pull-center" data-toggle="modal" data-target="#myModal">Κλειδωμένο</button>
					       
						<%	} else { %>
							<div class="progress" style="height: 30px">
								<div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar"
								aria-valuenow="<%= suser1.getPoints() %>" aria-valuemin="101" aria-valuemax="200" style="width:100%; line-height: 30px;">
									<%= suser1.getPoints() %>/200.0
								</div>
							</div>
							
						<%	}
							%>
						
					  </div>
					  <div class="col-md-2">
						<h4>Pro</h4>
						<img class="img-responsive center-block" src="images/badge5.jpg" alt="Badge"><br>
						<% int situ4 = coupon_dao.couponSituation(suser1.getPoints(), 201, 400);
							String descr4 = coupon_dao.nameSitu(situ4);
							if (descr4 == "Εξαργύρωση") {
									coupon = coupon_dao.authCoupon(5);
									coupon.setCouponLevel(5); 								%>
							<button type="button" class="btn btn-success active btn-sm pull-center" data-toggle="modal" data-target="#myModal2">Εξαργύρωση</button>
								
						<%	} else if(descr4 == "Κλειδωμένο") { %>
							<button type="button" class="btn btn-danger disabled btn-sm pull-center" data-toggle="modal" data-target="#myModal">Κλειδωμένο</button>
					       
						<%	} else { %>
							<div class="progress" style="height: 30px">
								<div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar"
								aria-valuenow="<%= suser1.getPoints() %>" aria-valuemin="201" aria-valuemax="400" style="width: 100%; line-height: 30px;">
									<%= suser1.getPoints() %>/400.0
								</div>
							</div>
							
						<%	}
							%>
						
					  </div>
					  <div class="col-md-2">
						<h4>Athlete</h4>
						<img class="img-responsive center-block" src="images/badge6.jpg" alt="Badge"><br>
								<% int situ5 = coupon_dao.couponSituation(suser1.getPoints(), 401, 800);
							String descr5 = coupon_dao.nameSitu(situ5);
							if (descr5 == "Εξαργύρωση") {
									coupon = coupon_dao.authCoupon(6);
									coupon.setCouponLevel(6); %>
							<button type="button" class="btn btn-success active btn-sm pull-center" data-toggle="modal" data-target="#myModal2">Εξαργύρωση</button>
							
						<%	} else if(descr5 == "Κλειδωμένο") { %>
							<button type="button" class="btn btn-danger disabled btn-sm pull-center" data-toggle="modal" data-target="#myModal">Κλειδωμένο</button>
					       
						<%	} else { %>
							<div class="progress" style="height: 30px">
								<div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar"
								aria-valuenow="<%= suser1.getPoints() %>" aria-valuemin="401" aria-valuemax="800" style="width:  100%; line-height: 30px;">
									<%= suser1.getPoints() %>/800.0
								</div>
							</div>
							
						<%	}
							%>
					  </div>

					  <div class="modal fade" id="myModal2" role="dialog">
					  <div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
						  <div class="modal-header">
							<a href="profile_user.jsp" class="close" role="button">&times;</a>
							<h4 class="modal-title"><b> <%= coupon.getNameAdv() %> :</b> <%= coupon.getName() %></h4>
						  </div>
						  <div class="modal-body">
							<% if (coupon.getCouponLevel() == 1 || coupon.getCouponLevel() == 4) { %>
								
								<img src="images/nike.jpg" class="img-responsive center-block" alt="Success" width="200" height="200">
							
							<% } else if (coupon.getCouponLevel() == 2 || coupon.getCouponLevel() == 5) { %>
								
								<img src="images/rebook.jpg" class="img-responsive center-block" alt="Success" width="200" height="200">
							
							<% } else if (coupon.getCouponLevel() == 3 || coupon.getCouponLevel() == 6){  %>
								
								<img src="images/adidas.jpg" class="img-responsive center-block" alt="Success" width="200" height="200">
							
							<% } %>
							
							<br>
							<h4>Κωδικός: <a><% String code1 = coupon.getCouponCode(); 
											   
												%> <%= code1 %></a></h4>
						  </div>
						  <div class="modal-footer" style="text-align:left">
							  <b>Σημείωση: </b>Για να εξαργυρώσετε το παρόν κουπόνι, δώστε τον κωδικό σε ένα από τα καταστήματα της αλυσίδας.
						  </div>
						  
						 
						</div>

					  </div>
					  </div>
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
