/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlt.controllers.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LEE
 */
public class AdminRoomMainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SEARCH = "AdminSearchRoomController";
    private static final String DELETE = "AdminDeleteRoomController";
    private static final String EDIT = "AdminEditRoomController";
    private static final String UPDATE = "AdminUpdateRoomController";
    private static final String ADD = "AdminAddRoomController";
    private static final String RECOVER = "AdminRecoverRoomController";

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
            String action = request.getParameter("action");
            if (action.equals("Search")) {
                url = SEARCH;
            } else if (action.equals("Delete")) {
                url = DELETE;
            } else if (action.equals("Edit")) {
                url = EDIT;
            } else if (action.equals("Update")) {
                url = UPDATE;
            } else if (action.equals("Add")) {
                url = ADD;
            } else if (action.equals("Recover")) {
                url = RECOVER;
            } else {
                request.setAttribute("ERROR", "Action is not valid");
            }
        } catch (Exception e) {
            log("Error at Admin Room MainController " + e.getMessage());
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
