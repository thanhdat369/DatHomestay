/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlt.controllers.user;

import datlt.dtos.ProductDTO;
import datlt.models.ProductDAO;
import datlt.models.RoomOrderDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LEE
 */
public class UserGetAllProductController extends HttpServlet {

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
        try {
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("USER");
            RoomOrderDAO roomOrderDAO = new RoomOrderDAO();
            String roomID = roomOrderDAO.getRoomStayNow(username);
            if (roomID != null) {
                request.setAttribute("ROOMID", roomID);
                ProductDAO dao = new ProductDAO();
                String pageIDStr = request.getParameter("pageID");
                int pageID = 1;
                int pageMax = dao.getMaxPage();
                request.setAttribute("PAGEMAX", pageMax);
                if (pageIDStr != null) {
                    pageID = Integer.parseInt(pageIDStr);
                }
                if (pageID > pageMax) {
                    pageID = pageMax;
                }
                List<ProductDTO> list = dao.getAllProductForUser(pageID);
                request.setAttribute("PAGECURRENT", pageID);
                request.setAttribute("PRODUCT", list);
            }
        } catch (Exception e) {
            log("Error at USer get All PRoduct Controller " + e.getMessage());
        } finally {
            request.getRequestDispatcher("user/product.jsp").forward(request, response);
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
