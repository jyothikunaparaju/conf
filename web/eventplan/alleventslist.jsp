<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
  <%@ page  import="app.Event" %> 
  <%@ page  import="app.Member" %> 
  <%@ page import="java.sql.*" %>
 <%@ page import="java.util.*" %>
<%-- 
    Document   : index
    Created on : 18-May-2014, 15:20:54
    Author     : Ravi
--%>

<html>
    <head><link rel="stylesheet" type="text/css" href="mstylecss.css" />
       <link rel="shortcut icon" type="image/x-icon" href="../css/images/favicon.ico" />

        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>List of Events </title>
   
    </head> 
    <body>
    <div id="container" style="width:100%">

<div id="header" style="background-color: olive;width:100%;height: 200px"  >
<h1 style="margin-bottom:0;">List of Events  arranged During Conference</h1>
<img src="../css/images/officialdinner.jpg"  style="height:150px;width:1000px;padding-left: 30px"/>

</div>

<div id="menu" style="background-color:  darkgoldenrod;height:100%;width:200px;float:left;">
    <b>Menu</b><br><br>
<a href="../home.jsp" >Home</a><br><br>
<a href="alleventslist.jsp">View  Events </a><br><br>
<a href="../logout.jsp"> Log out </a><br><br>
<a href="editevent.jsp?action=add" >Add - Event </a><br><br>
<a  href="../member/members.jsp" >Members List</a>

</div>
    
 <div id="content" style=" background-color: lightyellow;height:500px;width:700px;float:left" >
   
            
     
                           
            <tr>            <table>
     <!-- column data -->
     <tr> <th>Event Details</th>
                 <th> Date </th>
                 <th> Location Address </th>
                 <th>Time </th>
                 <th>Contact </th>
                 <th>Email</th>
                 <th>Phone</th>
             </tr>
                  <c:forEach var="event" items="${sessionScope.allevents  }">
    
             <tr>   <td><c:out value="${event.eventDetails}"/></td>                                          
                    <td><c:out value="${event.date}"/></td>                   
                    <td><c:out value="${event.location}"/></td>                    
                    <td><c:out value="${event.time}"/></td> 
                    <td><c:out value="${event.eventCreater.name}"/></td>
                    <td><c:out value="${event.eventCreater.email}"/></td>
                    <td><c:out value="${event.eventCreater.phone}"/></td>           
            <% Member  user = (Member)session.getAttribute("user");
            Event  pageEvent = (Event)pageContext.getAttribute("event");
            int pageEventid  =     pageEvent.getEventId() ;
            System.out.println("pagetid " + pageEventid);
            if (user.getMemberId() == (pageEvent.getEventCreater().getMemberId()) ){  %>   
<td>
                 <form action="../EditEventServlet"  method="post">
                     <input type="hidden" name="action" value="edit"/>
                     <input type="hidden" name="eventid" value="${event.eventId}" />
                     <input type="submit" value="Update/Delete  " /> 
                 </form>             
            </td>
                    
                    
              <% } else { 
                    if (pageEvent.isSignin() ) {
                             System.out.println("signin  " + pageEvent.isSignin());
           
                    //&& ((currentEvent.getUser().getMemberId()) == creater.getMemberId()){     
            
            %>  <td>
                   Already Registered     
                           
            </td>
           <%      } else { %>
           <td>
                 <form action="../UpdateEventServlet"  method="get">
                     <input type="hidden" name="action" value="signin"/>
                     <input type="hidden" name="eventid" value="${event.eventId}" />
                     <input type="submit" value="SignIn  " /> 
                 </form>             
            </td>
            <% } 
            
            }%>
            <td>
                    <form action="../MemberEventServlet"  method="post">
                        <input type="hidden" name="action" value="viewmembers"/>
                        <input type="hidden" name="eventid" value="${event.eventId}" />
                        <input type="submit" value="View Members" /> 
                    </form>             
             </td>
            </tr>    
        </c:forEach>
    </table>
</div>
    </div>
         
   

  <div id="footer" style="background-color:#FFA500;clear:both;text-align:center;">
Copyright © conferencebook.com
  </div>


       </body>
             
    </html>
