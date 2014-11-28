package controller;

import app.ConferenceDetails;
import dao.EventDAO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import app.Event;
import app.EventMember;
import app.Member;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import util.EmailUtility;

/**
 *
 * @author Ravi
 */
public class UpdateEventServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    public EventDAO dao;
    int eventid;
    /*
     Method fired when a member sign in to the event. 
     Adds record to EventMember table  , Update sign in flag in Session Event object.
    
     */
    Event event = new Event();
    static final int EVENT_MEMBER = 0;
    static final String ALLEVENTS_LISTPAGE = "\\eventplan\\alleventslist.jsp";

    String action;
    private static final String ACTION = "action";
    static final String ADD = "add";
    static final String UPDATE = "edit";
    static final String SIGNIN = "signin";
    private static final String ALLEVENTS = "allevents";
    private static final String EVENT = "event";
    private static final String USER = "user";
    private static final String EVENTID = "eventid";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        dao = new EventDAO();

        event = getEvent(request);

        Member user = (Member) session.getAttribute(USER);

        action = request.getParameter(ACTION);

        if (action != null && action.equals(SIGNIN)) {

            EventMember em = dao.addEventMember(eventid, user.getMemberId(), EVENT_MEMBER);

            List<Event> events = (List) session.getAttribute(ALLEVENTS);
            //UPDATES SIGN IN FLAG 
            events = updateSignIn(event, events);

            request.setAttribute(EVENT, event);

            session.setAttribute(ALLEVENTS, events);

            emailMember(user, event);
        }
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        httpResponse.sendRedirect(request.getContextPath() + ALLEVENTS_LISTPAGE);
    }

    // Loops and sets singin flag to true for given event in allevents list
    public List updateSignIn(Event event, List<Event> allEvents) {
        boolean isSignin = true;

        List<Event> events = new ArrayList();

        for (Event item : allEvents) {

            if (item.getEventId().equals(event.getEventId())) {

                item.setSignin(isSignin);
            }
            events.add(item);
        }
        return events;
    }
//Update Event Details by Event creater  

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
        HttpSession session = request.getSession();
        action = request.getParameter(ACTION);
        Member creater = (Member) session.getAttribute(USER);
        ConferenceDetails cd = new ConferenceDetails();

        dao = new EventDAO();
        event = getEvent(request);
        event.setEventDetails(request.getParameter("eventname"));
        System.out.println("event details ....21412412412412412412412421421421......" + event.getEventDetails());
        event.setEventCreater(creater);
        event.setTime(Double.parseDouble(request.getParameter("time")));
        event.setLocation(request.getParameter("location"));
        cd.setConfDetails(request.getParameter("conference"));
        event.setConference(cd);
         try {
            Date date = new SimpleDateFormat("yyyy/MM/dd").parse(request.getParameter("dt"));
            event.setDate(date);
        } catch (ParseException e) {
             System.out.println("Parse exception in post date format");
        }
        boolean success = false;

        if (action != null && action.equals(ADD)) {

            success = dao.addEvent(event);

            if (success) {
                List<Event> events = (List) session.getAttribute(ALLEVENTS);
                events.add(event);
                session.setAttribute(ALLEVENTS, events);
            }
        } else {

            dao.updateEvent(event);
            List<Event> allEvents = dao.getEventsWithSignin(creater.getMemberId());
            session.setAttribute(ALLEVENTS, allEvents);

        }
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        httpResponse.sendRedirect(request.getContextPath() + ALLEVENTS_LISTPAGE);
    }

    public List updateEventSignIn(List events, int memberid) {

        dao = new EventDAO();

        List eventslist = new ArrayList();

        for (Object item : events) {

            event = dao.updateEventSignIn((Event) item, memberid);

            System.out.println("item................" + event.isSignin());

            eventslist.add(event);

        }

        return eventslist;
    }
    /*
     sendEmail(String host, String port,
     final String userName, final String password, String toAddress,
     String subject, String message) throws AddressException,
     MessagingException 
     */

    public boolean emailMember(Member user, Event event) {
        String subject = "NO REPLY : From  event during Conference " + event.getConference() + "dated " + event.getDate();
        String message1 = " This automatic message system from Email service of conference event. ";
        String message2 = user.getName() + ", " + user.getDesignation() + " , " + "jkunaparaju@yahoo.com" + "Signed in for your event " + event.getEventDetails()
                + ", for Conference " + event.getConference();

        try {
            EmailUtility.sendEmail("smtp.gmail.com", "587", "jkunaparaju@gmail.com", "052883764", user.getEmail(), subject, message1 + message2);
        
        } catch (MessagingException e) {

            e.printStackTrace();

            return false;
        }

        return true;
    }

    public Event getEvent(HttpServletRequest request) {
        try {
            eventid = Integer.parseInt(request.getParameter(EVENTID));

        } catch (NumberFormatException e) {

            e.printStackTrace();

            System.out.println("In number format Update  event servlet ,get event ");
        }
        if (request.getParameter(ACTION).equals(UPDATE) && eventid != 0 ) {

            event = dao.getEventById(eventid);
        }else {
            System.out.println("In Creating new Event");
            event = new Event ();
        }
        return event;
    }
}
