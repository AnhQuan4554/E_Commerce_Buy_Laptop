package DAO;

import Model.Order;
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

    public boolean insertOrder(Order model) {
        boolean result = false;
        try {
            query = "insert into orders (p_id, u_id, o_quantity, o_date) values(?,?,?,?)";
            pst = con.prepareStatement(query);
            pst.setInt(1, model.getId());
            pst.setInt(2, model.getUid());
            pst.setInt(3, model.getQuantity());
            pst.setString(4, model.getDate());
            pst.executeUpdate();
            result = true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public List<Order> userOrders(int id) {
    List<Order> list = new ArrayList<>();

    try {
        query = "SELECT o.o_id, o.o_date, p.name, p.category,p.price, o.o_quantity FROM orders o JOIN products p ON o.p_id = p.id WHERE o.u_id = ? ORDER BY o.o_id DESC";
        pst = con.prepareStatement(query);
        pst.setInt(1, id);
        rs = pst.executeQuery();
        
        while (rs.next()) {
            Order order = new Order();
            order.setId(rs.getInt("o_id"));
            order.setDate(rs.getString("o_date"));
            order.setName(rs.getString("name"));
            order.setCategory(rs.getString("category"));
            order.setQuantity(rs.getInt("o_quantity"));
            order.setPrice(rs.getDouble("price")*rs.getInt("o_quantity"));
            list.add(order);
        }
//        System.out.println("list+++"+list);
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println(e.getMessage());
    }
    return list;
}


    public void cancelOrder(int id) {
        //boolean result = false;
        try {
            query = "delete from orders where o_id=?";
            pst = con.prepareStatement(query);
            pst.setInt(1, id);
            pst.execute();
            //result = true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        //return result;
    }
}
