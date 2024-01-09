package Model;

public class Cart extends Product {

    private int quantity;
    private String email;
    private int p_id;

    public Cart() {
    }

    ;
        public Cart(int p_id, String name, String category, Double price, String image, int quantity, String email) {
        super(name, category, price, image);
        this.email = email;
        this.quantity = quantity;
        this.p_id = p_id;
    }

    public String getEmail() {
        return email;
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
