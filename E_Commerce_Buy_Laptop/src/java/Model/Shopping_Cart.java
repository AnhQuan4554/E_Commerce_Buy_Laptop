/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author welcome
 */
  public class Shopping_Cart {
    private int cartID;
    private int customerID;
    private String createdDate;
    private int updatedDate;

    public Shopping_Cart(int cartID, int customerID, String createdDate, int updatedDate) {
        this.cartID = cartID;
        this.customerID = customerID;
        this.createdDate = createdDate;
        this.updatedDate = updatedDate;
    }

    public Shopping_Cart(int cartID, int customerID) {
        this.cartID = cartID;
        this.customerID = customerID;
    }

    
    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public int getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(int updatedDate) {
        this.updatedDate = updatedDate;
    }

    @Override
    public String toString() {
        return "Shopping_Cart{" + "cartID=" + cartID + ", customerID=" + customerID + ", createdDate=" + createdDate + ", updatedDate=" + updatedDate + '}';
    }
    
    
}
