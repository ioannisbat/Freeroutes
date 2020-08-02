<%--
/**
 * 
 * @author Freeroutes
 */
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page errorPage="FRErrorPage.jsp"%>

<%
	session.invalidate();
	response.sendRedirect("index.jsp");
%>