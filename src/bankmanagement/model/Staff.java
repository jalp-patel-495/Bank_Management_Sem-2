package bankmanagement.model;

public class Staff extends User {
    private String name;
    private int age;
    private String gender;
    private String email;
    private String mobileNumber;

    public Staff(String id, String pass, String name, int age, String gender, String email, String mobileNumber) {
        super(id, pass);
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.email = email;
        this.mobileNumber = mobileNumber;
    }

    // Getters and setters
    public String getName() {
        return name; }
    public void setName(String name) {
        this.name = name; }
    public int getAge() {
        return age; }
    public void setAge(int age) {
        this.age = age; }
    public String getGender() {
        return gender; }
    public void setGender(String gender) {
        this.gender = gender; }
    public String getEmail() {
        return email; }
    public void setEmail(String email) {
        this.email = email; }
    public String getMobileNumber() {
        return mobileNumber; }
    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber; }
}