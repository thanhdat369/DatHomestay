/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlt.models;

import datlt.conn.MyConnection;
import datlt.dtos.RegistrationDTO;
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
public class RegistrationDAO implements Serializable {

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

    public String login(String username, String password) throws Exception {
        String role = "failed";
        try {
            String sql = "select role from tbl_Registration where username=? and password=? ";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, username);
            preStm.setString(2, password);
            rs = preStm.executeQuery();
            if (rs.next()) {
                role = rs.getString("role");
            }
        } finally {
            closeConnection();
        }
        return role;
    }

    public boolean signUp(RegistrationDTO dto) throws Exception {
        boolean check = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "INSERT INTO tbl_Registration(username,password,fullname,email,phoneNo,role) values(?,?,?,?,?,?)";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getUsername());
            preStm.setString(2, dto.getPassword());
            preStm.setString(3, dto.getFullname());
            preStm.setString(4, dto.getEmail());
            preStm.setString(5, dto.getPhoneNo());
            preStm.setString(6, dto.getRole());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<RegistrationDTO> findByLikeName(String search, String adminName) throws Exception {
        List<RegistrationDTO> result = null;
        RegistrationDTO dto = null;
        String username, fullname, role, email, phoneNo;
        try {
            String sql = "select Username,FullName,email,phoneNo,role from tbl_Registration where FullName like ? and role <> 'banned' and username<>?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + search + "%");
            preStm.setString(2, adminName);
            result = new ArrayList<RegistrationDTO>();
            rs = preStm.executeQuery();

            while (rs.next()) {
                username = rs.getString("Username");
                fullname = rs.getString("FullName");
                role = rs.getString("role");
                email = rs.getString("email");
                phoneNo = rs.getString("phoneNo");
                dto = new RegistrationDTO(username, fullname, email, phoneNo, role);
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
            String sql = "UPDATE tbl_Registration SET Role = 'banned' WHERE Username = ? ";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareCall(sql);
            preStm.setString(1, id);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public RegistrationDTO findByPrimaryKey(String id) throws Exception {
        RegistrationDTO dto = null;
        String fullname, role, email, phoneNo;
        try {
            String sql = "select Username,FullName,email,phoneNo,role from tbl_Registration where username=?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            while (rs.next()) {
                fullname = rs.getString("FullName");
                role = rs.getString("role");
                email = rs.getString("email");
                phoneNo = rs.getString("phoneNo");
                dto = new RegistrationDTO(id, fullname, email, phoneNo, role);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public boolean update(RegistrationDTO dto) throws Exception {

        boolean check = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "UPDATE tbl_Registration SET fullname=?,email=?,phoneNo=?,role=? WHERE username=?";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getFullname());
            preStm.setString(2, dto.getEmail());
            preStm.setString(3, dto.getPhoneNo());
            preStm.setString(4, dto.getRole());
            preStm.setString(5, dto.getUsername());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;

    }
}
