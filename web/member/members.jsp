<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : 18-May-2014, 15:20:54
    Author     : Ravi
--%>

<html>
    <head>
	<link rel="stylesheet" type="text/css" href="style2.css" />
                      <link rel="shortcut icon" type="image/x-icon" href="../css/images/favicon.ico" />

        <title>Members</title>
    </head>
<body>

<div id="container" style="width:100%">

<div id="header" style="background-color:#FFA500;width:100%;height: 200px"  >
<h1 style="margin-bottom:0;">People Sign-in for Conference</h1>
<img src="../css/images/Sanfran.jpg"  style="height:150px;width:300px"/>
<img src="../css/images/techtalks.jpg"  style="height:150px;width:300px"/>
<img src="../css/images/javaone.jpg"  style="height:150px;width:300px"/>

</div>

<div id="menu" style="background-color:#FFD700;height:100%;width:200px;float:left;">
    <b>Menu</b><br><br>
<a href="../home.jsp" >Home</a><br><br>
<a href="../welcome.jsp">Welcome page</a><br><br>
<a href="../logout.jsp" >Log out </a></div>

<div id="content" style=" background-color: lightyellow;height:500px;width:700px;float:left" >
    <sql:query var="result" dataSource="jdbc/confDatasource">
        select * from member

    </sql:query>
    

    <c:if test="condition"></c:if>
        <table border="0" width="100%" >
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Active</th>
            </tr>
        <c:forEach var="row" items="${result.rows}">
            
            <td><a href="editmember.jsp?member=<c:out value="${row.name}"/>"><c:out value="${row.name}"/></a>
            </td> 
           
                     
                <td><c:out value="${row.email}"/></td>
                <td><c:out value="${row.phone}"/></td>
                
                 <td><c:out value=""/>
                    <c:choose>
                        <c:when test="${row.Active=='1'}">Active
                            <br />
                        </c:when> 
                        <c:otherwise> 
                            <form action ="../EditMemberServlet" method="post">
                                <input type="hidden" name="status" value="${row.Active}" />
                                <input type="hidden" name="uname" value="${row.name}" />
                                <input type="submit" value="Approve" />
                            </form>
                            <br />
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </table></div>
</div>

<div id="footer" style="background-color:#FFA500;clear:both;text-align:center;">
Copyright © W3Schools.com</div>



</body>
</html>

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
   