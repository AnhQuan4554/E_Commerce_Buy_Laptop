package DAO;

import Model.Cart;
import Model.Product;
import java.sql.*;
import java.util.*;

public class ProductDao extends DbCon {

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public ProductDao() {
        super();
    }

    public List<Product> getAllProducts() {
        List<Product> book = new ArrayList<>();
        try {

            query = "select * from product";
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                Product row = new Product();
                row.setProductID(rs.getInt("productID"));
                row.setProductName(rs.getString("productName"));
                row.setCategoryID(rs.getInt("categoryID"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
                book.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }

    public boolean addProduct(Product product) {
        try {
            String sql = "INSERT INTO product(productID, productName, price, quantityInStock, description,image,categoryID,manufacturerID,voucherCode) Values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = this.con.prepareStatement(sql);
            pst.setInt(1, product.getProductID());
            pst.setString(2, product.getProductName());
            pst.setDouble(3, product.getPrice());
            pst.setDouble(4, product.getQuantityInStock());
            pst.setString(5, product.getDescription());
            pst.setString(6, product.getImage());
            pst.setInt(7, product.getCategoryID());
            pst.setInt(8, product.getManufacturerID());
            pst.setInt(9, product.getVoucherCode());

            pst.executeUpdate();
            return true;

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Can not add Product)" + ex);
            return false;
        }

    }

    public Product findProduct(String productID) {
        try {
            query = "SELECT * from product WHERE productID = '" + productID + "';";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            if (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt(1));
                product.setProductName(rs.getString(2));
                product.setPrice(rs.getDouble(3));
                product.setQuantityInStock(4);
                product.setDescription(rs.getString(5));
                product.setImage(rs.getString(6));
                product.setCategoryID(rs.getInt(7));
                product.setVoucherCode(rs.getInt(8));
                System.out.println("product when find+"+ product);
                return product;
            } else {
                return null;
            }
        } catch (SQLException e) {
            System.out.println("Cannot find Product. Log in ProductDAO");
            return null;
        }
    }

    public boolean updateProduct(Product product) {
        try {
            String sql = "UPDATE products SET "
                    + "productName = ?,"
                    + "categoryID = ?,"
                    + "price = ?,"
                    + "image = ?"
                    + "WHERE productID = ?;";
            PreparedStatement pst = this.con.prepareStatement(sql);

            pst.setString(1, product.getProductName());
            pst.setInt(2, product.getCategoryID());
            pst.setDouble(3, product.getPrice());
            pst.setString(4, product.getImage());
            pst.setInt(5, product.getProductID());

            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Can't update product. Log at ProductDAO!!");
            return false;
        }
    }

    public boolean deleteProduct(int productId) {
        try {
            String sql = "DELETE from product where id = '" + productId + "'";
            PreparedStatement pst = this.con.prepareStatement(sql);
            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            return false;
        }
    }

    public Product getSingleProduct(int id) {
        Product row = null;
        try {
            query = "select * from product where id=? ";

            pst = con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                row = new Product();
                row.setProductID(rs.getInt("productID"));
                row.setProductName(rs.getString("productName"));
                row.setCategoryID(rs.getInt("categoryID"));
                row.setPrice(rs.getDouble("price"));
                row.setImage(rs.getString("image"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }

        return row;
    }

    public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select price from product where productID=?";
                    pst = con.prepareStatement(query);
                    pst.setInt(1, item.getProductID());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        sum += rs.getDouble("price") * item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }

    /// handle get product deepend on condition
    public List<Product> getProductsByPrice(String sortType) {
        List<Product> productList = new ArrayList<>();
        try {
            String query = "SELECT * from product";
            if (sortType != null && !sortType.isEmpty()) {
                if (sortType.equals("lowtohigh")) {
                    query += " ORDER BY price ASC";
                } else if (sortType.equals("hightolow")) {
                    query += " ORDER BY price DESC";
                }
            }

            pst = con.prepareStatement(query);

            rs = pst.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("productID"));
                product.setProductName(rs.getString("productName"));
                product.setCategoryID(rs.getInt("categoryID"));
                product.setPrice(rs.getDouble("price"));
                product.setImage(rs.getString("image"));
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return productList;
    }

    public List<Product> getProductsByCategory(String category) {
        List<Product> productList = new ArrayList<>();
        try {
            String query = "SELECT * from product";
            if (category != null && !category.isEmpty()) {
                query += " WHERE category = ?";
            }

            pst = con.prepareStatement(query);

            if (category != null && !category.isEmpty()) {
                pst.setString(1, category);
            }

            rs = pst.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getInt("productID"));
                product.setProductName(rs.getString("productName"));
                product.setCategoryID(rs.getInt("categoryID"));
                product.setPrice(rs.getDouble("price"));
                product.setImage(rs.getString("image"));
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return productList;

    }

}
