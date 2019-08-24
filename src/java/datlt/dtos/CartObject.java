/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datlt.dtos;

import datlt.models.ProductDAO;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author LEE
 */
public class CartObject implements Serializable {

    private String custormerUsername;
    private HashMap<String, Integer> cart;
    private float total;
    private String orderProductID;
    private String timeCheckOut;

    public CartObject(String custormerUsername) {
        this.custormerUsername = custormerUsername;
        cart = new HashMap<String, Integer>();
    }

    public CartObject(String custormerUsername, float total, String orderProductID, String timeCheckOut) {
        this.custormerUsername = custormerUsername;
        this.total = total;
        this.orderProductID = orderProductID;
        this.timeCheckOut = timeCheckOut;
    }

    public String getTimeCheckOut() {
        return timeCheckOut;
    }

    public void setTimeCheckOut(String timeCheckOut) {
        this.timeCheckOut = timeCheckOut;
    }

    public String getOrderProductID() {
        return orderProductID;
    }

    public void setOrderProductID(String orderProductID) {
        this.orderProductID = orderProductID;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getCustormerUsername() {
        return custormerUsername;
    }

    public void setCustormerUsername(String custormerUsername) {
        this.custormerUsername = custormerUsername;
    }

    public HashMap<String, Integer> getCart() {
        return cart;
    }

    public List<ProductDTO> getCartDetail() throws Exception {
        this.total = 0;
        List<ProductDTO> result = new ArrayList<ProductDTO>();
        ProductDAO dao = new ProductDAO();
        for (String key : this.cart.keySet()) {
            ProductDTO dto = dao.findByPrimaryKey(key);
            dto.setQuantityBuy(this.cart.get(key));
            result.add(dto);
            this.total += dto.getQuantityBuy() * dto.getProPrice();
        }
        return result;
    }

    public void addToCart(String id, int quantityAdd) throws Exception {
        int quantityCart = quantityAdd;
        if (this.cart.containsKey(id)) {
            quantityCart = this.cart.get(id) + quantityCart;
        }
        this.cart.put(id, quantityCart);
    }

    public void remove(String id) throws Exception {
        if (this.cart.containsKey(id)) {
            this.cart.remove(id);
        }
    }

    public void update(String id, int quantity) throws Exception {
        if (this.cart.containsKey(id)) {
            this.cart.put(id, quantity);
        }
    }
}
