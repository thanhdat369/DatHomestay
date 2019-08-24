/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlt.models;

import datlt.conn.MyConnection;
import datlt.dtos.ProductDTO;
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
public class OrderProductDetailDAO implements Serializable {

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

    public boolean insertOrderProductDetail(List<ProductDTO> list, String orderProductID) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT INTO tbl_OrderProductDetail(orderProductID,proID,proPrice,quantity) values (?,?,?,?)";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            for (ProductDTO dto : list) {
                preStm.setString(1, orderProductID);
                preStm.setString(2, dto.getProID());
                preStm.setFloat(3, dto.getProPrice());
                preStm.setInt(4, dto.getQuantityBuy());
                check = preStm.executeUpdate() > 0;
                if (check == false) {
                    break;
                }
            }
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<ProductDTO> getListByOrderID(String orderProductID) throws Exception {
        List<ProductDTO> list = null;
        ProductDTO dto;
        ProductDAO dao = new ProductDAO();
        try {
            String sql = "SELECT proID,proPrice,quantity FROM tbl_OrderProductDetail where orderProductID = ? ";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, orderProductID);
            rs = preStm.executeQuery();
            list = new ArrayList<ProductDTO>();
            while (rs.next()) {
                String proID = rs.getString("proID");
                float proPrice = rs.getFloat("proPrice");
                String proName = dao.getNameByID(proID);
                int quantity = rs.getInt("quantity");
                dto = new ProductDTO();
                dto.setProID(proID);
                dto.setProName(proName);
                dto.setProPrice(proPrice);
                dto.setQuantityBuy(quantity);
                list.add(dto);
            }
        } finally {
            closeConnection();
        }
        return list;
    }
}
