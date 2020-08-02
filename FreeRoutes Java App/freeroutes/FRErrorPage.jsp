<%--
/**
 * 
 * @author Freeroutes
 */
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <link rel="shortcut icon" type="image/x-icon" href="images/rounded.png"/>
  <title>Error</title>
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
    <br>
    <h1 class="text-center">Σφάλμα!!!!!!!</h1>
    <br>
    <div class="row">
      <div class="col-sm-12">
        <br>
        <div class="alert alert-danger text-center" role="alert">
        <%= exception.getMessage() %>
		</div>
		<br>
      </div>
    </div>
    <br>
    <br>
  </div>
  
  <%--    Include the page "footer.jsp"  --%>    
	<jsp:include page="footer.jsp" /> 
</body>
</html>
