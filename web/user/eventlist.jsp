<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
 
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style3.css" />
        <title>List Meals </title>
    </head> 
            <body>

    <div id="container" style="width:100%">
<div id="header" style="background-color: #220A29;width:100%;height: 200px"  >
<h1 style="margin-bottom:0;">Meal Plans Available during Conference</h1>
<img src="../css/images/confmeal.jpg"  style="height:150px;width:300px"/>
<img src="../css/images/meetings.jpg"  style="height:150px;width:300px"/>
<img src="../css/images/meal.jpg"  style="height:150px;width:300px"/>
<img src="../css/images/dinner.jpg"  style="height:150px;width:300px"/>


</div>

<div id="menu" style="background-color:#0489B1;height:100%;width:200px;float:left;padding-left: 10px;">
    <b>Menu</b><br><br>
<a href="../home.jsp" >Home</a><br><br>
<a href="#" >Log out </a><br><br>
            <a href="welcomeuser.jsp"  >Back</a>
            <br><br>
            <p>Please Sign in any of the meal programs.Email will be received after meal program has been approved</p><br>
            <p>Click on 'View Members' and find out ,members signed in for the same meal program</p>
            </div>

<div id="content" style=" background-color: lightyellow;height:500px;width:1000px;float:left" >
       <sql:query var="result" dataSource="jdbc/myDatasource">
            select * from meal
        </sql:query> 
            <table style="width:700px">           
                <tr><th>Meal ID</th>
                    <th>Meal Description</th>                  
                    <th>Date</th>
                    <th>Place </th>
                    <th>Meal Type Name</th>
                </tr>
            <c:forEach var="row" items="${result.rows}">            
                <td><c:out value="${row.mealId}"/> </td>                     
                <td><c:out value="${row.MealName}"/></td>
                <td><c:out value="${row.Date}"/></td>
                <td><c:out value="${row.Place}"/> </td>
                <td><c:out value="${row.MealTypeName}"/></td>
                <td> <form action="../UserMealServlet"  method="post">
                        <input type="hidden" name="action" value="register" />
                        <input type="hidden" name="uname" value="<%= session.getAttribute("uname")%>"/>
                        <input type="hidden" name="mealid" value="${row.mealId}" />
                         <input type="hidden" name="mealname" value="${row.mealName}" />
                        <input type="submit" value="Signup" />
                    </form>
                </td>
              
                <td> <form action="../UserMealServlet"  method="post">
                        <input type="hidden" name="action" value="viewmembers" />
                        <input type="hidden" name="mealid" value="${row.mealId}" />
                        <input type="submit" value="View Members" />
                    </form>
                </td>

            </tr>
        </c:forEach>
    </table>
</div>

    
</body> 
</html>
