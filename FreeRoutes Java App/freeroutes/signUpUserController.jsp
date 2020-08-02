<%--
/**
 * 
 * @author Freeroutes  */
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="FRErrorPage.jsp"%>
<%@ page import= "java.io.*,Login_signUp.*, SUser.*"%>

<%
	request.setCharacterEncoding( "UTF-8" );
	String email = request.getParameter("email_user");
	String password_user = request.getParameter("password_user");
	if (password_user.length()<8){
		request.setAttribute("msgS", "Use at least eight characters in the password.");%>
		<jsp:forward page="index.jsp"/>
	<%}
	String password_user_2 = request.getParameter("password_user_2");
	String name_user = request.getParameter("name_user");
	String surname_user = request.getParameter("surname_user");
	String username = request.getParameter("username");
	
	UserDAO fr = new UserDAO();
	try{
		if (password_user.equals(password_user_2)){
			fr.checkUsernameS(request,response,username);
			User newUser = fr.importUser(username,password_user,email);
			SUser newSUser = fr.importSUser(name_user,surname_user,username);
			session.setAttribute("user-object",newUser);
			session.setAttribute("suser-object",newSUser);
			
		}else {
			request.setAttribute("msgS", "The passwords is not the same. Please try again.");%>
			<jsp:forward page="index.jsp"/>
		<%}
		
	}catch(Exception e){
		throw new Exception("Wrong "+e.getMessage());
	}
%>
<jsp:forward page="profile_user.jsp"/>	