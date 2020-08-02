<%--
/**
 * 
 * @author Freeroutes  */
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="FRErrorPage.jsp"%>
<%@ page import= "java.io.*,Partner.*,java.util.*"%>

<%
	request.setCharacterEncoding( "UTF-8" );
	try{
  		PartnersDAO pa = new PartnersDAO();
  		List<Partner> partners = pa.getPartners();
  		request.setAttribute("partners-list", partners);%>
  		<jsp:forward page="partners_list.jsp"/>
  	<%} catch(Exception e) {
  			throw new Exception(e.getMessage());
  		}
	%>