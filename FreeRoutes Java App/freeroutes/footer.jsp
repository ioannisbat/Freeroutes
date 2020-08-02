<%--
/**
 * A footer, included in bottom of every jsp page.
 * 
 * @author Freeroutes
 */
--%>

<%--   Set content type --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%--   Define error page --%>
<%@ page errorPage="FRErrorPage.jsp" %>
	
	<!-- footer -->
	<footer class="navbar-inverse" style="margin-bottom: 0; margin-top:0;background-color: #2E2E2E;border-color: #2E2E2E;">
		<nav class="navbar navbar-inverse navbar-defaultFooter" style="margin-bottom: 0;background-color: #2E2E2E;border-color: #2E2E2E;">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar2">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar2">
					<ul class="nav navbar-nav">
					  <li><a href="about.jsp">&copy; 2016 - Freeroutes</a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
					  <li><a href="about.jsp"> About</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</footer>