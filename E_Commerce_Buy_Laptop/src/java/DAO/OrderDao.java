package DAO;

import Model.Order;
import Model.Order_Detail;
import Model.Order_Response;
import Model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class OrderDao extends DbCon {

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public OrderDao() {
        super();
    }

    public List<Order_Response> userOrders(int id) {
        List<Order_Response> list = new ArrayList<>();

        try {
            query = "SELECT * FROM `order` WHERE customerID = ?";
            PreparedStatement cartPst = con.prepareStatement(query);
            cartPst.setInt(1, id);
            ResultSet cartRs = cartPst.executeQuery();

            while (cartRs.next()) {
                int orderID = cartRs.getInt("orderID");
                String itemQuery = "SELECT od.*, p.productName " +
                               "FROM orderdetail od " +
                               "JOIN product p ON od.productID = p.productID " +
                               "WHERE od.orderID = ?";
                PreparedStatement itemPst = con.prepareStatement(itemQuery);
                itemPst.setInt(1, orderID);
                ResultSet itemRs = itemPst.executeQuery();
                while (itemRs.next()) {
                     System.out.println("list order when getall++" + itemRs);
                    Order_Response order_Detail = new Order_Response();
                    order_Detail.setOrderID(itemRs.getInt("orderID"));
                    order_Detail.setProductID(itemRs.getInt("productID"));
                    order_Detail.setQuantity(itemRs.getInt("quantity"));
                    order_Detail.setPriceEach(itemRs.getDouble("priceEach"));
                    order_Detail.setSubTotal(itemRs.getDouble("subTotal"));
                    order_Detail.setProductName(itemRs.getString("productName"));
                    list.add(order_Detail);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        System.out.println("list order when getall++" + list);
        return list;
    }

    public void cancelOrder(int id) {
   
        try {
            query = "delete from orderdetail where orderID=?";
            pst = con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
            // result = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        // return result;
    }

    public Order_Detail createOrderDetail(Order_Detail order_Detail) {
        try {
            String query = "INSERT INTO orderdetail (productID, quantity, priceEach, subTotal) VALUES (?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            pst.setInt(1, order_Detail.getProductID());
            pst.setInt(2, order_Detail.getQuantity());
            pst.setDouble(3, order_Detail.getPriceEach());
            pst.setDouble(4, order_Detail.getSubTotal());

            int affectedRows = pst.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating order detail failed, no rows affected.");
            }

            try (ResultSet generatedKeys = pst.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    order_Detail.setOrderID(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating order detail failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return order_Detail;
    }

    public Order createOrder(Order order) {

        try {
            System.out.println("");
            String query = "INSERT INTO `order`  (orderId, customerID, createdDate, note,status) VALUES (?, ?, ?, ?,?)";
            PreparedStatement pst = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
            pst.setInt(1, order.getOrderId());
            pst.setInt(2, order.getCustomerID());
            pst.setString(3, order.getCreatedDate());
            pst.setString(4, order.getNote());
            pst.setString(5, order.getStatus());

            int affectedRows = pst.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating order detail failed, no rows affected.");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return order;
    }

}
