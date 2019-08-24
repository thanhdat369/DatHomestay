/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlt.controllers.user;

import datlt.dtos.CartObject;
import datlt.dtos.ProductDTO;
import datlt.idprocess.IDCreating;
import datlt.models.OrderProductDAO;
import datlt.models.OrderProductDetailDAO;
import datlt.models.ProductDAO;
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
public class UserCheckOutProductController extends HttpServlet {

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
            CartObject cart = (CartObject) session.getAttribute("CART");
            boolean check = true;
            for (ProductDTO dto : cart.getCartDetail()) {
                String id = dto.getProID();
                int quantityBuy = dto.getQuantityBuy();
                ProductDAO dao = new ProductDAO();
                int quantityRest = dao.getQuantityByID(id);
                if (quantityRest == -1) {
                    check = false;
                    request.setAttribute("ERROR", "The product" + dto.getProName() + " is not available");
                    break;
                }
                if ((quantityRest - quantityBuy) < 0) {
                    check = false;
                    request.setAttribute("ERROR", "The product " + dto.getProName() + " just have " + quantityRest + " product");
                    break;
                }
            }
            if (check) {
                OrderProductDAO dao = new OrderProductDAO();
                String orderProductID = IDCreating.createOrderProductID();
                boolean checkInsertOrderProduct = dao.insertOrderProduct(orderProductID, cart.getCustormerUsername(), cart.getTotal());
                ProductDAO productDao = new ProductDAO();
                boolean checkUpdate = false;
                for (ProductDTO dto : cart.getCartDetail()) {
                    String id = dto.getProID();
                    int quantityBuy = dto.getQuantityBuy();
                    int quantityRest = productDao.getQuantityByID(id);
                    int quantityAfter = quantityRest - quantityBuy;
                    checkUpdate = productDao.updateAfterCheckOutByID(id, quantityAfter);
                    if (checkUpdate == false) {
                        request.setAttribute("ERROR", "ERROR WHEN UPDATE PRODUCT QUANTITY");
                        break;
                    }
                }
                if (checkUpdate && checkInsertOrderProduct) {
                    OrderProductDetailDAO orderDetailDAO = new OrderProductDetailDAO();
                    boolean checkInsertDetail = orderDetailDAO.insertOrderProductDetail(cart.getCartDetail(), orderProductID);
                    if (checkInsertDetail) {
                        request.setAttribute("SUCCESS", "CHECK OUT SUCCESS");
                        session.removeAttribute("CART");
                    } else {
                        request.setAttribute("ERROR", "Can not write into order product detail");
                    }
                }
            }
        } catch (Exception e) {
            log("Error at UserCheckOutProduct Controller " + e.getMessage());
        } finally {
            request.getRequestDispatcher("user/viewCart.jsp").forward(request, response);
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
