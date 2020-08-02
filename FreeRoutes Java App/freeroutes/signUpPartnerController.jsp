<%--
/**
 *
 * @author Freeroutes  */
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="FRErrorPage.jsp"%>
<%@ page import= "java.io.*,Login_signUp.*,Partner.*,java.lang.*"%>

<%
	request.setCharacterEncoding( "UTF-8" );
	String name_partner = request.getParameter("name_partner");
	String email_partner = request.getParameter("email_partner");
	String password_partner = request.getParameter("password_partner");
	if (password_partner.length()<8){
			request.setAttribute("msgP", "Use at least eight characters in the password.");%>
			<jsp:forward page="index.jsp"/>
		<%}
	String password_partner_2 = request.getParameter("password_partner_2");
	String name_cf = request.getParameter("name_cf");
	String surname_cf = request.getParameter("surname_cf");
	String phone_cf = request.getParameter("phone_cf");
	if (phone_cf.length()<10){
		request.setAttribute("msgP", "Use at least ten characters in phone.");%>
			<jsp:forward page="index.jsp"/>
		<%}

	String type = request.getParameter("type");
	String city = request.getParameter("city");
	String street = request.getParameter("street");
	String numberS = request.getParameter("number");
	int number = Integer.parseInt(numberS);
	String zip = request.getParameter("zip");
	if (zip.length()<5){
			request.setAttribute("msgP", "Use at least five characters in the zip code.");%>
			<jsp:forward page="index.jsp"/>
		<%}
	String description = request.getParameter("description");
	String facebook = request.getParameter("facebook");
	String username =  request.getParameter("username");

	UserDAO fr = new UserDAO();
	try{
		if (password_partner.equals(password_partner_2)){
			fr.checkUsernameP(request,response,username);
			User newUser = fr.importUser(username,password_partner,email_partner);
			Partner newPartner = fr.importPartner (name_partner, zip, number, street, city, name_cf, surname_cf, phone_cf, type, description, facebook, username);
			session.setAttribute("user-object",newUser);
			session.setAttribute("partner-object",newPartner);

		}else {
				request.setAttribute("msgP", "The passwords is not the same. Please try again.");%>
			<jsp:forward page="index.jsp"/>
		<%}
	}catch(Exception e){
		throw new Exception("Wrong"+e.getMessage());
	}
	<jsp:forward page="partnerController.jsp"/>
