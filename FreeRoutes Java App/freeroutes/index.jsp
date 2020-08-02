<%--
/**
 *
 * @author Freeroutes 
 */
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="FRErrorPage.jsp"%>
<%@ page import= "Index.*"%>
<%@ page import= "java.io.*,Events.*,Partner.*,java.lang.*,Login_signUp.*,java.util.*"%>

<!DOCTYPE html>
<html lang="en">

	<head>
	  <link rel="shortcut icon" type="image/x-icon" href="images/rounded.png"/>
	  <title>Freeroutes</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	  <link rel="stylesheet" href="css/style.css">
	  <link rel="stylesheet" href="css/framework.css">
	  <link rel="stylesheet" href="css/about-us.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	</head>

	<body>

		<%--   Include page "header.jsp" --%>
		<jsp:include page="header.jsp" />
		<div class="container">
			<br>
			<br>
			<br>
			<img src="images/logo.png" class="img-responsive img-rounded center-block" alt="FlyDay Photo" style="width:700px;height:100px">
			<br>
			<br>
			<h2 class="text-center">Δήλωσε συμμετοχή στα σημαντικότερα events μαζικού αθλητισμού και κέρδισε προσφορές!</h2>
			<br>

			  <%request.setCharacterEncoding( "UTF-8" );
				try{
					EventsDAO ca = new EventsDAO();
					List<Events> list = (List) ca.returnAllEv();
					int x=0;
				for (Events event : list){
					x++;
				}%>
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
				  <ol class="carousel-indicators">
				  <%for (int i=0; i<x;i++){
				  if (i==0){%>
					<li data-target="#myCarousel" data-slide-to="<%=i%>" class="active"></li>
				  <%}else{%>
					<li data-target="#myCarousel" data-slide-to="<%=i%>"></li>
				  <%}
				  }%>
				  </ol>
				  <div class="carousel-inner" role="listbox">
			  <%int i = 0;
			  if (list != null){
			  for (Events event : list){
				  if (i==0){%>
				  	<div class="item active">
				  <%}else{%>
					<div class="item">
				  <%}%>
				 <a href="fulleventController.jsp?eventCode=<%=event.getEventCode()%>" style="color:black"> <div class="thumbnail">
					  <div class="row">
						<br>
						<div class="col-md-4 text-center">
						  <div class="image-rounded" style="position: relative;">
							<h2 style="position: absolute; right: 0; width: 100%;">
							<span class="Span1" style="font-size: 12px;">
							<%=event.getEvenTitle()%> : <%=event.getDate()%>
							</span>
							</h2>
							  <img class="img-responsive img-rounded" src="<%=event.getPhoto()%>" alt="<%=event.getEvenTitle()%> Photo" style="width:300px;height:200px">
						  </div>
						  <br>
						</div>
						<div class="col-md-8">
						  <p>
							<b>Ημερομηνία:</b> <%=event.getDate()%>
							<br>
							<b>Ώρα συγκέντρωσης:</b> <%=event.getTime()%><br>
						  </p>
						  <p>
							<b>Διαδρομή:</b> <%=event.getRoute()%> <b>[<%=event.getLevel()%>]</b><br>
							<b>Σημείο εκκίνησης:</b>  <%=event.getStartPoint()%> <br>
						  </p>
						  <p>
							<b>Σχόλια διαδρομής:</b> <%=event.getComments()%> <br>
						  </p>
						  <h4><span class="label label-warning">Έπαθλο συμμετοχής:</span> <%=event.getPoints()%> πόντοι</h4>
						</div>
					  <br>
					  </div>
				  </div></a>
				</div>
				<%if (i>=x){
					  break;
				  }else {
					  i++;
				  }
			  }}} catch(Exception e) {
						throw new Exception(e.getMessage());
				}%>

			  </div> 

			  <span class="pull-right">
				<a href="event.jsp" class="btn btn-warning" role="button">Περισσότερα &#10095;</a>
			  </span>
			</div>
		</div>
		</div>
		<br>
		<div class="container-fluid" style="background-color:#f0ad4e; color:white;">
			<br>
			<h1 class="text-center">Τι είναι το Freeroutes;</h1>
			<br>
			<div class="row">
				<div class="col-sm-3 text-center">
				  <img src="images/road.png" class="img-rounded" alt="Freeday Photo" style="width:200px;height:200px">
				</div>
				<div class="col-sm-9">
					<br>
					<p>
					To <b>Freeroutes</b> είναι μία ηλεκτρονική πλατφόρμα η οποία πληροφορεί τους χρήστες για τη πλειοψηφία
					μαζικών αθλητικών εκδηλώσεων (τρεξίματος, ποδηλάτου, ορειβασίας, rollers κτλ).
					</p>
					<br>
					<h3>Το όραμα μας</h3>
					<p>
					Το όραμα μας είναι να αποτελούμε την πρώτη σκέψη στο μυαλό των ανθρώπων που ασχολούνται και αγαπούν τον αθλητισμό
					και ενδιαφέρονται να βρουν και να συμμετάσχουν στις προσεχείς διαδρομές πάνω στο άθλημα που τους ενδιαφέρει.
					</p>
					<br>
				</div>
			</div>
			<br>
			<br>
		</div>

			<div class="container">
		<section id="team">
        <h1 class="text-center">Η ομάδα μας</h1>
		<br>
        <ul class="clear">
          <li class="one_quarter first">
            <figure><img src="images/batas.gif" alt="image" height="225" width="225">
              <figcaption>
                <p class="text-center"><b>Γιάννης Μπάτας</b></p>
                <p class="text-center">Προπτυχιακός Φοιτητής ΟΠΑ</p>
                <p class="text-center">Δευτεροετής φοιτητής στο Τμήμα Διοικητικής Επιστήμης και Τεχνολογίας του Οικονομικού Πανεπιστήμιο Αθηνών.</p>
              </figcaption>
            </figure>
            <ul style="overflow:hidden;">
              <li style="display:inline-block;"><a href="mailto:johneybat@gmail.com" target="_blank"><img src="images/email.png" alt="email"></a></li>
              <li style="display:inline-block;"><a href="https://www.facebook.com/john.batas?fref=ts" target="_blank"><img src="images/facebook.png" alt="facebook"></a></li>
              <li style="display:inline-block;"><a href="https://www.linkedin.com/in/giannisbatas?authType=NAME_SEARCH&authToken=Ec59&locale=en_US&trk=tyah&trkInfo=clickedVertical%3Amynetwork%2CclickedEntityId%3A299312772%2CauthType%3ANAME_SEARCH%2Cidx%3A1-1-1%2CtarId%3A1481320579735%2Ctas%3Abatas" target="_blank"><img src="images/linkedin.png" alt="linkedin"></a></li>
            </ul>
			<br>
          </li>
          <li class="one_quarter">
            <figure><img src="images/Chrysa.jpg" alt="image"  height="225" width="225">
              <figcaption>
                <p class="text-center"><b>Χρυσάνθη Λαρδοπούλου</b></p>
                <p class="text-center">Προπτυχιακή Φοιτήτρια ΟΠΑ</p>
                <p class="text-center">Τριτοετής φοιτήτρια στο Τμήμα Διοικητικής Επιστήμης και Τεχνολογίας του Οικονομικού Πανεπιστήμιο Αθηνών.</p>
              </figcaption>
            </figure>
      <ul style="overflow:hidden;">
              <li style="display:inline-block;"><a href="mailto:chrysa_1996@hotmail.com" target="_blank"><img src="images/email.png" alt="email"></a></li>
              <li style="display:inline-block;"><a href="https://www.facebook.com/chrysaa.lar?fref=ts" target="_blank"><img src="images/facebook.png" alt="facebook"></a></li>
              <li style="display:inline-block;"><a href="https://www.linkedin.com/in/chrysalardopoulou?authType=NAME_SEARCH&authToken=NW7p&locale=en_US&trk=tyah&trkInfo=clickedVertical%3Amynetwork%2CclickedEntityId%3A394068597%2CauthType%3ANAME_SEARCH%2Cidx%3A1-2-2%2CtarId%3A1481320372639%2Ctas%3AChr" target="_blank"><img src="images/linkedin.png" alt="linkedin"></a></li>
            </ul>
			<br>
          </li>
          <li class="one_quarter">
            <figure><img src="images/christina.jpg" alt="image"  height="225" width="225">
              <figcaption>
                <p class="text-center"><b>Χριστίνα Χανιωτάκη</b></p>
                <p class="text-center">Προπτυχιακή Φοιτήτρια ΟΠΑ</p>
                <p class="text-center">Τριτοετής φοιτήτρια στο Τμήμα Διοικητικής Επιστήμης και Τεχνολογίας του Οικονομικού Πανεπιστήμιο Αθηνών.</p>
              </figcaption>
            </figure>
            <ul style="overflow:hidden;">
              <li style="display:inline-block;"><a href="mailto:christinachaniotaki96@gmail.com" target="_blank"><img src="images/email.png" alt="email"></a></li>
              <li style="display:inline-block;"><a href="https://www.facebook.com/christina.chaniotaki" target="_blank"><img src="images/facebook.png" alt="facebook"></a></li>
              <li style="display:inline-block;"><a href="https://www.linkedin.com/in/christina-chaniotaki-194488a4?trk=nav_responsive_tab_profile" target="_blank"><img src="images/linkedin.png" alt="linkedin"></a></li>
            </ul>
			<br>
          </li>
          <li class="one_quarter">
            <figure><img src="images/Stavroula Sarri.jpg" alt="image"  height="225" width="225">
              <figcaption>
                <p class="text-center"><b>Σταυρούλα Σαρρή</b></p>
                <p class="text-center">Προπτυχιακή Φοιτήτρια ΟΠΑ</p>
                <p class="text-center">Τριτοετής φοιτήτρια στο Τμήμα Διοικητικής Επιστήμης και Τεχνολογίας του Οικονομικού Πανεπιστήμιο Αθηνών.</p>
              </figcaption>
            </figure>
            <ul style="overflow:hidden;">
              <li style="display:inline-block;"><a href="mailto:linaki1415@hotmail.com" target="_blank"><img src="images/email.png" alt="email"></a></li>
              <li style="display:inline-block;"><a href="https://www.facebook.com/chrysaa.lar?fref=ts" target="_blank"><img src="images/facebook.png" alt="facebook"></a></li>
              <li style="display:inline-block;"><a href="#" target="_blank"><img src="images/linkedin.png" alt="linkedin"></a></li>
            </ul>
			<br>
          </li>
		  <li class="one_quarter">
            <figure><img src="images/giannis.gif" alt="image"  height="225" width="225">
              <figcaption>
                <p class="text-center"><b>Γιάννης Τσαννέτος</b></p>
                <p class="text-center">Προπτυχιακός Φοιτητής ΕΜΠ</p>
                <p class="text-center">Τριτοετής φοιτητής στο Τμήμα Ηλεκτρονικών Μηχανικών Εθνικού Μετσόβιου Πολυτεχνείου.</p><br>
              </figcaption>
            </figure>
            <ul style="overflow:hidden;">
              <li style="display:inline-block;"><a href="mailto:tzannetosg@gmail.com" target="_blank"><img src="images/email.png" alt="email"></a></li>
              <li style="display:inline-block;"><a href="https://www.facebook.com/giannis.tzannetos?fref=ts" target="_blank"><img src="images/facebook.png" alt="facebook"></a></li>
              <li style="display:inline-block;"><a href="#" target="_blank"><img src="images/linkedin.png" alt="linkedin"></a></li>
            </ul>
			<br>
          </li>
        </ul>
      </section>
	  </div>
		<br>
		<br>
		<br>
		<br>
		
		<%--    Include the page "footer.jsp"  --%>
		<jsp:include page="footer.jsp" />
	</body>
</html>
