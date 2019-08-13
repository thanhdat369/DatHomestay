/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlt.dtos;

import java.io.Serializable;

/**
 *
 * @author LEE
 */
public class RoomDTO implements Serializable{
    private String roomID;
    private float roomPrice;
    private String roomDes,roomImgLink;

    public RoomDTO(String roomID, float roomPrice, String roomDes, String roomImgLink) {
        this.roomID = roomID;
        this.roomPrice = roomPrice;
        this.roomDes = roomDes;
        this.roomImgLink = roomImgLink;
    }

    public String getRoomID() {
        return roomID;
    }

    public void setRoomID(String roomID) {
        this.roomID = roomID;
    }

    public float getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(float roomPrice) {
        this.roomPrice = roomPrice;
    }

    public String getRoomDes() {
        return roomDes;
    }

    public void setRoomDes(String roomDes) {
        this.roomDes = roomDes;
    }

    public String getRoomImgLink() {
        return roomImgLink;
    }

    public void setRoomImgLink(String roomImgLink) {
        this.roomImgLink = roomImgLink;
    }
    
}
