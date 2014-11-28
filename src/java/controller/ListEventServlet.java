/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import app.Event;
import app.Member;
import dao.EventDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KSR
 */
public class ListEventServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "eventplan/editevent.jsp";
    private static String LIST_EVENT = "alleventslist.jsp";
   
    public EventDAO dao;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Member user = (Member) session.getAttribute("user");
        dao = new EventDAO();
        String forward = "";
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("listevent")) {
            forward = LIST_EVENT;
            List<Event> allEvents = dao.getEventsWithSignin(user.getMemberId());
            session.setAttribute("allevents", allEvents);

        }
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        httpResponse.sendRedirect(request.getContextPath() + "\\eventplan\\" + forward + "?action=" + action);
    }

}
