package controller;

import app.Event;
import app.EventMember;
import dao.*;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import app.Member;
/*
Responds from alleventslist.jsp ; 
Action view members  of corresponding event clicked.
returns members registed for the that event ,  in member/members.jsp page
*/
public class MemberEventServlet extends HttpServlet {

    MemberDAO dao = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String memberid = request.getParameter("memberid");
        String action = request.getParameter("action");
        int eventid = 0;
        try {
            eventid = Integer.parseInt(request.getParameter("eventid"));
        } catch (Exception e) {
            System.out.println("Numberformat  ....." + eventid);
        }
        //  Member member = new Member();       
        Event event = new Event();
        event.setEventId(eventid);
        EventDAO dao = new EventDAO();
        System.out.println("eventid ........ " + eventid);
       MemberDAO mdao = new MemberDAO();
        if (action != null && action.equals("register")) {
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.sendRedirect("user/eventregister.jsp?name=" + memberid);
        } else if (action != null && action.equals("viewmembers")) {
            System.out.println("In action viwmembers");
            List<Member> members = mdao.getMembersbyEventId(eventid);
            session.setAttribute("members", members);
            session.setAttribute("eventid", request.getParameter("eventid"));
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.sendRedirect("user\\eventmembers.jsp");
        }
    }
}
