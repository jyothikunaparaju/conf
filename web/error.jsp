<%-- 
    Document   : error
    Created on : 18-May-2014, 18:26:41
    Author     : Ravi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

    <head>

        

        <title>Login Error</title>

    </head>

    <body>

    <center><p style="color:red">Sorry, your record is not available.</p></center>

    <%

        getServletContext().getRequestDispatcher("/login.jsp").include(request,
                response);

    %>

</body>

</html>

