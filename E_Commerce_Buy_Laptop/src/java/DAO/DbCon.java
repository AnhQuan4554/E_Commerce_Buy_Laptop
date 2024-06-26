package DAO;

import java.sql.*;

public class DbCon {
//	public static Connection con;
//	public static Connection getConnection() throws ClassNotFoundException, SQLException{
//        if(con == null){
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","100502");
//            System.out.print("connected to DB Success++");
//        }
//        return con;
//    }
     public static Connection con;//declare the connection
    private String username = "root";
    private String password = "100502";
    //constructor
    public DbCon() {
        if (con == null) {
            String dbUrl = "jdbc:mysql://localhost:3306/new_ecommerce";
            String dbClass = "com.mysql.cj.jdbc.Driver";

            try {
                Class.forName(dbClass);
                con = DriverManager.getConnection(dbUrl, username, password);
                System.out.println("connect success");
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
