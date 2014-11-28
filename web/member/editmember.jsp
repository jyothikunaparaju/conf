<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="app.Event" %>
<%@ page import="dao.EventDAO" %>
<head>
    <link rel="stylesheet" type="text/css" href="style2.css" />
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>View Member </title>
    <link rel="shortcut icon" type="image/x-icon" href="../css/images/favicon.ico" />
	

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
            <a href="../logout.jsp" >Log out </a><br><br>
            <a  href="members.jsp" >Members List</a>
            

        </div>

        <div id="content" style=" background-color: lightyellow;height:500px;width:700px;float:left" >
            <table>

                <sql:query var="result" dataSource="jdbc/confDatasource">
                    select * from member where name = "<c:out value="${param.member}"/>"
                </sql:query>
                <c:if test="condition"></c:if>

                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td>Member Name </td><td><c:out value="${row.name}"/></td>
                    </tr>
                    <tr>
                        <td>Member Email</td><td><c:out value="${row.email}"/></td>
                    </tr>
                   
                    <tr>
                        <td> Designation </td>
                        <td> <c:out value="${row.designation}"/></td>
                    </tr>
                    <tr>
                        <td>Address </td>
                        <td> <c:out value="${row.address}"/></td>
                    </tr>
                    <tr>
                        <td>Phone </td>
                        <td> <c:out value="${row.phone}"/></td>
                    </tr>
                    <tr>
                        <td> Contact  </td>
                        <td><form method="get" action="EmailForm.jsp" > 
                                <input type="hidden" name="memail" value="${row.email}" >
                                <input type="submit" name="Contact" value="Sendemail" >
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
