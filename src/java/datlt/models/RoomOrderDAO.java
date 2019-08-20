/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlt.models;

import datlt.conn.MyConnection;
import datlt.dtos.RoomOrderObject;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author LEE
 */
public class RoomOrderDAO implements Serializable {

    private Connection conn = null;
    private PreparedStatement preStm = null;
    private ResultSet rs = null;

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (preStm != null) {
            preStm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public boolean isBooked(String checkinDay, String checkoutDay, String roomID) throws Exception {
        boolean check = false;
        try {
            String sql = "SELECT orderRoomID FROM tbl_OrderRoom where (( ? BETWEEN checkinDay AND checkoutDay) OR ( ? BETWEEN checkinDay AND checkoutDay) OR (checkinDay BETWEEN ? AND ? ))AND roomID=? and status <> 'finished'";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, checkinDay);
            preStm.setString(2, checkoutDay);
            preStm.setString(3, checkinDay);
            preStm.setString(4, checkoutDay);
            preStm.setString(5, roomID);
            rs = preStm.executeQuery();
            if (rs.next()) {
                check = true;
            }
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean bookRoom(RoomOrderObject roomOder) throws Exception {
        boolean check = false;
        try {
            String sql = "   INSERT INTO tbl_OrderRoom(orderRoomID,roomID,roomPrice,customerUsername,checkinDay,checkoutDay,status,total,createTime) values(?,?,?,?,?,?,'booked',?,GETDATE())";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, roomOder.getOrderRoomID());
            preStm.setString(2, roomOder.getRoomID());
            preStm.setFloat(3, roomOder.getRoomPrice());
            preStm.setString(4, roomOder.getCustomerUsername());
            preStm.setString(5, roomOder.getCheckinDay());
            preStm.setString(6, roomOder.getCheckoutDay());
            preStm.setFloat(7, roomOder.getTotal());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public String getLastID() throws Exception {
        String result = "norecord";
        try {
            String sql = "SELECT TOP 1 orderRoomID,createTime  FROM tbl_OrderRoom ORDER BY createTime DESC";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            if (rs.next()) {
                result = rs.getString("orderRoomID");
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<RoomOrderObject> getAllBillBookedForStaff() throws Exception {
        List<RoomOrderObject> result = null;
        RoomOrderObject dto;
        try {
            String sql = "SELECT orderRoomID,roomID,checkinDay,checkoutDay,total,createTime,customerUsername FROM tbl_OrderRoom where status='booked' ORDER BY createTime DESC";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<RoomOrderObject>();
            while (rs.next()) {
                String orderRoomID, roomID, checkinDay, checkoutDay, customerUsername;
                float total;
                orderRoomID = rs.getString("orderRoomID");
                roomID = rs.getString("roomID");
                checkinDay = rs.getString("checkinDay");
                checkoutDay = rs.getString("checkoutDay");
                total = rs.getFloat("total");
                customerUsername = rs.getString("customerUsername");
                dto = new RoomOrderObject(orderRoomID, roomID, total, checkinDay, checkoutDay, customerUsername, total);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean checkoutRoom(String staffname, String orderRoomID) throws Exception {
        boolean check = false;
        try {
            String sql = "UPDATE tbl_OrderRoom set finishedDay=GETDATE(),status='finished',staffUsername=? where status<>'finished' and orderRoomID=?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, staffname);
            preStm.setString(2, orderRoomID);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public String getRoomStayNow(String username) throws Exception {
        String roomID = null;
        try {
            SimpleDateFormat formarter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            String dayStr = formarter.format(date);
            String sql = " Select orderRoomID,roomID From tbl_OrderRoom where ? BETWEEN checkinDay AND checkoutDay and status<>'finished' and customerUsername=?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dayStr);
            preStm.setString(2, username);
            rs = preStm.executeQuery();
            if (rs.next()) {
                roomID = rs.getString("roomID");
            }
        } finally {
            closeConnection();
        }
        return roomID;
    }
}
