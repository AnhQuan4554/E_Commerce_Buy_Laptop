package Model;

public class Cart extends Product{
	private int quantity;
	private String email;
         public Cart(){};
        public Cart(String name, String category, Double price, String image,int quantity,String email) {
           super(name, category, price, image);
           this.email = email;
           this.quantity= quantity;
	}
    public String getEmail() {
        return email;
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
