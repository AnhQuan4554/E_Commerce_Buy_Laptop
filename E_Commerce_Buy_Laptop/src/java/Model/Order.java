package Model;

public class Order {

    private int orderId;
    private int customerID;
    private String createdDate;
    private String note;
    private String status;


    public Order() {
    }

    public Order(int orderId, int customerID, String createdDate, String note, String status) {
        this.orderId = orderId;
        this.customerID = customerID;
        this.createdDate = createdDate;
        this.note = note;
        this.status = status;
    }

    public Order(int customerID, String createdDate, String note, String status) {
        this.customerID = customerID;
        this.createdDate = createdDate;
        this.note = note;
        this.status = status;
    }

    
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", customerID=" + customerID + ", createdDate=" + createdDate + ", note=" + note + ", status=" + status + '}';
    }

}
