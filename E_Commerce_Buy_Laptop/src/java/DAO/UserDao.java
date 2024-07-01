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
            query = "select * from user where email=? and password=?";
            pst = con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserID(rs.getInt("userID"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getInt("role"));
                user.setAddress(rs.getString("address"));
                user.setPhone(rs.getString("phone"));
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
        String query = "INSERT INTO `new_ecommerce`.`user` (`username`, `password`, `phone`, `email`, `role`, `isActive`, `address`) VALUES (?, ?, ?, ?, ?, ?, ?)";
        pst = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        pst.setString(1, newUser.getUsername());
        pst.setString(2, newUser.getPassword());
        pst.setString(3, newUser.getPhone());
        pst.setString(4, newUser.getEmail());
        pst.setInt(5, newUser.getRole());
        pst.setInt(6, newUser.getIsActive());
        pst.setString(7, newUser.getAddress());

        // Thực hiện câu lệnh SQL để chèn dữ liệu vào cơ sở dữ liệu
        int rowsAffected = pst.executeUpdate();

        // Nếu có ít nhất một dòng bị ảnh hưởng, người dùng đã được đăng ký thành công
        if (rowsAffected > 0) {
            ResultSet rs = pst.getGeneratedKeys();
            if (rs.next()) {
                int userID = rs.getInt(1); // Lấy userID của người dùng vừa được tạo
                newUser.setUserID(userID); // Gán userID cho đối tượng User

                System.out.println("Info new User++" + newUser.getUsername() + newUser.getRole());

                // Thêm customer mới
                String queryCustomer = "INSERT INTO `new_ecommerce`.`customer` (`customerID`, `customerName`, `birthday`, `address`, `phone`, `email`) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement pstCustomer = con.prepareStatement(queryCustomer);
                pstCustomer.setInt(1, newUser.getUserID());
                pstCustomer.setString(2, newUser.getUsername());
                pstCustomer.setString(3, "address"); // hoặc newUser.getBirthday() nếu có trường này trong User
                pstCustomer.setString(4, newUser.getAddress());
                pstCustomer.setString(5, newUser.getPhone());
                pstCustomer.setString(6, newUser.getEmail());

                int rowsAffected2 = pstCustomer.executeUpdate();
                if (rowsAffected2 > 0) {
                    success = true;
                }
            }
        }
    } catch (SQLException e) {
        System.out.print(e);
    }
    return success;
}


    public List<User> getAllClients() {
        List<User> clients = new ArrayList<>();
        try {
            query = "select * from user where role = 0 OR role IS NULL"; // sửa lại câu này
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                User row = new User();
                row.setUserID(rs.getInt("userID"));
                row.setUsername(rs.getString("username"));
                // row.setBirthday(rs.getString("birthday"));
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
            query = "select * from user where email=?";
            pst = con.prepareStatement(query);
            pst.setString(1, email);
            rs = pst.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserID(rs.getInt("userID"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                // user.setBirthday(rs.getString("birthday"));
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
            query = "update user set username=?, email=?, address=?, birthday=?, phone=? where email=?";
            pst = con.prepareStatement(query);
            pst.setString(1, updatedUser.getUsername());
            pst.setString(2, updatedUser.getEmail());
            pst.setString(3, updatedUser.getAddress());
            // pst.setString(4, updatedUser.getBirthday());
            pst.setString(5, updatedUser.getPhone());
            pst.setString(6, updatedUser.getEmail());
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
            String sql = "DELETE FROM user where userID = '" + clientID + "'";
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
            query = "SELECT * FROM user WHERE email=?";
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
