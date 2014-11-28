/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.EventDAO;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import app.Event;
import app.Member;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ravi
 */
public class EditEventServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "editevent.jsp";
    private static String LIST_EVENT = "alleventslist.jsp";
    public EventDAO dao;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int eventId = 0;
        int memberId = 0;
        try {
            eventId = Integer.parseInt(request.getParameter("eventid"));
        } catch (NumberFormatException ne) {
            System.out.println("Number format in Eventid servelet");
        }
       
       /*
        try {
            memberId = Integer.parseInt(request.getParameter("userid"));
        } catch (NumberFormatException ne) {
            System.out.println("Number format in memberid  .dsfdsfgsdgsdgdsgsdgds..  servelet" + memberId);
        }
*/
        HttpSession session = request.getSession();
       Member member = (Member)session.getAttribute("user");
       memberId = member.getMemberId();
        dao = new EventDAO();
        String forward = "";
        Event event= null;
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("delete")) {
            dao.deleteEvent(Integer.parseInt(request.getParameter("eventid")));
            forward = LIST_EVENT;
            session.setAttribute("allevents", dao.getEventsWithSignin(member.getMemberId()));
        } else if (action.equalsIgnoreCase("edit")) {
            System.out.println("In edit....................");
             event = dao.getEventById(Integer.parseInt(request.getParameter("eventid")));
            System.out.println("event name : ...");
            session.setAttribute("event", event);
            forward =INSERT_OR_EDIT;
        
        } else if (action.equalsIgnoreCase("add")) {
            event = new Event();
            forward = LIST_EVENT;
            session.setAttribute("event", event);
        } else {
            forward = INSERT_OR_EDIT;
        }
       // RequestDispatcher view = request.getRequestDispatcher("eventplan\\editevent.jsp");
        //request.setAttribute("users", dao.getAllUsers());
        // view.forward(request, response);
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        httpResponse.sendRedirect(request.getContextPath() + "\\eventplan\\" + forward + "?action=" + action );
    }

    public List updateEventSignIn(List events, int memberid) {
        EventDAO dao = new EventDAO();
        Event event = null;
        List eventslist = new ArrayList();
        for (Object item : events) {
            event = dao.updateEventSignIn((Event) item, memberid);
            System.out.println("item................" + event.isSignin());
            eventslist.add(event);

        }

        return eventslist;
    }
}
