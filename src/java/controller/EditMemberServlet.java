

package controller;
import util.*;
import dao.*;
import app.Member;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class EditMemberServlet extends HttpServlet {
   // private static String LIST_USER = "/listuser.jsp";

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        short status  = 1;
        String memberid  = request.getParameter("memberid");
        System.out.println("memberid" + memberid);        
        Member memb = new Member();
        memb.setActive(status);
        memb.setMemberId(Integer.parseInt(memberid));
        MemberDAO dao = new MemberDAO();
        dao.updateStatus(memb);
     //   boolean emailFlag =  memb.sendEmail();
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        httpResponse.sendRedirect("member\\members.jsp");
  }

   

}
