<%-- 
    Document   : home
    Created on : 18-May-2014, 18:07:59
    Author     : Ravi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<html>
    <head><link rel="stylesheet" type="text/css" href="css/style_1_1.css" />
        
        <title>Login</title>
        <link rel="shortcut icon" type="image/x-icon" href="css/images/favicon.ico" />
	
    </head>
    <body>
         <div  style="width:100%">

            <div id="header" style="background-color:#FFA500;width:100%;"  >

                <img src="css\images\javaone.jpg"   id="banner" alt="Banner Image" style="width: 100%;height:120px;"/>
            </div>
              <div id="menu" style="background-color:#81DAF5;height:100%;width:200px;float:left;">
                <b>Menu</b><br><br>
                <a href="home.jsp" >Home </a><br><br>
                <a href="#">Further Detials Dummy</a><br><br>
                <a href="logout.jsp" >Log out </a>
            </div>
       

        <form method="post" action="LoginServlet">
            <h1>Attend  Log in</h1>
            <div class="inset">
                <p>
                    <label for="email">EMAIL ADDRESS</label>
                    <input type="text" name="email" id="email">
                </p>
                <p>
                    <label for="password">PASSWORD</label>
                    <input type="password" name="password" id="password">
                </p>
                <input type="hidden" name="usertype"  value="m" >
                <p>
                    <input type="checkbox" name="remember" id="remember">
                    <label for="remember">  Remember me for 14 days</label>
                </p>
            </div>
            <p class="p-container">
                <span>Forgot password ?</span>
                <input type="submit" name="go" id="go" value="Log in">
            </p>
        </form>
         </div>
    </body>
</html>


