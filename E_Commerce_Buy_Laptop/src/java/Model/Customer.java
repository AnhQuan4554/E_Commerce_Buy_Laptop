/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author welcome
 */
public class Customer {
     private int customerID;
    private String customerName;
    private String birthday;
    private String address;
    private String phone;
    private String email;

    public Customer() {
    }

    public Customer(int customerID, String customerName, String birthday, String address, String phone, String email) {
        this.customerID = customerID;
        this.customerName = customerName;
        this.birthday = birthday;
        this.address = address;
        this.phone = phone;
        this.email = email;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Customer{" + "customerID=" + customerID + ", customerName=" + customerName + ", birthday=" + birthday + ", address=" + address + ", phone=" + phone + ", email=" + email + '}';
    }
    
}
