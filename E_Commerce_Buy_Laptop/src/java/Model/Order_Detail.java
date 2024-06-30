/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author welcome
 */
public class Order_Detail {
    private int orderID;
    private int productID;
    private int quantity;
    private Double priceEach;
    private Double subTotal;

    public Order_Detail(int orderID, int productID, int quantity, Double priceEach, Double subTotal) {
        this.orderID = orderID;
        this.productID = productID;
        this.quantity = quantity;
        this.priceEach = priceEach;
        this.subTotal = subTotal;
    }

    public Order_Detail() {
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Double getPriceEach() {
        return priceEach;
    }

    public void setPriceEach(Double priceEach) {
        this.priceEach = priceEach;
    }

    public Double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(Double subTotal) {
        this.subTotal = subTotal;
    }

    @Override
    public String toString() {
        return "Order_Detail{" + "orderID=" + orderID + ", productID=" + productID + ", quantity=" + quantity + ", priceEach=" + priceEach + ", subTotal=" + subTotal + '}';
    }
    
    
    
}
