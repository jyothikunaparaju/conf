<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : 18-May-2014, 15:20:54
    Author     : Ravi
--%>

<html>
    <head><link rel="stylesheet" type="text/css" href="style2.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>List Users </title>
    </head> 
<sql:query var="result" dataSource="jdbc/myDatasource">
    select * from users
</sql:query>
    
<table border="0">
    <!-- column headers -->
    <tr >
    <c:forEach var="columnName" items="${result.columnNames}">
        <th><c:out value="${columnName}"/></th>
    </c:forEach>
</tr>
<!-- column data -->
<c:forEach var="row" items="${result.rowsByIndex}">
    <tr>
    <c:forEach var="column" items="${row}">
        <td><a href="editmember.jsp"   ><c:out value="${column}"/></a></td>
    </c:forEach>
    </tr>
</c:forEach>
</table>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
<link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
        <h2 ><a class="l" href="meal.jsp" >Update Meal program </a></h2>
        
    </body>
</html>
