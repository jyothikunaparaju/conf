<%-- 
    Document   : mealregister
    Created on : Jun 7, 2014, 6:04:20 AM
    Author     : KSR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meal Page</title>
    </head>
    <body>
        <div id="container" style="width:100%">
            <div id="header" style="background-color:  yellowgreen;width:100%;height: 200px"  >
                <h2 style="margin-bottom:0;">Meal Registration complete..</h2>
                <img src="../css/images/banquet.jpg"  style="height:150px;width:1500px"/>


            </div>

            <div id="menu" style="background-color:  darkkhaki;height:500px;width:200px;float:left;padding-left: 10px;">
                <b>Menu</b><br><br>
                <a href="../home.jsp" >Home</a><br><br>
                <a href="#" >Log out </a><br><br>
                <a href="meallist.jsp"  >Back</a>
                <br><br>
            </div>

         

            <div id="content" style=" background-color: lightyellow;height:500px;width:1000px;float:left" >

                <h2>Hi <font color="red" > <%= session.getAttribute("uname")%> </font> you registered for <%= session.getAttribute("mealname") %> program  </h2>
                <br><p> <font size='4' color='blue' > Please check you email for further details </font></p> </br>


            </div>
        </div>
                <div id="footer" style="background-color:#FFA500;clear:both;text-align:center;">
Copyright © W3Schools.com</div>

    </body>
</html>
