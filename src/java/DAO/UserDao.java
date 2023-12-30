package DAO;

import static DAO.DbCon.con;
import java.sql.*;
import Model.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao extends DbCon {
    
    private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    public UserDao() {
        super();
    }
    
    public User userLogin(String email, String password) {
        User user = null;
        try {
            query = "select * from users where email=? and password=?";
            pst = con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
                
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return user;
    }
    
    public boolean userRegister(User newUser) throws SQLException {
        boolean success = false;
        try {

            // Query để chèn một người dùng mới vào cơ sở dữ liệu
            query = "INSERT INTO `ecommerce`.`users` (`name`, `birthday`, `email`, `address`, `password`, `phone`, `role`)  VALUES (?, ?, ?, ?, ?, ?, ?)";
            
            pst = con.prepareStatement(query);
            pst.setString(1, newUser.getName());
            pst.setString(2, newUser.getBirthday());
            pst.setString(3, newUser.getEmail());
            pst.setString(4, newUser.getAddress());
            pst.setString(5, newUser.getPassword());
            pst.setString(6, newUser.getPhone());
            pst.setString(7, newUser.getRole());
            // Thực hiện câu lệnh SQL để chèn dữ liệu vào cơ sở dữ liệu
            int rowsAffected = pst.executeUpdate();

            // Nếu có ít nhất một dòng bị ảnh hưởng, người dùng đã được đăng ký thành công
            if (rowsAffected > 0) {
                System.out.println("Info new User++" + newUser.getName() + newUser.getRole());
                success = true;
                
            }
        } catch (SQLException e) {
            System.out.print(e);
        }
        return success;
    }

    public List<User> getAllClients() {
        List<User> clients = new ArrayList<>();
        try {
            query = "select * from users where role = 0 OR role IS NULL"; // sửa lại câu này
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                User row = new User();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setBirthday(rs.getString("birthday"));
                row.setAddress(rs.getString("address"));
                row.setPhone(rs.getString("phone"));
                row.setEmail(rs.getString("email"));
                clients.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return clients;
    }
    
    public User getUser(String email) {
        User user = null;
        try {
            query = "select * from users where email=?";
            pst = con.prepareStatement(query);
            pst.setString(1, email);
            rs = pst.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setBirthday(rs.getString("birthday"));
                user.setPhone(rs.getString("phone"));
                
            }
        } catch (SQLException e) {
            System.out.print(e.getMessage());
        }
        return user;
    }
    public boolean updateUser(User updatedUser) {
    boolean updated = false;
    try {
        query = "update users set name=?, email=?, address=?, birthday=?, phone=? where email=?";
        pst = con.prepareStatement(query);
        pst.setString(1, updatedUser.getName());
        pst.setString(2, updatedUser.getEmail());
        pst.setString(3, updatedUser.getAddress());
        pst.setString(4, updatedUser.getBirthday());
        pst.setString(5, updatedUser.getPhone());
        pst.setString(6, updatedUser.getEmail());
        System.out.println("query+++" + query);
        int rowsAffected = pst.executeUpdate();
        if (rowsAffected > 0) {
            updated = true;
        }
    } catch (SQLException e) {
        System.out.print(e.getMessage());
    }
    return updated;
}

    public boolean deleteClient(int clientID) {
        try {
            String sql = "DELETE FROM users where id = '" + clientID + "'";
            PreparedStatement pst = this.con.prepareStatement(sql);
            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            return false;
        }
    }
    
    public boolean isEmailExists(String email) {
        try {
            query = "SELECT * FROM users WHERE email=?";
            pst = con.prepareStatement(query);
            pst.setString(1, email);
            rs = pst.executeQuery();
            return rs.next(); // Nếu có ít nhất một kết quả, email tồn tại
        } catch (SQLException e) {
            System.out.print(e.getMessage());
            return false;
        }
    }
    
}
