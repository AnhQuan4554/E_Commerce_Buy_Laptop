/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.*;
import java.sql.*;
import java.text.SimpleDateFormat;
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

    public List<Cart_Item> getAllCarts(int userID) {
        System.out.println("getAllCarts+++" + userID);
        List<Cart_Item> cartItemList = new ArrayList<>();
        try {
            String query = "SELECT * FROM shoppingcart WHERE customerID = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, userID);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                int cartID = rs.getInt("cartID");
                String itemQuery = "SELECT * FROM cartitem WHERE cartID = ?";
                PreparedStatement itemPst = con.prepareStatement(itemQuery);
                itemPst.setInt(1, cartID);
                ResultSet itemRs = itemPst.executeQuery();

                while (itemRs.next()) {
                    Cart_Item cart_Item = new Cart_Item();
                    cart_Item.setCartID(itemRs.getInt("cartID"));
                    cart_Item.setProductID(itemRs.getInt("productID"));
                    cart_Item.setProductName(itemRs.getString("productName"));
                    cart_Item.setQuantity(itemRs.getInt("quantity"));
                    cart_Item.setPrice(itemRs.getDouble("price"));
                    cartItemList.add(cart_Item);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        System.out.println("cart list+++" + cartItemList);
        return cartItemList;
    }

    public boolean deleteCartById(int id) {
        boolean rowDeleted = false;
        try {
            String query = "DELETE FROM cartitem WHERE cartID = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, id);
            rowDeleted = pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return rowDeleted;
    }


    public int findCartByNameAndCategory(String name, String category) {
        int cartId = -1;
        try {
            String query = "SELECT id FROM carts WHERE name = ? AND category = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, name);
            pst.setString(2, category);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                cartId = rs.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return cartId;
    }
// find cart item by productID and create_at (date only)
public Cart_Item findCartItemByDate(int productID) {
  
     Timestamp currentTime = new Timestamp(System.currentTimeMillis());
          SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
           String currentDateFormat = dateFormat.format(currentTime);

    String query = "SELECT * FROM cartitem WHERE productID = ? AND DATE(create_at) = ?";
    Cart_Item cart_Item = null;

    try (PreparedStatement pst = con.prepareStatement(query)) {
        pst.setInt(1, productID);
        pst.setString(2, currentDateFormat); // set the date as string in format 'yyyy-MM-dd'
        try (ResultSet rs = pst.executeQuery()) {
            if (rs.next()) {
                cart_Item = new Cart_Item();
                cart_Item.setCartID(rs.getInt("cartID"));
                cart_Item.setProductID(rs.getInt("productID"));
                cart_Item.setProductName(rs.getString("productName"));
                cart_Item.setQuantity(rs.getInt("quantity"));
                cart_Item.setPrice(rs.getDouble("price"));
                cart_Item.setCreate_at(rs.getString("create_at"));
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return cart_Item;
}
    // create cart item
    public Cart_Item createCartItem(Cart_Item cart_Item) {
          Timestamp currentTime = new Timestamp(System.currentTimeMillis());
          SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
           String currentDateFormat = dateFormat.format(currentTime);
        String query = "INSERT INTO cartitem (productID, productName, quantity, price,create_at) VALUES (?, ?, ?, ?,?)";
        try (
               
                PreparedStatement pst = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS)) {
            pst.setInt(1, cart_Item.getProductID());
            pst.setString(2, cart_Item.getProductName());
            pst.setInt(3, cart_Item.getQuantity());
            pst.setDouble(4, cart_Item.getPrice());
            pst.setString(5, currentDateFormat);  
            int affectedRows = pst.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating cart item failed, no rows affected.");
            }

            try (ResultSet generatedKeys = pst.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    cart_Item.setCartID(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating cart item failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cart_Item;
    }
public void updateCartItem(Cart_Item cart_Item) {
    // Chuyển đổi thời gian hiện tại thành chuỗi định dạng "yyyy-MM-dd"
    Timestamp currentTime = new Timestamp(System.currentTimeMillis());
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    String currentDateFormat = dateFormat.format(currentTime);

    // Truy vấn cập nhật cartitem
    String query = "UPDATE cartitem SET productID = ?, productName = ?, quantity = ?, price = ?, create_at = ? WHERE cartID = ?";
    try (PreparedStatement pst = con.prepareStatement(query)) {
        pst.setInt(1, cart_Item.getProductID());
        pst.setString(2, cart_Item.getProductName());
        pst.setInt(3, cart_Item.getQuantity());
        pst.setDouble(4, cart_Item.getPrice());
        pst.setString(5, currentDateFormat);  
        pst.setInt(6, cart_Item.getCartID());

        int affectedRows = pst.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Updating cart item failed, no rows affected.");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
    // create shopping cart
    public Shopping_Cart createShoppingCart(Shopping_Cart shoppingCart) {
        String query = "INSERT INTO shoppingcart (cartID,customerID, createdDate, updatedDate) VALUES (?, ?, ?,?)";
        try {
            PreparedStatement pst = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            pst.setInt(1, shoppingCart.getCartID());
            pst.setInt(2, shoppingCart.getCustomerID());
            // get currently time
            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            pst.setTimestamp(3, currentTime);
            pst.setTimestamp(4, currentTime);
            pst.executeUpdate();

            ResultSet rs = pst.getGeneratedKeys();
            if (rs.next()) {
                shoppingCart.setCartID(rs.getInt(1));
            }
            System.out.println("shoppingCart is created ++" + shoppingCart);
            return shoppingCart;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
