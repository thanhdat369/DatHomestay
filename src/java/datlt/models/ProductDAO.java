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

    private static final int PRODUCT_PER_PAGE = 3;
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
            String sql = "SELECT proID,proName,proPrice,proDes,proType,proImgLink,proQuantity FROM tbl_Product where proName like ? and isDelete='false'";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + search + "%");
            rs = preStm.executeQuery();
            list = new ArrayList<ProductDTO>();
            while (rs.next()) {
                String proID, proName;
                float proPrice;
                int proQuantity;
                String proDes, proType, proImgLink;
                proID = rs.getString("proID");
                proName = rs.getString("proName");
                proPrice = rs.getFloat("proPrice");
                proDes = rs.getString("proDes");
                proType = rs.getString("proType");
                proImgLink = rs.getString("proImgLink");
                proQuantity = rs.getInt("proQuantity");
                dto = new ProductDTO(proID, proName, proPrice, proDes, proType, proImgLink, proQuantity);
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
            String sql = "SELECT proName,proPrice,proDes,proType,proImgLink,proQuantity FROM tbl_Product where proID=?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            while (rs.next()) {
                String proName;
                float proPrice;
                String proDes, proType, proImgLink;
                int proQuantity;
                proName = rs.getString("proName");
                proPrice = rs.getFloat("proPrice");
                proDes = rs.getString("proDes");
                proType = rs.getString("proType");
                proImgLink = rs.getString("proImgLink");
                proQuantity = rs.getInt("proQuantity");
                dto = new ProductDTO(id, proName, proPrice, proDes, proType, proImgLink, proQuantity);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public boolean update(ProductDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "UPDATE tbl_Product set proName=?,proPrice=?,proDes=?,proType=?,proImgLink=?,proQuantity=? where proID = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getProName());
            preStm.setFloat(2, dto.getProPrice());
            preStm.setString(3, dto.getProDes());
            preStm.setString(4, dto.getProType());
            preStm.setString(5, dto.getProImgLink());
            preStm.setInt(6, dto.getProQuantity());
            preStm.setString(7, dto.getProID());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean insert(ProductDTO dto) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT INTO tbl_Product(proName,proPrice,proDes,proType,proImgLink,proQuantity,isDelete) values(?,?,?,?,?,?,'false')";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getProName());
            preStm.setFloat(2, dto.getProPrice());
            preStm.setString(3, dto.getProDes());
            preStm.setString(4, dto.getProType());
            preStm.setString(5, dto.getProImgLink());
            preStm.setInt(6, dto.getProQuantity());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<ProductDTO> getAllProductForUser(int pageID) throws Exception {
        List<ProductDTO> list = null;
        ProductDTO dto = null;
        try {
            int begin = (pageID - 1) * PRODUCT_PER_PAGE + 1;
            int end = begin + PRODUCT_PER_PAGE;
            String sql = "SELECT proID,proName,proPrice,proDes,proType,proImgLink,proQuantity,rowNum FROM "
                    + "(SELECT proID,proName,proPrice,proDes,proType,proImgLink,proQuantity, ROW_NUMBER() OVER(ORDER BY proID) as rowNum "
                    + "FROM tbl_Product where isDelete='false' and proQuantity>0 )AS tbl_COUNT where rowNum>=? and rowNum<? ";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, begin);
            preStm.setInt(2, end);
            rs = preStm.executeQuery();
            list = new ArrayList<ProductDTO>();
            while (rs.next()) {
                String proID, proName;
                float proPrice;
                int proQuantity;
                String proDes, proType, proImgLink;
                proID = rs.getString("proID");
                proName = rs.getString("proName");
                proPrice = rs.getFloat("proPrice");
                proDes = rs.getString("proDes");
                proType = rs.getString("proType");
                proImgLink = rs.getString("proImgLink");
                proQuantity = rs.getInt("proQuantity");
                dto = new ProductDTO(proID, proName, proPrice, proDes, proType, proImgLink, proQuantity);
                list.add(dto);
            }
        } finally {
            closeConnection();
        }
        return list;
    }

    public int getMaxPage() throws Exception {
        int result = 0;
        int rowCount = 0;
        try {
            String sql = "SELECT count(proID) AS countRow FROM tbl_Product where isDelete='false' and proQuantity>0;";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            if (rs.next()) {
                rowCount = rs.getInt("countRow");
            }
            result = (int) Math.ceil((double) rowCount / PRODUCT_PER_PAGE);
        } finally {
            closeConnection();
        }
        return result;
    }

    public int getQuantityByID(String id) throws Exception {
        int result = -1;
        try {
            String sql = " Select proQuantity from tbl_Product where proID = ? and isDelete = 0";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                result = rs.getInt("proQuantity");
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean updateAfterCheckOutByID(String id, int quantityAfter) throws Exception {
        boolean check = false;
        try {
            String sql = "UPDATE tbl_Product set proQuantity = ? where proID =?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, quantityAfter);
            preStm.setString(2, id);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public String getNameByID(String id) throws Exception {
        String name = null;
        try {
            String sql = "SELECT proName FROM tbl_Product where proID = ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            while (rs.next()) {
                name = rs.getString("proName");
            }
        } finally {
            closeConnection();
        }
        return name;
    }
}
