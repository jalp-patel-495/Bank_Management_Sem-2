package bankmanagement;

import bankmanagement.service.BankManagement;

public class Main {
    public static void main(String[] args) {
        BankManagement bankSystem = new BankManagement();
        try {
            bankSystem.run();
        } catch (Exception e) {
            System.err.println("System error: " + e.getMessage());
        }
    }
}