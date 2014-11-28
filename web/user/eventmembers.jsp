<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : 18-May-2014, 15:20:54
    Author     : Ravi
--%>

<html>
    <head><link rel="stylesheet" type="text/css" href="style3.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                      <link rel="shortcut icon" type="image/x-icon" href="../css/images/favicon.ico" />

        <title>Member List  </title>
    </head> 
    <body>
        <div id="container" style="width:100%">
            <div id="header" style="background-color:  #61210B;width:100%;height: 200px"  >
                <h1 style="margin-bottom:0;">Members Signup for this meal Program</h1>
                <img src="../css/images/confmeal.jpg"  style="height:150px;width:300px"/>
                <img src="../css/images/meetings.jpg"  style="height:150px;width:300px"/>
                <img alt=" " src="../css/images/meal.jpg"  style="height:150px;width:300px"/>
                  </div>
               <div id="menu" style="background-color: #8A2908;height:100%;width:200px;float:left;padding-left: 10px;">
                <b>Menu</b><br><br>
                <a href="../home.jsp" >Home</a><br><br>
                <a href="../logout.jsp" >Log out </a><br><br>
               <a href="../eventplan/alleventslist.jsp" >Back</a>
                           <br><br>
                <p>Please Sign in any of the meal programs.Email will be received after meal program has been approved</p><br>
                <p>Click on 'View Members' and find out ,members signed in for the same meal program</p>
            </div>


         
            <div id="content" style=" background-color: lightyellow;height:500px;width:800px;float: left;   " >
      
                    <table  >
                        <tr >
                            <td><Strong>Name</strong></td>
                            <td><strong>Email</strong></td>
                            <td><strong>Phone</strong></td>
                            <td><strong>Designation</strong></td>
                        </tr>
                        <c:forEach var="row" items="${members}">   
                        <tr>
                            <td>
                                <c:out value="${row.name}"/>  
                            </td>                    
                            <td>
                                <c:out value="${row.email}"/>
                            </td>
                            <td>
                                <c:out value="${row.phone}"/>
                            </td>
                            <td>
                                <c:out value="${row.designation}"/>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>

        </div>
                    <div id="footer" style="background-color:#FFA500;clear:both;text-align:center;">
Copyright © W3Schools.com</div>

    </body>


</html>
