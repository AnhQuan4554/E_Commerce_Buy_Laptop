package DAO;

import java.sql.*;
import Model.*;

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
            System.out.println("CON CUA LOGIN"+con);
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
        query = "INSERT INTO `ecommerce`.`users` (`name`, `email`, `password`, `phone`, `role`)  VALUES (?,?, ?, ?, ?)";
      
               
       
            pst = con.prepareStatement(query);
            pst.setString(1, newUser.getName());
            pst.setString(2, newUser.getEmail());
            pst.setString(3, newUser.getPassword());
            pst.setString(4, newUser.getPhone());
            pst.setString(5, newUser.getRole());
            // Thực hiện câu lệnh SQL để chèn dữ liệu vào cơ sở dữ liệu
            int rowsAffected = pst.executeUpdate();

            // Nếu có ít nhất một dòng bị ảnh hưởng, người dùng đã được đăng ký thành công
            if (rowsAffected > 0) {
                System.out.println("Info new User++"+newUser.getName()+newUser.getRole());
                success = true;

            }
        } catch (SQLException e) {
            System.out.print(e);
        }
        return success;
    }
}
