package bankmanagement.model;

import java.sql.Timestamp;

public class Loan {
    private final int loanId;
    private final String accountNumber;
    private final double amount;
    private final double interestRate;
    private final int termMonths;
    private final String purpose;
    private String status;
    private final Timestamp applicationDate;
    private Timestamp approvalDate;
    private String approvedBy;
    private final double monthlyPayment;
    private final double totalRepayment;

    public Loan(int loanId, String accountNumber, double amount, double interestRate, int termMonths,
                String purpose, String status, Timestamp applicationDate, Timestamp approvalDate,
                String approvedBy, double monthlyPayment, double totalRepayment) {
        this.loanId = loanId;
        this.accountNumber = accountNumber;
        this.amount = amount;
        this.interestRate = interestRate;
        this.termMonths = termMonths;
        this.purpose = purpose;
        this.status = status;
        this.applicationDate = applicationDate;
        this.approvalDate = approvalDate;
        this.approvedBy = approvedBy;
        this.monthlyPayment = monthlyPayment;
        this.totalRepayment = totalRepayment;
    }

    // Getters and setters
    public int getLoanId() { return loanId; }
    public String getAccountNumber() { return accountNumber; }
    public double getAmount() { return amount; }
    public double getInterestRate() { return interestRate; }
    public int getTermMonths() { return termMonths; }
    public String getPurpose() { return purpose; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public Timestamp getApplicationDate() { return applicationDate; }
    public Timestamp getApprovalDate() { return approvalDate; }
    public void setApprovalDate(Timestamp approvalDate) { this.approvalDate = approvalDate; }
    public String getApprovedBy() { return approvedBy; }
    public void setApprovedBy(String approvedBy) { this.approvedBy = approvedBy; }
    public double getMonthlyPayment() { return monthlyPayment; }
    public double getTotalRepayment() { return totalRepayment; }
    void showDetails() {
        System.out.println("\nLoan Details:");
        System.out.println("Loan ID: " + loanId);
        System.out.println("Account Number: " + accountNumber);
        System.out.printf("Amount: %.2f%n", amount);
        System.out.printf("Interest Rate: %.2f%%%n", interestRate);
        System.out.println("Term: " + termMonths + " months");
        System.out.println("Purpose: " + purpose);
        System.out.println("Status: " + status);
        System.out.println("Application Date: " + applicationDate);
        if (approvalDate != null) {
            System.out.println("Approval Date: " + approvalDate);
            System.out.println("Approved By: " + approvedBy);
        }
        System.out.printf("Monthly Payment: %.2f%n", monthlyPayment);
        System.out.printf("Total Repayment: %.2f%n", totalRepayment);
    }

}