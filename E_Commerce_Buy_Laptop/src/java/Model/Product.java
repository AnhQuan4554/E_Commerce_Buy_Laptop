package Model;

public class Product {

    private int productID;
    private String productName;
    private Double price;
    private int quantityInStock;
    private String description;
    private String image;
    private int categoryID;
    private int manufacturerID;
    private int voucherCode;

    public Product() {
    }

    public Product(int productID, String productName, Double price, int quantityInStock, String description, String image, int categoryID, int manufacturerID, int voucherCode) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.quantityInStock = quantityInStock;
        this.description = description;
        this.image = image;
        this.categoryID = categoryID;
        this.manufacturerID = manufacturerID;
        this.voucherCode = voucherCode;
    }

    public Product(int productID, String productName, Double price, String image, int categoryID) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.image = image;
        this.categoryID = categoryID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public int getQuantityInStock() {
        return quantityInStock;
    }

    public void setQuantityInStock(int quantityInStock) {
        this.quantityInStock = quantityInStock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getManufacturerID() {
        return manufacturerID;
    }

    public void setManufacturerID(int manufacturerID) {
        this.manufacturerID = manufacturerID;
    }

    public int getVoucherCode() {
        return voucherCode;
    }

    public void setVoucherCode(int voucherCode) {
        this.voucherCode = voucherCode;
    }

    @Override
    public String toString() {
        return "Product{" + "productID=" + productID + ", productName=" + productName + ", price=" + price + ", quantityInStock=" + quantityInStock + ", description=" + description + ", image=" + image + ", categoryID=" + categoryID + ", manufacturerID=" + manufacturerID + ", voucherCode=" + voucherCode + '}';
    }

    
}
