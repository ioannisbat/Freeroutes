<%--
/**
 * 
 * @author Freeroutes
 */
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="FRErrorPage.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <link rel="shortcut icon" type="image/x-icon" href="images/rounded.png"/>
  <title>Freeroutes</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">  <link rel="stylesheet" href="style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<body>
		<%--   Include page "header.jsp" --%>
		<jsp:include page="header.jsp" /> 
  
  <div class="container-fluid">
		<section id="team">
        <h1 class="text-center">Η ομάδα μας</h1>
		<br>
        <ul style="overflow:hidden;">
          <li class="one_quarter first" style="overflow:hidden;">
            <figure class="text-center"><img src="images/batas.gif" alt="image" height="225" width="225">
              <figcaption>
                <p class="text-center"><b>Γιάννης Μπάτας</b></p>
                <p class="text-center">Προπτυχιακός Φοιτητής ΟΠΑ</p>
                <p class="text-center">Δευτεροετής φοιτητής στο Τμήμα Διοικητικής Επιστήμης και Τεχνολογίας του Οικονομικού Πανεπιστήμιο Αθηνών.</p>
              </figcaption>
            </figure>
            <ul style="overflow:hidden;" class="text-center">
              <li style="display:inline-block;"><a href="mailto:johneybat@gmail.com"><img src="images/email.png" alt=""></a></li>
              <li style="display:inline-block;"><a href="https://www.facebook.com/john.batas?fref=ts"><img src="images/facebook.png" alt=""></a></li>
              <li style="display:inline-block;"><a href="https://www.linkedin.com/in/giannisbatas?authType=NAME_SEARCH&authToken=Ec59&locale=en_US&trk=tyah&trkInfo=clickedVertical%3Amynetwork%2CclickedEntityId%3A299312772%2CauthType%3ANAME_SEARCH%2Cidx%3A1-1-1%2CtarId%3A1481320579735%2Ctas%3Abatas"><img src="images/linkedin.png" alt=""></a></li>
            </ul>
			<br>
          </li>
          <li class="one_quarter" style="overflow:hidden;">
            <figure class="text-center"><img src="images/Chrysa.jpg" alt="image"  height="225" width="225">
              <figcaption>
                <p class="text-center"><b>Χρυσάνθη -Τσαμπίκα Λαρδοπούλου</b></p>
                <p class="text-center">Προπτυχιακή Φοιτήτρια ΟΠΑ</p>
                <p class="text-center">Τριτοετής φοιτήτρια στο Τμήμα Διοικητικής Επιστήμης και Τεχνολογίας του Οικονομικού Πανεπιστήμιο Αθηνών.</p>
              </figcaption>
            </figure>
      <ul style="overflow:hidden;" class="text-center">
              <li style="display:inline-block;"><a href="mailto:chrysa_1996@hotmail.com"><img src="images/email.png" alt=""></a></li>
              <li style="display:inline-block;"><a href="https://www.linkedin.com/in/chrysalardopoulou?authType=NAME_SEARCH&authToken=NW7p&locale=en_US&trk=tyah&trkInfo=clickedVertical%3Amynetwork%2CclickedEntityId%3A394068597%2CauthType%3ANAME_SEARCH%2Cidx%3A1-2-2%2CtarId%3A1481320372639%2Ctas%3AChr"><img src="images/linkedin.png" alt=""></a></li>
            </ul>
			<br>
          </li>
          <li class="one_quarter" style="overflow:hidden;">
            <figure class="text-center"><img src="images/christina.jpg" alt="image"  height="225" width="225">
              <figcaption>
                <p class="text-center"><b>Χριστίνα Ζαχαρούλα Χανιωτάκη</b></p>
                <p class="text-center">Προπτυχιακή Φοιτήτρια ΟΠΑ</p>
                <p class="text-center">Τριτοετής φοιτήτρια στο Τμήμα Διοικητικής Επιστήμης και Τεχνολογίας του Οικονομικού Πανεπιστήμιο Αθηνών.</p>
              </figcaption>
            </figure>
            <ul style="overflow:hidden;" class="text-center">
              <li style="display:inline-block;"><a href="mailto:christinachaniotaki96@gmail.com"><img src="images/email.png" alt=""></a></li>
              <li style="display:inline-block;"><a href="https://www.facebook.com/christina.chaniotaki"><img src="images/facebook.png" alt=""></a></li>
              <li style="display:inline-block;"><a href="https://www.linkedin.com/in/christina-chaniotaki-194488a4?trk=nav_responsive_tab_profile"><img src="images/linkedin.png" alt=""></a></li>
            </ul>
			<br>
          </li>
          <li class="one_quarter" style="overflow:hidden;">
            <figure class="text-center"><img src="images/Stavroula Sarri.jpg" alt="image"  height="225" width="225">
              <figcaption>
                <p class="text-center"><b>Σταυρούλα Σαρρή</b></p>
                <p class="text-center">Προπτυχιακή Φοιτήτρια ΟΠΑ</p>
                <p class="text-center">Τριτοετής φοιτήτρια στο Τμήμα Διοικητικής Επιστήμης και Τεχνολογίας του Οικονομικού Πανεπιστήμιο Αθηνών.</p>
              </figcaption>
            </figure>
            <ul style="overflow:hidden;" class="text-center">
              <li style="display:inline-block;"><a href="mailto:linaki1415@hotmail.com"><img src="images/email.png" alt=""></a></li>
              <li style="display:inline-block;"><a href="https://www.facebook.com/?ref=tn_tnmn&qsefr=1"><img src="images/facebook.png" alt=""></a></li>
              <li style="display:inline-block;"><a href="#"><img src="images/linkedin.png" alt=""></a></li>
            </ul>
			<br>
          </li>
		  <li class="one_quarter" style="overflow:hidden;">
            <figure class="text-center"><img src="images/giannis.gif" alt="image"  height="225" width="225">
              <figcaption>
                <p class="text-center"><b>Γιάννης Τzαννέτος</b></p>
                <p class="text-center">Προπτυχιακός Φοιτητής ΕΜΠ</p>
                <p class="text-center">Τριτοετής φοιτητής στο Τμήμα Ηλεκτρονικών Μηχανικών Εθνικού Μετσόβιου Πολυτεχνείου.</p><br>
              </figcaption>
            </figure>
            <ul style="overflow:hidden;" class="text-center">
              <li style="display:inline-block;"><a href="mailto:tzannetosg@gmail.com"><img src="images/email.png" alt=""></a></li>
              <li style="display:inline-block;"><a href="https://www.facebook.com/giannis.tzannetos?fref=ts"><img src="images/facebook.png" alt=""></a></li>
              <li style="display:inline-block;"><a href="#"><img src="images/linkedin.png" alt=""></a></li>
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
	<br>
  </div>
  
<!-- footer -->
		<%--    Include the page "footer.jsp"  --%>    
		<jsp:include page="footer.jsp" /> 
	<!-- End footer -->
</body>


</html>



