/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlt.controllers;

import datlt.dtos.RegistrationDTO;
import datlt.dtos.RegistrationErrorObject;
import datlt.models.RegistrationDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LEE
 */
public class SignUpController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "index.jsp";
    private static final String INVALID = "signUp.jsp";

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
        RegistrationErrorObject errorObj = new RegistrationErrorObject();
        try {
            boolean valid = true;
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            String confirm = request.getParameter("txtConfirm");
            String fullname = request.getParameter("txtFullname");
            String email = request.getParameter("txtEmail");
            String phoneNo = request.getParameter("txtPhoneNo");
            String role = "user";
            if (!confirm.equals(password)) {
                request.setAttribute("ERROR", "Please Turn On JavaScript Or Type Confirm Match With Password");
                valid = false;
            }
            if (valid) {
                RegistrationDTO dto = new RegistrationDTO(username, password, fullname, email, phoneNo, role);
                RegistrationDAO dao = new RegistrationDAO();
                boolean check = dao.signUp(dto);
                System.out.println(check);
                if (check) {
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Can not signUp");
                }
            }
        } catch (Exception e) {
            if (e.getMessage().contains("duplicate")) {
                errorObj.setUsernameError("Username was existed");
                url = INVALID;
                request.setAttribute("INVALID", errorObj);
            } else {
                log("Error at Sign Up " + e.getMessage());
            }
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
