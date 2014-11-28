<%-- 
    Document   : top
    Created on : Jul 2, 2014, 6:57:09 AM
    Author     : KSR
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="app.ConferenceDetails" %>
    <% 
       int id=0;
        String confname = "Conference_Name";
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
            String sql = "select * from conference_details where conf_id=7";
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
                   confname = rs.getString("CONF_DETAILS");
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
                    conf.setConfDetails(confname);
                    conf.setAddress(address);
                    conf.setEmail(email);
                    conf.setContact(contact);
                    conf.setDescription(desc);
                    conf.setFromdate(fromDate);
                    conf.setTodate(toDate);
                    conf.setOraganization(org);
                    session.setAttribute("conference", conf);
                    session.setAttribute("id", id);
                    session.setAttribute("confname", confname);
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
   
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="refresh" content="5; URL=home.jsp?confname='<%= session.getAttribute("confname") %>'">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
