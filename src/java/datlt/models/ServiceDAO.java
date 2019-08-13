/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlt.models;

import datlt.conn.MyConnection;
import datlt.dtos.ServiceDTO;
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
public class ServiceDAO implements Serializable {

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

    public List<ServiceDTO> getAllService() throws Exception {
        List<ServiceDTO> result = null;
        ServiceDTO dto = null;
        String id = null, name = null, des = null;
        float gia = 0;
        try {
            String sql = "SELECT serviceID,serviceName,servicePrice,serviceDes FROM tbl_Service WHERE isDelete='false'";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<ServiceDTO>();
            while (rs.next()) {
                id = rs.getString("serviceID");
                name = rs.getString("serviceName");
                gia = rs.getFloat("servicePrice");
                des = rs.getString("serviceDes");
                dto = new ServiceDTO(id, name, gia, des);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<ServiceDTO> findByLikeName(String search) throws Exception {
        List<ServiceDTO> result = null;
        ServiceDTO dto = null;
        String id = null, name = null, des = null;
        float gia = 0;
        try {
            String sql = "SELECT serviceID,serviceName,servicePrice,serviceDes FROM tbl_Service WHERE isDelete='false' and serviceName like ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + search + "%");
            rs = preStm.executeQuery();
            result = new ArrayList<ServiceDTO>();
            while (rs.next()) {
                id = rs.getString("serviceID");
                name = rs.getString("serviceName");
                gia = rs.getFloat("servicePrice");
                des = rs.getString("serviceDes");
                dto = new ServiceDTO(id, name, gia, des);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean delete(String id) throws Exception {
        boolean check = true;
        try {
            String sql = "UPDATE tbl_Service SET isDelete = 'true' WHERE serviceID = ? ";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareCall(sql);
            preStm.setString(1, id);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean insert(ServiceDTO dto) throws Exception {
        boolean check = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "INSERT INTO tbl_Service(serviceName,servicePrice,serviceDes,isDelete) values (?,?,?,'false');";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getServiceName());
            preStm.setFloat(2, dto.getServicePrice());
            preStm.setString(3, dto.getServiceDes());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public ServiceDTO findByPrimaryKey(String id) throws Exception {
        ServiceDTO dto = null;
        String name, des;
        float gia;
        try {
            String sql = "SELECT serviceID,serviceName,servicePrice,serviceDes FROM tbl_Service where serviceID=?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            while (rs.next()) {
                id = rs.getString("serviceID");
                name = rs.getString("serviceName");
                gia = rs.getFloat("servicePrice");
                des = rs.getString("serviceDes");
                dto = new ServiceDTO(id, name, gia, des);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public boolean update(ServiceDTO dto) throws Exception {

        boolean check = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "UPDATE tbl_Service set serviceName=?,servicePrice=?,serviceDes=? where serviceID=?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getServiceName());
            preStm.setFloat(2, dto.getServicePrice());
            preStm.setString(3, dto.getServiceDes());
            preStm.setString(4, dto.getServiceID());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;

    }

}
