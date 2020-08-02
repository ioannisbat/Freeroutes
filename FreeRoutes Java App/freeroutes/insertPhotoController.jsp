 <%--
/**
 * 
 * @author Freeroutes 
 */
--%>

<%--   Set content type --%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.io.*,java.util.*,SUser.*,Login_signUp.*,java.lang.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page errorPage="FRErrorPage.jsp"%>

<%
List<String> formData = new ArrayList<String>();
User user = (User) session.getAttribute("user-object");
String path = null;
String photoName = null;
String direct = "freeroutes/images";
String destination ="/freeroutes/images";
String destinationRealPath = application.getRealPath(destination);
DiskFileItemFactory factory = new DiskFileItemFactory();
factory.setSizeThreshold(1024); // 1024
factory.setRepository(new File(destinationRealPath));
ServletFileUpload uploader = new ServletFileUpload(factory);
try {
	List items = uploader.parseRequest(request);
	Iterator iterator = items.iterator();
	while(iterator.hasNext() /*&& !item.isFormField()*/)
		{
			FileItem item = (FileItem)iterator.next();
			
			if(!item.isFormField() && item.getName() != null) {
				File file = new File(destinationRealPath, item.getName());  //destinationRealPath
				item.write(file);
				photoName = file.getName();
				path = direct+"/"+item.getName();
				//path = file.getAbsolutePath();
				formData.add(path);
				String imagePath = "images/"+file.getName();
				SUserDAO x= new SUserDAO();
				x.insertPhoto(imagePath,user.getUsername());
				Login fr = new Login();
				SUser suser = fr.authenticateSUser(user.getUsername());
				session.setAttribute("suser-object",suser);
				%>
				
				<jsp:forward page="profile_user.jsp"/>	
			<%}
		}
	} catch(FileUploadException e) {
		out.write("<p>FileUploadException was thrown... "+e.getMessage()+"</p>");
	
	} 	catch (FileNotFoundException fnfe) {
        throw new Exception("Παρακαλώ εισάγετε φωτογραφία!");
	}
	
%>