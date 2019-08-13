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
public class ProductDAO implements Serializable {

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

    public List<ProductDTO> findByLikeName(String search) throws Exception {
        List<ProductDTO> list = null;
        ProductDTO dto = null;
        try {
            String sql = "SELECT proID,proName,proPrice,proDes,proType,proImgLink FROM tbl_Product where proName like ? and isDelete='false'";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + search + "%");
            rs = preStm.executeQuery();
            list = new ArrayList<ProductDTO>();
            while (rs.next()) {
                String proID, proName;
                float proPrice;
                String proDes, proType, proImgLink;
                proID = rs.getString("proID");
                proName = rs.getString("proName");
                proPrice = rs.getFloat("proPrice");
                proDes = rs.getString("proDes");
                proType = rs.getString("proType");
                proImgLink = rs.getString("proImgLink");
                dto = new ProductDTO(proID, proName, proPrice, proDes, proType, proImgLink);
                list.add(dto);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public boolean delete(String id) throws Exception {
        boolean check = false;
        try {
            String sql = "UPDATE tbl_Product set isDelete = 'true' where proID=?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public ProductDTO findByPrimaryKey(String id) throws Exception {
        ProductDTO dto = null;
        try {
            String sql = "SELECT proName,proPrice,proDes,proType,proImgLink FROM tbl_Product where proID=?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            while (rs.next()) {
                String proName;
                float proPrice;
                String proDes, proType, proImgLink;
                proName = rs.getString("proName");
                proPrice = rs.getFloat("proPrice");
                proDes = rs.getString("proDes");
                proType = rs.getString("proType");
                proImgLink = rs.getString("proImgLink");
                dto = new ProductDTO(id, proName, proPrice, proDes, proType, proImgLink);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public boolean update(ProductDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "UPDATE tbl_Product set proName=?,proPrice=?,proDes=?,proType=?,proImgLink=? where proID = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getProName());
            preStm.setFloat(2, dto.getProPrice());
            preStm.setString(3, dto.getProDes());
            preStm.setString(4, dto.getProType());
            preStm.setString(5, dto.getProImgLink());
            preStm.setString(6, dto.getProID());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean insert(ProductDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT INTO tbl_Product(proName,proPrice,proDes,proType,proImgLink,isDelete) values(?,?,?,?,?,'false')";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getProName());
            preStm.setFloat(2, dto.getProPrice());
            preStm.setString(3, dto.getProDes());
            preStm.setString(4, dto.getProType());
            preStm.setString(5, dto.getProImgLink());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
}
