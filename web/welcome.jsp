<%-- 
    Document   : home
    Created on : 18-May-2014, 18:07:59
    Author     : Ravi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="app.ConferenceDetails" %>
<html>
    <head><meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
	<meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1' />
	<link rel="stylesheet" type="text/css" href="styles.css" />
         <script src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
	<script type='text/javascript' src='menu_jquery.js'></script>
                      <link rel="shortcut icon" type="image/x-icon" href="css/images/favicon.ico" />

        <title>Welcome</title>
    </head>
    <body>
        
        
  <img src="css\images\con-image.jpg"   id="banner" alt="Banner Image" />
   <div id='cssmenu'>
<ul>
   <li class='active'><a href='home.jsp'><span>Home</span></a></li>
   <li class='has-sub'><a href='#'><span>View Members Sign in </span></a>
      <ul>
         <li><a href="member/members.jsp"><span>Members List</span></a></li>
         <li><a href="map.jsp" onclick="window.open('http://maps.googleapis.com/maps/api/staticmap?center=Vishakhapatnam,IN&zoom=13&size=1000x600');return=false ;" ><span>Map</span></a></li>
         <li class='last'><a href='#'><span>Products</span></a></li>
      </ul>
   </li>
   
   <li ><a href='#'><span>Events </span></a>
      <ul>
         <li> <form action ="ListEventServlet" method="post">
                                <input type="hidden" name="action" value="listevent" />
                                <input type="submit" value="List Events" />
                            </form></li>
         <li class='last'><a href="#" onclick="window.open('googlemap.jsp' ,'_blank')"><span>Location</span></a></li>
      </ul>
       
   </li>
   <li class='last'><a href='member\EmailForm.jsp?memail=jkunaparaju@gmail.com'><span>Contact</span></a></li>
      <li class='last'><a href='logout.jsp'><span>Log out</span></a></li>

</ul>
</div>
         <% 
       int id=0;
        String name = "Conference_Name";
        String manager = "EventManager";
        String address = "Address";
        java.util.Date  fromDate ;
        java.util.Date toDate;
        String org = "Organization";
        String desc = "Description";
        String email;
        int phone;
        String contact;
    System.out.println(".......dfsdfdsfdsf.............."+request.getParameter("memberid"));
    
           Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            String driverName = "com.mysql.jdbc.Driver";
            String url = "jdbc:mysql://localhost:3306/confevents";
            String user = "root";
            String dbpsw = "jyoth1";
            String sql = "select * from conference_details where conf_id=2";
            ConferenceDetails conf = new ConferenceDetails();
            try {
                System.out.println(sql);
                Class.forName(driverName);
                con = DriverManager.getConnection(url, user, dbpsw);
                System.out.println(sql);
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
               if (rs.next()) {
                   id = rs.getInt("CONF_ID");
                   name = rs.getString("CONF_DETAILS");
                   org = rs.getString("ORAGANIZATION");
                   contact =rs.getString("CONTACT");
                   fromDate = rs.getDate("FROMDATE");
                    toDate = rs.getDate("TODATE");
                    email = rs.getString("EMAIL");
                    address = rs.getString("ADDRESS"); 
                    phone = rs.getInt("PHONE");
                    desc = rs.getString("DESCRIPTION");
                    System.out.println(desc + org +toDate);
                    conf.setConfId(id);
                    conf.setConfDetails(name);
                    conf.setAddress(address);
                    conf.setEmail(email);
                    conf.setContact(contact);
                    conf.setDescription(desc);
                    conf.setFromdate(fromDate);
                    conf.setTodate(toDate);
                    conf.setOraganization(org);
                    session.setAttribute("conference", conf);
                    session.setAttribute("id", id);
                    session.setAttribute("address", address);
                    session.setAttribute("fromDate", fromDate);
                    session.setAttribute("toDate", toDate);
                   session.setAttribute("org", org);
                    session.setAttribute("desc", desc);
                     session.setAttribute("phone", phone);
                      session.setAttribute("email", email);
                       session.setAttribute("contact", contact);
                 //   response.sendRedirect("welcome.jsp");
                }
                   
                rs.close();
                ps.close();
            } catch (SQLException sqe) {
                out.println(sqe);
                System.out.println("Exception ");
            }
        

        
    %>
   
    
    
    <table>
    <strong>
    <tr>
        <td><%= session.getAttribute("address")%>
      Conference Unique Id   <%= id%>
</td>
    </tr>
    <tr>
<td>
    Conference Name  : <%= name %>
</td></tr>
    <tr><td>
      Conference address :<input type="hidden" id="location" value="<%= address%>" > <%= address%>
        </td></tr>
    <tr><td>
    Organization   : <%= org %>
        </td></tr></strong>
        <tr ><td> ---------------------------------</td></tr>
</table>
    </body>
     
</html>
