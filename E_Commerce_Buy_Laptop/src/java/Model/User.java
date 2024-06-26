package Model;

public class User {

    private int userID;
    private String username;
    private String password;
    private String phone;
    private String email;
    private int role;
    private int isActive;
    private String address;

    public User() {
    }

    public User( String username, String password, String phone, String email, int role, int isActive,
            String address) {
        this.username = username;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.role = role;
        this.isActive = isActive;
        this.address = address;
    }

    public User(String username, String phone, String email, int isActive, String address) {
        this.username = username;
        this.phone = phone;
        this.email = email;
        this.isActive = isActive;
        this.address = address;
    }
    

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "User{" + "userID=" + userID + ", username=" + username + ", password=" + password + ", phone=" + phone
                + ", email=" + email + ", role=" + role + ", isActive=" + isActive + ", address=" + address + '}';
    }

}
