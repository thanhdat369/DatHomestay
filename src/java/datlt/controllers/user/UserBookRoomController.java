/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlt.controllers.user;

import datlt.dtos.RoomOrderObject;
import datlt.idprocess.IDCreating;
import datlt.models.RoomOrderDAO;
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
public class UserBookRoomController extends HttpServlet {

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
            String checkinDay = request.getParameter("txtCheckinDay");
            String checkoutDay = request.getParameter("txtCheckoutDay");
            String id = request.getParameter("txtRoomID");
            RoomOrderDAO dao = new RoomOrderDAO();
            if (!(checkinDay == null || checkoutDay == null || id == null)) {
                boolean checkBooked = !dao.isBooked(checkinDay, checkoutDay, id);
                if (checkBooked) {
                    HttpSession session = request.getSession();
                    String username = (String) session.getAttribute("USER");
                    String roomPriceStr = request.getParameter("txtRoomPrice");
                    float roomPrice = Float.parseFloat(roomPriceStr);
                    String totalStr = request.getParameter("txtTotal");
                    float total = Float.parseFloat(totalStr);
                    String roomOrderID = IDCreating.createRoomOrderID();
                    RoomOrderObject roomOrderOject = new RoomOrderObject(roomOrderID, id, roomPrice, checkinDay, checkoutDay, username, total);
                    boolean check = dao.bookRoom(roomOrderOject);
                    if (check) {
                        request.setAttribute("SUCCESS", "BOOKED SUCCESS");
                    } else {
                        request.setAttribute("ERROR", "ERROR WHEN BOOKING ROOM. TRY AGAIN");
                    }
                } else {
                    request.setAttribute("ERROR", "ROOM WAS BOOKED ON THAT DAYS. YOU CAN CHOOSE ANOTHER DAY OR CHOOSE ANOTHER ROOM");
                }
            } else {
                request.setAttribute("ERROR", "INVALID PARAMETER");
            }
        } catch (Exception e) {
            log("ERROR AT BOOK ROOM " + e.getMessage());
        } finally {
            request.getRequestDispatcher("user/message.jsp").forward(request, response);
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
