/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlt.controllers.admin;

import datlt.dtos.ProductDTO;
import datlt.models.ProductDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LEE
 */
public class AdminUpdateProductController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "AdminSearchProductController";

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
            String proID = request.getParameter("txtProID");
            String proName = request.getParameter("txtProName");
            String proPriceStr = request.getParameter("txtProPrice");
            float price = Float.parseFloat(proPriceStr);
            String proDes = request.getParameter("txtProDes");
            String proType = request.getParameter("cmbProType");
            String proImgLink = request.getParameter("txtProImgLink");
            String proQuantityStr = request.getParameter("txtProQuantity");
            int proQuantity = Integer.parseInt(proQuantityStr);
            ProductDTO dto = new ProductDTO(proID, proName, price, proDes, proType, proImgLink, proQuantity);
            ProductDAO dao = new ProductDAO();
            boolean check = dao.update(dto);
            if (check) {
                url = SUCCESS;
            } else {
                request.setAttribute("ERROR", "Can not Update");
            }
        } catch (Exception e) {
            log("Error at admin Update product " + e.getMessage());
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
