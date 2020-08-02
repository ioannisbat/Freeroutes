<%--
/**
 *
 * @author Freeroutes 
 */
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="FRErrorPage.jsp"%>
<%@ page import= "java.io.*,Login_signUp.*,Partner.*, SUser.*,java.lang.*"%>

<%
	request.setCharacterEncoding( "UTF-8" );
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	Login fr = new Login();
	try{
		User user = fr.authenticateUser(username,password);
		session.setAttribute("user-object",user);
	}catch(Exception e){
		request.setAttribute("msgl", "Wrong username or password");%>
		<jsp:forward page="index.jsp"/>
	<%}
	SUser suser = fr.authenticateSUser(username);
	if (suser == null){
		Partner partner = fr.authenticatePartner(username);
		session.setAttribute("partner-object",partner);%>
		<jsp:forward page="partnerController.jsp"/>
	<%}else{
		session.setAttribute("suser-object",suser);%>
		<jsp:forward page="profile_user.jsp"/>
	<%}%>
