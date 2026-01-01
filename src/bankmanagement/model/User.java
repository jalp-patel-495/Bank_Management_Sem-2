package bankmanagement.model;

public abstract class User {
    protected String id;
    protected String password;

    public User(String id, String password) {
        this.id = id;
        this.password = password;
    }

    public boolean verifyCredentials(String id, String password) {
        return this.id.equals(id) && this.password.equals(password);
    }

    public String getId() {
        return id;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}