<%-- 
    Document   : home
    Created on : 18-May-2014, 18:07:59
    Author     : Ravi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>

    <head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
        <meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1' />
        <link rel="stylesheet" type="text/css" href="style3.css" />
        <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
        <script type='text/javascript' src='../menu_jquery.js'></script>
        <title>Home</title>
    </head>
    <body style="background:  #CEE3F6">
        <div id="container" style="width:100%">

            <div id="header" style="background-color:#FFA500;width:100%;"  >

                <img src="..\css\images\leadership.jpg"   id="banner" alt="Banner Image" style="width: 100%"/>
            </div>
            <div id='cssmenu'>
                <ul>
                    <li class='active'><a href='../home.jsp'><span>Home</span></a></li>
                    <li class='has-sub'><a href='#'><span>View Members Singned</span></a>
                        <ul>
                            <li><a href="#"><span>Members List</span></a></li>
                            <li><a href='#'><span>Menus</span></a></li>
                            <li class='last'><a href='#'><span>Products</span></a></li>
                        </ul>
                    </li>
                    <li class='has-sub'><a href='#'><span>Meal Programs</span></a>
                        <ul>
                            <li> <a href="meallist.jsp?uname=<%= session.getAttribute("uname")%>" ><span>Meal Plan List</span></a></li>
                            <li class='last'><a href='#'><span>Location</span></a></li>
                        </ul>

                    </li>
                    <li class='last'><a href='#'><span>Contact</span></a></li>
                    <li class='last'><a href='logout.jsp'><span>Log out</span></a></li>

                </ul>
            </div>
            <div id="menu" style="background-color:#0489B1;height:100%;width:200px;float:left;">
                <b>Menu</b><br><br>
                <a href="../home.jsp" >Home</a><br><br>
                <a href="#">Further Detials Dummy</a><br><br>
                <a href="#" >Log out </a>
            </div>
<div id="content" style=" background-color: #CEE3F6;height:500px;width:700px;float:left" >

            <%
                String uname = request.getParameter("uname");
                System.out.println("uname .......: " + uname);
                String id = "Conference_id";
                String name = "Conference_Name";
                String manager = "EventManager";
                String address = "Address";
                String fromDate = "Date_from";
                String toDate = "Date_to";
                String org = "Organization";
                String desc = "Description";

                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                String driverName = "com.mysql.jdbc.Driver";
                String url = "jdbc:mysql://localhost:3306/confevents";
                String user = "root";
                String dbpsw = "jyoth1";
                String sql = "select * from conferencedetails where conference_id=1";
                try {
                    System.out.println(sql);
                    Class.forName(driverName);
                    con = DriverManager.getConnection(url, user, dbpsw);
                    System.out.println(sql);
                    ps = con.prepareStatement(sql);
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        id = rs.getString("Conference_id");
                        name = rs.getString("Conference_Name");
                        address = rs.getString("Address");
                        fromDate = rs.getString("Date_from");
                        toDate = rs.getString("Date_to");
                        org = rs.getString("Organization");
                        desc = rs.getString("Description");
                        System.out.println(desc + org + toDate);
                        session.setAttribute("id", id);
                        session.setAttribute("address", address);
                        session.setAttribute("fromDate", fromDate);
                        session.setAttribute("toDate", toDate);
                        session.setAttribute("org", org);
                        session.setAttribute("desc", desc);
                        //   response.sendRedirect("welcome.jsp");
                    }

                    rs.close();
                    ps.close();
                } catch (SQLException sqe) {
                    out.println(sqe);
                    System.out.println("Exception ");
                }


                %>
            <table border="0" style='font-size:  x-large; text-decoration-color:  #0252aa'   >
                <strong>
                    <br><br><br>
                    <tr>
                        <td >
                            Conference Unique Id   <%= id%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Conference Name  : <%= name%>
                        </td></tr>
                    <tr><td>
                            Conference address :  <%= address%>
                        </td></tr>
                    <tr><td>
                            Organization   : <%= org%></font>
                        </td></tr></strong>
                <tr ><td> ---------------------------------</td></tr></strong>
            </table>
                        <div >
	<div >
		<div >
                    <h4>2014 IEEE International Symposium on Ethics in Engineering, Science, and Technology (ETHICS)</h4>
                    <br><br>
					<h4>IEEE sponsors:</h4>
					<div style="padding-left: 45px; padding-bottom: 5px;">
				    	<ul>
				    		<li>IEEE Education Society</li>
				    		<li> IEEE Ethics and Member Conduct Committee</li>
				    		<li> IEEE HKN - ETA KAPPA NU</li>
				    		<li> IEEE Product Safety Engineering Society</li>
				    		<li> IEEE Social Implications of Technology Society</li>
				    		<li> IEEE Technology Management Council</li>
				    		<li> IEEE USA Washington, DC</li>
				    		<li> Region 04 - Central USA</li>
				    		<li> Rock River Valley Section</li>
				    		<li> Women in Engineering</li>
				    	</ul>
					</div>
			      
   		    	 
    				   
    				   
				
					<h3>Other sponsors:</h3>
					<div style="padding-left: 45px; padding-bottom: 5px;">
				    	<ul>
				      		<li>ACM Code of Ethics and Professional Conduct</li>
				      		<li> ACM Special Interest Group on Computers and Society</li>
				    	</ul>
					</div>
	
</div><br>
                        
            <div id="footer" style="background-color:#F5A9A9;clear:both;text-align:center;">
                Copyright © W3Schools.com</div>
        </div>
    </body>
</html>
