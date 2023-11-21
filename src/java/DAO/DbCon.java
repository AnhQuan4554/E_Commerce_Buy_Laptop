package DAO;

import java.sql.*;

public class DbCon {
	public static Connection connection;
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
        if(connection == null){
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","100502");
            System.out.print("connected");
        }
        return connection;
    }
}
