package Model;

public class Product {

    private int id;
    private String name;
    private String category;
    private Double price;
    private String image;
    private String status;
    private String guarantee;
    private String description;
        private String gpu;


    public Product() {
    }

    public Product(String name, String category, Double price, String image) {
        this.name = name;
        this.category = category;
        this.price = price;
        this.image = image;
    }

    public Product(int id, String name, String category, Double price, String image) {
        super();
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.image = image;
    }

    public Product(String name, String category, Double price, String image, String status, String guarantee, String description,String gpu) {
        this.name = name;
        this.category = category;
        this.price = price;
        this.image = image;
        this.status = status;
        this.guarantee = guarantee;
        this.description = description;
        this.gpu = gpu;
    }

    public String getGpu() {
        return gpu;
    }

    public void setGpu(String gpu) {
        this.gpu = gpu;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(String guarantee) {
        this.guarantee = guarantee;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Product [id=" + id + ", name=" + name + ", category=" + category + ", price=" + price + ", image="
                + image + "]";
    }

}
