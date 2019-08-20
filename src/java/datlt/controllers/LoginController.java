/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlt.controllers;

import datlt.dtos.RegistrationErrorObject;
import datlt.models.RegistrationDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LEE
 */
public class LoginController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String ADMIN = "admin/admin.jsp";
    private static final String USER = "UserGetAllRoomController";
    private static final String STAFF = "staff/staff.jsp";
    private static final String INVALID = "index.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            RegistrationDAO dao = new RegistrationDAO();
            String role = dao.login(username, password);
            RegistrationErrorObject errorObj = new RegistrationErrorObject();
            if (role.equals("failed")) {
                errorObj.setUsernameError("Invalid username or password");
                request.setAttribute("INVALID", errorObj);
                url = INVALID;
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("USER", username);
                if (role.equals("admin")) {
                    url = ADMIN;
                    session.setAttribute("ROLE", role);
                } else if (role.equals("user")) {
                    url = USER;
                    session.setAttribute("ROLE", role);
                } else if (role.equals("staff")) {
                    url = STAFF;
                    session.setAttribute("ROLE", role);
                } else if (role.equals("banned")) {
                    errorObj.setUsernameError("Your account was banned");
                    request.setAttribute("INVALID", errorObj);
                    url = INVALID;
                } else {
                    request.setAttribute("ERROR", "ROLE IS INVALID");
                }
            }
        } catch (Exception e) {
            log("Error at LoginController" + e.getMessage());

        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

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
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
