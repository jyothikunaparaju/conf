<%-- 
    Document   : logout
    Created on : 18-May-2014, 18:27:55
    Author     : Ravi
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="app.ConferenceDetails" %>
<html>
    <head>
              <link rel="shortcut icon" type="image/x-icon" href="css/images/favicon.ico" />

        <meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
	<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1' />
	<link rel="stylesheet" type="text/css" href="styles.css" />
         <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
	<script type='text/javascript' src='menu_jquery.js'></script>
        <title>Log out</title>
    </head>
    <body>
        
        
  <img src="css\images\con-image.jpg"   id="banner" alt="Banner Image" />
   <div id='cssmenu'>
<ul>
   <li class='active'><a href='home.jsp'><span>Home</span></a></li>
   <li class='has-sub'><a href='#'><span>View Members Sign in </span></a>
      <ul>
         <li><a href="#"><span>Members List</span></a></li>
         <li><a href='#'><span>Menus</span></a></li>
         <li class='last'><a href='#'><span>Products</span></a></li>
      </ul>
   </li>
   
   <li ><a href='#'><span>Events </span></a>
      <ul>
         <li> </li>
         <li class='last'><a href='#'><span>Location</span></a></li>
      </ul>
       
   </li>
   <li class='last'><a href='#'><span>Contact</span></a></li>
      <li class='last'><a href='login.jsp'><span>Log in</span></a></li>

</ul>
</div>
    


        <% session.invalidate();%>

        <p>You have been successfully logout</p> 
        <p>Please log in if you want to continue further </p>
        

    </body>

</html>

