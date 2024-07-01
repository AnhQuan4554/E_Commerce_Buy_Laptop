/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author welcome
 */
public class Order_Response  extends Order_Detail{
     private String productName;

    public Order_Response(int orderID, int productID, int quantity, Double priceEach, Double subTotal,String productName) {
        super(orderID, productID, quantity, priceEach, subTotal);
         this.productName = productName;
    }

    public Order_Response() {
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    @Override
    public String toString() {
        return super.toString() + ", productName='" + productName + '\'' + '}';
    }
     
    
}
