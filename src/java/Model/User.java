package Model;

public class User {

    private int id;
    private String name;
    private String email;
    private String birthday;
    private String address;
    private String password;
    private String phone;
    private String role;

    public User() {
    }

    public User(String name, String email, String password, String phone, String role) {

        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.role = role;

    }

    public User(int id, String name, String email, String password, String phone, String role) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.role = role;

    }

    public User(String name, String birthday, String email, String address, String password, String phone, String role) {
        this.name = name;
        this.birthday = birthday;
        this.email = email;
        this.address = address;
        this.password = password;
        this.phone = phone;
        this.role = role;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
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

 
    
    
    @Override
    public String toString() {
        return "User [id=" + id + ", name=" + name + ", birthday=" + birthday + ", address=" + address + ", email=" + email + ", password=" + password + "]";
    }

}
