<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Send an e-mail</title>
        <link rel="stylesheet" type="text/css" href="style2.css" />
        <link rel="shortcut icon" type="image/x-icon" href="../css/images/favicon.ico" />

        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    </head> 


    <body>
        <div id="container" style="width:100%">

            <div id="header" style="background-color: olive;width:100%;height: 200px"  >
                <h1 style="margin-bottom:0;">List of Events  arranged During Conference</h1>
                <img src="../css/images/officialdinner.jpg"  style="height:150px;width:1000px;padding-left: 30px"/>

            </div>

            <div id="menu" style="background-color:peru;height:500px;width:200px;float:left;">
                <b>Menu</b><br><br>
                <a href="../home.jsp" >Home</a><br><br>
                <a href="../logout.jsp" >Log out </a><br><br>
                <a  href="members.jsp" >Members List</a>


            </div>

            <div id="content" style=" background-color: lightyellow;height:500px;width:700px;float:left" >


                <form action="../EmailSendingServlet" method="post">
                    <table >
                        <h2>  <caption>Send E-mail</caption></h2>
                        <tr>
                            <td width="50%">Recipient address </td>
                            <td><input type="text" name="recipient" size="50" value='<%= request.getParameter("memail") %>'/></td>
                        </tr>
                        <tr>
                            <td>Subject </td>
                            <td><input type="text" name="subject" size="50"/></td>
                        </tr>
                        <tr>
                            <td>Content </td>
                            <td><textarea rows="10" cols="39" name="content"></textarea> </td>
                        </tr>
                        <tr>
                            <td ><input type="submit" value="Send"/></td>
                            <td  ><input type="reset" value="Reset"/></td>

                        </tr>
                    </table>

                </form>
            </div>
        </div>

    </body>

</html>