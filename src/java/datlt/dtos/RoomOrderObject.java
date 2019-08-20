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
public class RoomOrderObject implements Serializable {

    private String orderRoomID;
    private String roomID;
    private float roomPrice;
    private String checkinDay, checkoutDay;
    private String customerUsername, finishDay;
    private String status, staffUsername;
    private float total;

    public RoomOrderObject(String orderRoomID, String roomID, float roomPrice, String checkinDay, String checkoutDay, String customerUsername, float total) {
        this.orderRoomID = orderRoomID;
        this.roomID = roomID;
        this.roomPrice = roomPrice;
        this.checkinDay = checkinDay;
        this.checkoutDay = checkoutDay;
        this.customerUsername = customerUsername;
        this.total = total;
    }

    public String getOrderRoomID() {
        return orderRoomID;
    }

    public void setOrderRoomID(String orderRoomID) {
        this.orderRoomID = orderRoomID;
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

    public String getCheckinDay() {
        return checkinDay;
    }

    public void setCheckinDay(String checkinDay) {
        this.checkinDay = checkinDay;
    }

    public String getCheckoutDay() {
        return checkoutDay;
    }

    public void setCheckoutDay(String checkoutDay) {
        this.checkoutDay = checkoutDay;
    }

    public String getCustomerUsername() {
        return customerUsername;
    }

    public void setCustomerUsername(String customerUsername) {
        this.customerUsername = customerUsername;
    }

    public String getFinishDay() {
        return finishDay;
    }

    public void setFinishDay(String finishDay) {
        this.finishDay = finishDay;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStaffUsername() {
        return staffUsername;
    }

    public void setStaffUsername(String staffUsername) {
        this.staffUsername = staffUsername;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

}
