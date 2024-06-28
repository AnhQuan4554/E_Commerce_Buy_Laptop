package Model;

public class Order extends Product {

    private int orderId;
    private int uid;
    private int quantity;
    private String date;
    private String recipientName;
    private String phoneNumber;
    private String address;


    public Order() {
    }

    public Order(int orderId, int uid, int qunatity, String date) {
        super();
        this.orderId = orderId;
        this.uid = uid;
        this.quantity = qunatity;
        this.date = date;
    }

      public Order(int orderId, int uid, int qunatity, String date,String recipientName,String phoneNumber,String address) {
        super();
        this.orderId = orderId;
        this.uid = uid;
        this.quantity = qunatity;
        this.date = date;
        this.recipientName = recipientName;
        this.phoneNumber = phoneNumber;
        this.address = address;
    }


    public Order(int uid, int qunatity, String date) {
        super();
        this.uid = uid;
        this.quantity = qunatity;
        this.date = date;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int qunatity) {
        this.quantity = qunatity;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getRecipientName() {
        return recipientName;
    }

    public void setRecipientName(String recipientName) {
        this.recipientName = recipientName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", uid=" + uid + ", quantity=" + quantity + ", date=" + date + ", recipientName=" + recipientName + ", phoneNumber=" + phoneNumber + ", address=" + address + '}';
    }
    
}
