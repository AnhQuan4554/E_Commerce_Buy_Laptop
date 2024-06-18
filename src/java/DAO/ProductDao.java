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

            query = "select * from products";
            pst = con.prepareStatement(query);
            rs = pst.executeQuery();
            while (rs.next()) {
                Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
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
            String sql = "INSERT INTO products(id, name, category, price, image,status,guarantee,description,gpu) Values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement pst = this.con.prepareStatement(sql);
            pst.setInt(1, product.getId());
            pst.setString(2, product.getName());
            pst.setString(3, product.getCategory());
            pst.setDouble(4, product.getPrice());
            pst.setString(5, product.getImage());
            pst.setString(6, product.getStatus());
            pst.setString(7, product.getGuarantee());
            pst.setString(8, product.getDescription());
            pst.setString(9, product.getGpu());

            pst.executeUpdate();
            return true;

        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Can not add Product)" + ex);
            return false;
        }

    }

    public Product findProduct(String productId) {
        try {
            query = "SELECT * FROM products WHERE id = '" + productId + "';";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            if (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setCategory(rs.getString(3));
                product.setPrice(rs.getDouble(4));
                product.setImage(rs.getString(5));
                product.setStatus(rs.getString(6));
                product.setGuarantee(rs.getString(7));
                product.setDescription(rs.getString(8));
                product.setGpu(rs.getString(9));
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
                    + "name = ?,"
                    + "category = ?,"
                    + "price = ?,"
                    + "image = ?"
                    + "WHERE id = ?;";
            PreparedStatement pst = this.con.prepareStatement(sql);

            pst.setString(1, product.getName());
            pst.setString(2, product.getCategory());
            pst.setDouble(3, product.getPrice());
            pst.setString(4, product.getImage());
            pst.setInt(5, product.getId());

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
            String sql = "DELETE FROM products where id = '" + productId + "'";
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
            query = "select * from products where id=? ";

            pst = con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
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
                    query = "select price from products where id=?";
                    pst = con.prepareStatement(query);
                    pst.setInt(1, item.getId());
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
            String query = "SELECT * FROM products";
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
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategory(rs.getString("category"));
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
            String query = "SELECT * FROM products";
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
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setCategory(rs.getString("category"));
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
