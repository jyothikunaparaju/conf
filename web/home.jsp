<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="app.ConferenceDetails" %>
<html lang="en">
<head>
	     
      
        
	<title>ABC Conference</title>
	<link rel="shortcut icon" type="image/x-icon" href="css/images/favicon.ico" />
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="all" />
	
	<script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
	<!--[if lt IE 9]>
		<script src="js/modernizr.custom.js"></script>
	<![endif]-->
	<script src="js/jquery.flexslider-min.js" type="text/javascript"></script>
	<script src="js/functions.js" type="text/javascript"></script>
</head>
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
            String sql = "select * from conference_details where conf_details="+ request.getParameter("confname");
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
   
    
<body>
	<!-- wrapper -->
	<div id="wrapper">
		<!-- header -->
		<header class="header">
			<div class="shell">
				<h1 id="logo"><a href="#">ABC Conference</a></h1>
				
				<!-- navigation -->
				<nav id="navigation">
					<ul>
						<li class="active">
                                                    <a href= "login.jsp"   >Log in/Register</a>
							<span>Home </span>
						</li>
						<li>
							<a href="#">Details</a>
							<span>Details Of Conferencce</span>
						</li>
						<li>
							<a href="#">Updates</a>
							<span>Skins &amp; Schemes</span>
						</li>
						<li>
							<a href="#">Schedules</a>		
							<span>Take a Look</span>
						</li>
						<li>
							<a href="#">Contacts</a>
							<span>Find Us Now</span>
						</li>
					</ul>
					<div class="cl">&nbsp;</div>
				</nav>
				<!-- end of navigation -->
			</div>
		</header>
		<!-- end of header -->
		
		<!-- slider-holder -->
		<div class="slider-holder">
			<!-- shell -->
			<div class="shell">
				<span class="l"></span>
				<span class="r"></span>
				<span class="t"></span>
				<span class="b"></span>
				<a href="#" class="slider-btn">Plan your Tour</a>
				<!-- slider -->
				<div class="slider flexslider">
					<ul class="slides">
						<li>
							<img src="css/images/slide-img.png" alt="" />
							<div class="slide-cnt">
								<div class="box-t"></div>
								<div class="box-c">
									<div class="box-cnt">
                                                                            <h2> Welcome to <%= org %> </h2>
										<p>Please check your details before coming to Venue.Sign in and check  and plan events </p>
									</div>
									<div class="cl">&nbsp;</div>
								</div>
								<div class="box-b"></div>
							</div>	
						</li>
						<li>
							<img src="css/images/slide-img.png" alt="" />
							<div class="slide-cnt">
								<div class="box-t"></div>
								<div class="box-c">
									<div class="box-cnt">
										<h2><%= session.getAttribute("address")%></h2>
										<p>Register for Events and  programs of your choice with your favourite buddies.This is only opportunity you can't miss .Please send us feedback so that we can improve to serve you better </p>
									</div>
									<div class="cl">&nbsp;</div>
								</div>
								<div class="box-b"></div>
							</div>	
						</li>
					</ul>
				</div>
				<!-- end of slider -->
			</div>
			<!-- end of shell -->	
		</div>	
		<!-- end of slider-holder -->
		
		<!-- shell -->
		<div class="shell">
			<!-- main -->
			<div class="main">
				<section class="cols">
					<div class="col">
						<h3><a href="#">Events and Tech talks</a></h3>
						<a href="#"><img src="css/images/techtalks.png" alt="" /></a>
						<p>Find out what are major events & Technical discussiona with Geeks from technology </p>
					</div>

					<div class="col">
						<h3><a href="#">Meals Program</a></h3>
						<a href="#"><img src="css/images/meal.png" alt="" /></a>
						<p>Plan meals with your chioce of co attendies <br />You choose your topic to and also favourarite meals</p>
					</div>
					
					<div class="col">
						<h3><a href="#">Future Programs</a></h3>
						<a href="#"><img src="css/images/future.png" alt="" /></a>
						<p>Find out the future Programs by Oracle. <br />Suggestions are most welcome</p>
					</div>
					
					<div class="cl">&nbsp;</div>
				</section>
			</div>
			<!-- end of main -->
		</div>
		<!-- end of shell -->
		<div id="footer-push"></div>
	</div>
	<!-- wrapper -->

	<!-- footer -->
	<div id="footer">
		<div class="shell">
			<!-- footer-cols -->
			<section class="footer-cols">
				<div class="col">
					<h3>MORE <strong>ABOUT US</strong></h3>
					<p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Duis aliquet justo vel libero vestibulum euismod. Sed lacinia erat vitae quatale</p>
				</div>
				<div class="col">
					<h3>KEEP <strong>IN TOUCH</strong></h3>
					<p>Cum sociis natoque penatibus et magnis dolor</p>
					<form method="post">
						<input type="text" class="field" value="Your Email Here" title="Your Email Here" />
						<input type="submit" class="submit-btn" value="Submit" />
					</form>
				</div>
				<div class="col contact">
					<h3>CONTACT <strong>US</strong></h3>
					<h4>+ 123 456 78910</h4>
					<a href="#">johndoe@websitename.com</a>
				</div>
				<div class="cl">&nbsp;</div>
			</section>
			<!-- end of footer-cols -->
			<p class="copy">&copy; Company Name. Design by <a href="http://chocotemplates.com" target="_blank">ChocoTemplates.com</a></p>
			<div class="cl">&nbsp;</div>
		</div>	
	</div>
	<!-- end of footer -->
</body>
</html>
