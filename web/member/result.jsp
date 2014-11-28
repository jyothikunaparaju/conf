<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Result </title>
        <link rel="stylesheet" type="text/css" href="style2.css" />
                      <link rel="shortcut icon" type="image/x-icon" href="css/images/favicon.ico" />

        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    </head> 
    <body>
        <div id="container" style="width:100%">
            <div id="header" style="background-color: olive;width:100%;height: 200px"  >
                <h1 style="margin-bottom:0;">List of Events  arranged During Conference</h1>
                <img src="css/images/officialdinner.jpg"  style="height:150px;width:1000px;padding-left: 30px"/>
            </div>
            <div id="menu" style="background-color:  darkgoldenrod;height:100%;width:200px;float:left;">
                <b>Menu</b><br><br>
                <a href="home.jsp" >Home</a><br><br>
                <a href="logout.jsp" >Log out </a><br><br>
                <a  href="member/members.jsp" >Members List</a>
            </div>
            <div id="content" style=" background-color: lightyellow;height:500px;width:700px;float:left" >
                <center>
                    <h3><%=request.getAttribute("Message")%></h3>
                </center>
            </div>
        </div>
    </body>
</html>
