<%--
/**
 *
 * @author Freeroutes  */
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="FRErrorPage.jsp"%>
<%@ page import= "java.io.*"%>


<!DOCTYPE html>
<html lang="en">

<head>
  <link rel="shortcut icon" type="image/x-icon" href="images/rounded.png"/>
  <title>Add image</title>
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

  <div class="container center-block">
      <h1>Εισαγωγή εικόνας:</h1>
      <p>Εισάγετε τη φωτογραφία του προφίλ σας</p>
      
    <img src="images/photo.jpg" class="img-responsive img-rounded center-block" alt="Insert Photo" width="350" height="350">
    <br>
	<form method='POST' action='addimageController.jsp' enctype = "multipart/form-data" class="form-horizontal">
	<fieldset>
		 <div class="form-group ">
		 <label for="exampleInputFile">Επέλεξε εικόνα</label>
		 <div class="input-group ">
			<input type="file" id="files" accept="images/*" name="thefile"/> 
		</div>
			<p class="help-block">Επέλεξε τη φωτογραφία που θέλεις να εισάγεις!</p>
		  </div>
		  <br>
		  <button type="submit" class="btn btn-warning center-block">Insert image</button>
	</fieldset>
	</form >
    
    </div>
  <br>
  <br>
  <br>
  <br>
  <%--    Include the page "footer.jsp"  --%>
<jsp:include page="footer.jsp" />

</body>

</html>
