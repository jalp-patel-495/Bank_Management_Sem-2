package bankmanagement.model;

import java.sql.*;

public class FixedDeposit {
    private final String accountNumber;
    private final double principal;
    private final int tenureMonths;
    private final double taxAmount;
    private final double maturityAmount;
    private final double interestRate;
    private final double taxRate;

    public FixedDeposit(String accountNumber, double principal, int tenureMonths,
                        double interestRate, double taxRate, Connection connection) {
        this.accountNumber = accountNumber;
        this.principal = principal;
        this.tenureMonths = tenureMonths;
        this.interestRate = interestRate;
        this.taxRate = taxRate;

        // Calculate maturity amount using MySQL function
        this.maturityAmount = calculateMaturityAmount(connection);
        this.taxAmount = calculateTaxAmount();
    }
//
//    private double calculateMaturityAmount(Connection connection) {
//        try {
//            // Convert months to years for the function
//            double years = tenureMonths / 12.0;
//
//            // Call the MySQL function
//            String sql = "SELECT fd_maturity_amount(?, ?, ?)";
//            try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
//                pstmt.setDouble(1, principal);
//                pstmt.setDouble(2, interestRate);
//                pstmt.setDouble(3, years);
//
//                ResultSet rs = pstmt.executeQuery();
//                if (rs.next()) {
//                    return rs.getDouble(1);
//                }
//            }
//        } catch (SQLException e) {
//            System.err.println("Error calculating maturity amount: " + e.getMessage());
//        }
//
//        // Fallback calculation if database function fails
//        double years = tenureMonths / 12.0;
//        return principal * Math.pow((1 + interestRate/100), years);
//    }
    private double calculateMaturityAmount(Connection connection) {
        try {
            // Convert months to years for the function
            double years = tenureMonths / 12.0;

            // Use CallableStatement to call the MySQL function
            String sql = "{? = call fd_maturity_amount(?, ?, ?, ?)}";
            try (CallableStatement cstmt = connection.prepareCall(sql)) {
                // Register the return parameter
                cstmt.registerOutParameter(1, Types.DOUBLE);

                // Set the input parameters
                cstmt.setDouble(2, principal);
                cstmt.setDouble(3, interestRate);
                cstmt.setDouble(4, years);
                cstmt.setDouble(5, taxRate); // Add the missing taxRate parameter

                cstmt.execute();

                // Get the result
                return cstmt.getDouble(1);
            }
        } catch (SQLException e) {
            System.err.println("Error calculating maturity amount: " + e.getMessage());

            // Fallback calculation if database function fails
            double years = tenureMonths / 12.0;
            double totalAmount = principal * Math.pow((1 + interestRate/100), years);
            double totalInterest = totalAmount - principal;
            double taxAmount = totalInterest * (taxRate / 100);
            return totalAmount - taxAmount;
        }
    }
    public double calculateTaxAmount() {
        double yearlyInterest = interestRate / 100;
        double totalInterest = principal * Math.pow(1 + yearlyInterest, tenureMonths / 12.0) - principal;
        double taxAmount = totalInterest * (taxRate / 100);
        return principal + (totalInterest - taxAmount);
    }


    // Getters
    public String getAccountNumber() { return accountNumber; }
    public double getPrincipal() { return principal; }
    public int getTenureMonths() { return tenureMonths; }
    public double getTaxAmount() { return taxAmount; }
    public double getMaturityAmount() { return maturityAmount; }
    public double getInterestRate() { return interestRate; }
    public double getTaxRate() { return taxRate; }

    public void showDetails() {
        System.out.println("Fixed Deposit Details:");
        System.out.println("Account Number: " + accountNumber);
        System.out.printf("Principal: %.2f%n", principal);
        System.out.printf("Interest Rate: %.2f%%%n", interestRate);
        System.out.println("Tenure (months): " + tenureMonths);
        System.out.printf("Tax Rate: %.2f%%%n", taxRate);
        System.out.printf("Tax Deducted: %.2f%n", taxAmount);
        System.out.printf("Maturity Amount: %.2f%n", maturityAmount);
    }
}