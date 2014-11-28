<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="app.Event" %>
<%@ page import="dao.EventDAO" %>

<SCRIPT LANGUAGE="JavaScript">
    <!--
                function newWindow(url) {
        var x, y;
        x = screen.width - 35;
        y = screen.height - 30;
        var win = window.open(url, 'glossaryWindow', 'toolbar=no,directories=no,width=500,height=500' +
                'screenX=0,screenY=0,top=0,left=0,location=no,status=no,scrollbars=no,resize=yes,menubar=no');
    }
    //-->
</SCRIPT>
<html>
    <head><link rel="stylesheet" type="text/css" href="mstylecss.css" />
        <link rel="shortcut icon" type="image/x-icon" href="../css/images/favicon.ico" />
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Event </title>

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
                <a href="../logout.jsp" >Log out </a><br><br>
                <a href="editevent.jsp?action=add" >Add - Event </a><br><br>
                <a  href="../member/members.jsp" >Members List</a>

            </div>

            <div id="content" style=" background-color: lightyellow;height:500px;width:700px;float:left" >
                <table>
                        <form method="POST" action="../UpdateEventServlet" >
                        <%   String action = request.getParameter("action");
                           System.out.println("action :" + action);

                           if (action.equalsIgnoreCase("edit")) {%>
                        <input type="hidden" name ="action" value="edit" />
                        <input type="hidden" name="eventid" value="${event.eventId}" />
                        <% } else { %>
                        <input type="hidden" name="action" value="add" />
                        <input type="hidden" name="eventid" value="0" />
                        <%  } %>
                        <tr>
                            <td> 
                                Event  Name :
                            </td>
                            <td> 
                                <% if (action.equalsIgnoreCase("edit")) {%>
                                <input type="text" name="eventname" value="<c:out value="${event.eventDetails}" />" /> <br /> 
                                <% } else { %> 
                                <input type="text" name="eventname"  /> <br /> 
                                <% } %>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                Conference : 
                            </td>
                            <td>
                                <input type="text" name="conference" value="<c:out value="${sessionScope.conference.confDetails}" />" readonly="readonly" /> Read Only
                            </td>
                        </tr>
                        <tr>
                            <td>      
                                Location : 
                            </td>
                            <td> 
                                <% if (action.equalsIgnoreCase("edit")) {%>
                                <input type="text" onchange="myFunction()" id ="location" name="location"  value="<c:out value="${event.location}" />" > 
                                <SCRIPT LANGUAGE="JavaScript">
                                    var x;
                                    function myFunction() {
                                        x = document.getElementById("location").value;
                                    }
                                    x = document.getElementById("location").value;
                                    }
                                </script>
                                <!--      <a href="../map.jsp" onclick="location.href=this.href+'?key='+x;return false;" > map </a>
                                    
                                -->
                                <a href="#" onclick="window.open('../googlemap.jsp', '_blank')" > Map </a>

                                <% } else {%>
                                <input type="text" name="location"   />
                                <a href='../map.jsp?address=<%= request.getParameter("location")%>'  > map </a>

                                <%}%>
                            </td> 
                        </tr>     
                        <% if (action.equalsIgnoreCase("edit")) {%>
                        <tr>
                            <td>                               
                                Date  :
                            </td>
                            <td> 
                                <input type="text" name="dt" value= '<fmt:formatDate pattern="yyyy/MM/dd" value="${event.date}" />' readonly="readonly"/>(You Can't Change this)  <br />
                                 
                            </td>    
                        </tr>
                        <%} else {%>
                        <tr>                
                            <td>   
                                Date  :
                            </td>
                            <td> 

                                <% if (action.equalsIgnoreCase("edit")) {%>
                                <input type="text" name="dt" value= '<fmt:formatDate pattern="yyyy/MM/dd" value="" />' />(yyyy/MM/dd)  <br /> 
                                <% } else { %>
                                <input type="text" name="dt"   />(yyyy/MM/dd)  <br /> 
                                <%}%>



                            </td>
                             </tr>
                            <%}%>
                        <tr>    
                            <td>
                                Time : 
                            </td>
                            <td>
                                <% if (action.equalsIgnoreCase("edit")) {%>
                                <input type="text" name="time"  value="<c:out value="${event.time}" />" /> 
                                <% } else { %>
                                <input type="text" name="time"   />
                                <%}%>
                            </td> 
                        </tr>

                        <tr>    
                            <td>
                                Contact : 
                            </td>
                            <td>
                                <input type="text" name=""  readonly="true" value="<c:out value="${sessionScope.user.name}"   />" />  Read only
                            </td> 
                        </tr>
                        <tr>    
                            <td>
                                Phone : 
                            </td>
                            <td>
                                <input type="text" name="phone"  readonly="true" value="<c:out value="${sessionScope.user.phone}"   />" /> Read only     
                            </td> 
                        </tr>
                        <tr>    
                            <td>
                                Email : 
                            </td>
                            <td>
                                <input type="text" name="email"  readonly="true" value="<c:out value="${sessionScope.user.email}"   />" />  Read only     
                            </td> 
                        </tr>
                        <tr>
                            <td>
                                <input type="submit" value="Submit" />
                            </td>
                             </form>
                            <% if (action.equalsIgnoreCase("edit")) {%>

                    <form action="../EditEventServlet" method="post" />
                    <td>  <input type="hidden" name="action" value="delete" />
                        <input type="hidden" name="eventid" value="${event.eventId}" />

                        <input type="submit" value="Delete" />
                    </td>
                    </form>
                    <% }%>
                    </tr>
                           
                </table>

            </div>
        </div>



        <div id="footer" style="background-color:#FFA500;clear:both;text-align:center;">
            Copyright © conferencebook.com
        </div>


    </body>

</html>

