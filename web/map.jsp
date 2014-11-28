<%-- 
    Document   : map
    Created on : Jun 28, 2014, 8:26:36 PM
    Author     : KSR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>


        <%@ page import="org.netbeans.saas.*, org.netbeans.saas.google.*" %>

        <%

            try {
                String address = "16 Network Circle, Menlo Park";
                java.lang.Integer zoom = 15;
                String iframe = "false";
                String location = request.getParameter("location");
                System.out.println("assf" + request.getParameter("location"));
                RestResponse result = GoogleMapService.getGoogleMap(location, zoom, iframe);
                 //TODO - Uncomment the print Statement below to print result.
                //out.println("The SaasService returned: "+result.getDataAsString());
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        %>
      
        <div>
             
	 <SCRIPT LANGUAGE="JavaScript">
	 <!--
		txtData2.value = window.opener.document.getElementById('location').value;
            
document.write("<img src='http://maps.googleapis.com/maps/api/staticmap?center=' + txtData2.value+ '&zoom=13&size=600x300&sensor=false' >");
</script>
        
        <INPUT TYPE="text" NAME="txtData2" ID="txtData2">
        xczzczxzxvx\\\
       
	
         
        <img src="http://maps.googleapis.com/maps/api/staticmap?center='<%=request.getParameter("key")%>' &zoom=13&size=600x300&sensor=false" name="address">
        </div>
        <div>
        <a href="eventplan/editevent.jsp?action=edit" > Back </a>
        </div>
    
    ASDASFagsgwregtrwyterytqeryeryqeryqerwyqereqrgertewrtwetwewetew
    
    </body>
</html>
