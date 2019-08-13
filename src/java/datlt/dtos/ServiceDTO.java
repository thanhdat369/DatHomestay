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
public class ServiceDTO implements Serializable {

    private String serviceID, serviceName;
    private float servicePrice;
    private String serviceDes;

    public ServiceDTO(String serviceName, float servicePrice, String serviceDes) {
        this.serviceName = serviceName;
        this.servicePrice = servicePrice;
        this.serviceDes = serviceDes;
    }
    
    public ServiceDTO(String serviceID, String serviceName, float servicePrice, String serviceDes) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.servicePrice = servicePrice;
        this.serviceDes = serviceDes;
    }

    public String getServiceID() {
        return serviceID;
    }

    public void setServiceID(String serviceID) {
        this.serviceID = serviceID;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public float getServicePrice() {
        return servicePrice;
    }

    public void setServicePrice(float servicePrice) {
        this.servicePrice = servicePrice;
    }

    public String getServiceDes() {
        return serviceDes;
    }

    public void setServiceDes(String serviceDes) {
        this.serviceDes = serviceDes;
    }

}
