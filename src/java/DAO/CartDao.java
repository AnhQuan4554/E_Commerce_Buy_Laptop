/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.*;
import Model.*;
import java.sql.*;
import java.util.*;

/**
 *
 * @author welcome
 */
public class CartDao extends DbCon {

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public CartDao() {
        super();
    }

    public boolean addCart(Cart cart) {
        boolean success = false;
        
        try {
            String selectQuery = "SELECT * FROM carts WHERE email = ? AND name = ?";
            PreparedStatement selectPst = con.prepareStatement(selectQuery);
            selectPst.setString(1, cart.getEmail());
            selectPst.setString(2, cart.getName());
            ResultSet rsSelect = selectPst.executeQuery();
           
            if (rsSelect.next()) {
               
                // Nếu sản phẩm đã tồn tại trong giỏ hàng của người dùng, thực hiện cập nhật số lượng
                int existingQuantity = rsSelect.getInt("quantity");
                int newQuantity = existingQuantity + 1; // Tăng số lượng sản phẩm lên 1
                String updateQuery = "UPDATE carts SET quantity = ? WHERE email = ? AND name = ?";
                PreparedStatement updatePst = con.prepareStatement(updateQuery);
                updatePst.setInt(1, newQuantity);
                updatePst.setString(2, cart.getEmail());
                updatePst.setString(3, cart.getName());
                int rowsAffected = updatePst.executeUpdate();

                if (rowsAffected > 0) {
                    System.out.println("Quantity updated successfully for: " + cart.getName());
                    success = true;
                }
            } 
            else {
                String query = "INSERT INTO carts (p_id,name,category,price, image, quantity, email) VALUES (?,?,?, ?, ?,?,?)";
                PreparedStatement pst = con.prepareStatement(query);
//                System.out.println("id when add++"+cart.getP_id());
                pst.setInt(1, cart.getP_id());
                pst.setString(2, cart.getName());
                pst.setString(3, cart.getCategory());
                pst.setDouble(4, cart.getPrice());
                pst.setString(5, cart.getImage());
                pst.setInt(6, cart.getQuantity());
                pst.setString(7, cart.getEmail());

                int rowsAffected = pst.executeUpdate();

                if (rowsAffected > 0) {
                    System.out.println("Cart added successfully: " + cart.getName());
                    success = true;
                }
            }
            ////

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return success;
    }
     public List<Cart> getAllCarts(String email) {
        List<Cart> cartList = new ArrayList<>();
        try {
               String query = "SELECT * FROM carts WHERE email = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart();
                cart.setId(rs.getInt("id"));
                cart.setP_id(rs.getInt("p_id"));
                cart.setName(rs.getString("name"));
                cart.setCategory(rs.getString("category"));
                cart.setPrice(rs.getDouble("price"));
                cart.setImage(rs.getString("image"));
                cart.setQuantity(rs.getInt("quantity"));
                cartList.add(cart);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
         System.out.println("cart list+++"+cartList);
        return cartList;
    }
}
