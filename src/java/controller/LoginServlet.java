/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import app.Member;
import dao.MemberDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author KSR
 */
public class LoginServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("in servlet .........");

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println("email  + password .....  : " + email + password);
        HttpSession session = request.getSession();
        MemberDAO mdao = new MemberDAO();
        Member user = null;
        if (!(email.equals(null) || email.equals("")) && !(password.equals(null) || password.equals(""))) {
            user = mdao.getMemberByEmail(email, password);
            String userdbEmail = user.getEmail();
            String userdbPsw = user.getPassword();
            if (email.equals(userdbEmail) && password.equals(userdbPsw)) {
                System.out.println("......................." + user.getMemberId());
                session.setAttribute("user", user);
                response.sendRedirect("welcome.jsp?userid=" + user.getMemberId());
            } else {
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("error.jsp");
        }

               // getServletContext().getRequestDispatcher("error.jsp").include(request,
        //       response);
    }

}
