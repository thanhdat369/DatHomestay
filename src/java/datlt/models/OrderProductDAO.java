/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlt.models;

import datlt.conn.MyConnection;
import datlt.dtos.CartObject;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LEE
 */
public class OrderProductDAO implements Serializable {

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

    public String getLastID() throws Exception {
        String result = "norecord";
        try {
            String sql = "  SELECT TOP 1 orderProductID,timeCreate  FROM tbl_OrderProduct ORDER BY timeCreate DESC";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            if (rs.next()) {
                result = rs.getString("orderProductID");
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean insertOrderProduct(String orderProductID, String username, float total) throws Exception {
        boolean check = false;
        try {
            String sql = " Insert into tbl_OrderProduct(orderProductID,username,total,timeCreate,status) values(?,?,?,GETDATE(),'finished')";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, orderProductID);
            preStm.setString(2, username);
            preStm.setFloat(3, total);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<CartObject> getListHistory(String username) throws Exception {
        List<CartObject> list = null;
        CartObject obj;
        try {
            String sql = "SELECT orderProductID,total,timeCreate FROM tbl_OrderProduct where username =? ORDER BY timeCreate DESC";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            rs = preStm.executeQuery();
            list = new ArrayList<CartObject>();
            while (rs.next()) {
                String orderProductID = rs.getString("orderProductID");
                float total = rs.getFloat("total");
                String timeCreate = rs.getString("timeCreate");
                obj = new CartObject(username, total, orderProductID, timeCreate);
                list.add(obj);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

}
