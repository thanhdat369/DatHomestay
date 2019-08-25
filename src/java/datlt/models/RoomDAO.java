/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlt.models;

import datlt.conn.MyConnection;
import datlt.dtos.RoomDTO;
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
public class RoomDAO implements Serializable {

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

    public List<RoomDTO> getAllRoomDeleted() throws Exception {
        List<RoomDTO> result = null;
        RoomDTO dto;
        String id, des, imgLink;
        float gia;
        try {
            String sql = "SELECT roomID,roomPrice,roomDes,roomImgLink FROM tbl_Room where isDelete='true'";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<RoomDTO>();
            while (rs.next()) {
                id = rs.getString("roomID");
                gia = rs.getFloat("roomPrice");
                des = rs.getString("roomDes");
                imgLink = rs.getString("roomImgLink");
                dto = new RoomDTO(id, gia, des, imgLink);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<RoomDTO> getAllRoom() throws Exception {
        List<RoomDTO> result = null;
        RoomDTO dto;
        String id, des, imgLink;
        float gia;
        try {
            String sql = "SELECT roomID,roomPrice,roomDes,roomImgLink FROM tbl_Room where isDelete='false'";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<RoomDTO>();
            while (rs.next()) {
                id = rs.getString("roomID");
                gia = rs.getFloat("roomPrice");
                des = rs.getString("roomDes");
                imgLink = rs.getString("roomImgLink");
                dto = new RoomDTO(id, gia, des, imgLink);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<RoomDTO> findByLikeID(String search) throws Exception {
        List<RoomDTO> result = null;
        RoomDTO dto;
        String id, des, imgLink;
        float gia;
        try {
            String sql = "SELECT roomID,roomPrice,roomDes,roomImgLink FROM tbl_Room where isDelete='false' and roomID like ?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + search + "%");
            rs = preStm.executeQuery();
            result = new ArrayList<RoomDTO>();
            while (rs.next()) {
                id = rs.getString("roomID");
                gia = rs.getFloat("roomPrice");
                des = rs.getString("roomDes");
                imgLink = rs.getString("roomImgLink");
                dto = new RoomDTO(id, gia, des, imgLink);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public RoomDTO findByPrimaryKey(String id) throws Exception {
        RoomDTO dto = null;
        String des, imgLink;
        float gia;
        try {
            String sql = "SELECT roomPrice,roomDes,roomImgLink FROM tbl_Room where roomID=?";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, id);
            rs = preStm.executeQuery();
            if (rs.next()) {
                gia = rs.getFloat("roomPrice");
                des = rs.getString("roomDes");
                imgLink = rs.getString("roomImgLink");
                dto = new RoomDTO(id, gia, des, imgLink);
            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public boolean delete(String id) throws Exception {
        boolean check = true;
        try {
            String sql = "UPDATE tbl_Room SET isDelete = 'true' WHERE  roomID = ? ";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareCall(sql);
            preStm.setString(1, id);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean recover(String id) throws Exception {
        boolean check = true;
        try {
            String sql = "UPDATE tbl_Room SET isDelete = 'false' WHERE  roomID = ? ";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareCall(sql);
            preStm.setString(1, id);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean insert(RoomDTO dto) throws Exception {
        boolean check = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "INSERT INTO tbl_Room(roomID,roomPrice,roomDes,roomImgLink,isDelete) values(?,?,?,?,'false')";
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getRoomID());
            preStm.setFloat(2, dto.getRoomPrice());
            preStm.setString(3, dto.getRoomDes());
            preStm.setString(4, dto.getRoomImgLink());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean update(RoomDTO dto) throws Exception {

        boolean check = false;
        try {
            conn = MyConnection.getMyConnection();
            String sql = "UPDATE tbl_Room SET roomPrice=?,roomDes=?,roomImgLink=? where roomID=?";
            preStm = conn.prepareStatement(sql);
            preStm.setFloat(1, dto.getRoomPrice());
            preStm.setString(2, dto.getRoomDes());
            preStm.setString(3, dto.getRoomImgLink());
            preStm.setString(4, dto.getRoomID());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;

    }

    public List<RoomDTO> getAvailableRoom(String checkinDay, String checkoutDay) throws Exception {
        List<RoomDTO> result = null;
        RoomDTO dto;
        String id, des, imgLink;
        float price;
        try {
            String sql = "SELECT roomID,roomPrice,roomDes,roomImgLink FROM tbl_Room where isDelete='false' AND roomID NOT IN "
                    + "(SELECT roomID FROM tbl_OrderRoom where (( ? BETWEEN checkinDay AND checkoutDay) OR "
                    + "( ? BETWEEN checkinDay AND checkoutDay) OR (checkinDay BETWEEN ? AND ? ))AND status <> 'finished')";
            conn = MyConnection.getMyConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, checkinDay);
            preStm.setString(2, checkoutDay);
            preStm.setString(3, checkinDay);
            preStm.setString(4, checkoutDay);
            rs = preStm.executeQuery();
            result = new ArrayList<RoomDTO>();
            while (rs.next()) {
                id = rs.getString("roomID");
                price = rs.getFloat("roomPrice");
                des = rs.getString("roomDes");
                imgLink = rs.getString("roomImgLink");
                dto = new RoomDTO(id, price, des, imgLink);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

}
