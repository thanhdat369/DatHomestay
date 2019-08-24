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
public class ProductDTO implements Serializable {

    private String proID, proName;
    private float proPrice;
    private String proDes, proType, proImgLink;
    private int proQuantity;
    private int quantityBuy;

    public ProductDTO() {
    }
    
    public ProductDTO(String proName, float proPrice, String proDes, String proType, String proImgLink, int proQuantity) {
        this.proName = proName;
        this.proPrice = proPrice;
        this.proDes = proDes;
        this.proType = proType;
        this.proImgLink = proImgLink;
        this.proQuantity = proQuantity;
    }

    public ProductDTO(String proID, String proName, float proPrice, String proDes, String proType, String proImgLink, int proQuantity) {
        this.proID = proID;
        this.proName = proName;
        this.proPrice = proPrice;
        this.proDes = proDes;
        this.proType = proType;
        this.proImgLink = proImgLink;
        this.proQuantity = proQuantity;
    }

    public int getQuantityBuy() {
        return quantityBuy;
    }

    public void setQuantityBuy(int quantityBuy) {
        this.quantityBuy = quantityBuy;
    }

    public int getProQuantity() {
        return proQuantity;
    }

    public void setProQuantity(int proQuantity) {
        this.proQuantity = proQuantity;
    }

    public String getProID() {
        return proID;
    }

    public void setProID(String proID) {
        this.proID = proID;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public float getProPrice() {
        return proPrice;
    }

    public void setProPrice(float proPrice) {
        this.proPrice = proPrice;
    }

    public String getProDes() {
        return proDes;
    }

    public void setProDes(String proDes) {
        this.proDes = proDes;
    }

    public String getProType() {
        return proType;
    }

    public void setProType(String proType) {
        this.proType = proType;
    }

    public String getProImgLink() {
        return proImgLink;
    }

    public void setProImgLink(String proImgLink) {
        this.proImgLink = proImgLink;
    }

}
