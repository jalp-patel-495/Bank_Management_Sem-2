package bankmanagement.model;

import java.util.*;

public class Account extends User {
    private final String accountNumber;
    private String holderName;
    private String address;
    private String mobileNumber;
    private double balance;
    private int creditScore;
    private AccountType accountType;
    private int transactionCount;
    private Date lastInterestDate;

    public Account(String accountNumber, String pin, String holderName, String address, String mobileNumber,
                   double initBalance, int creditScore, AccountType accountType, int transactionCount, Date lastInterestDate) {
        super(accountNumber, pin);
        this.accountNumber = accountNumber;
        this.holderName = holderName;
        this.address = address;
        this.mobileNumber = mobileNumber;
        this.balance = initBalance;
        this.creditScore = creditScore;
        this.accountType = accountType;
        this.transactionCount = transactionCount;
        this.lastInterestDate = lastInterestDate;
    }

    // Getters and setters
    public String getAccountNumber() { return accountNumber; }
    public String getHolderName() { return holderName; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getMobileNumber() { return mobileNumber; }
    public void setMobileNumber(String mobileNumber) { this.mobileNumber = mobileNumber; }
    public double getBalance() { return balance; }
    public int getCreditScore() { return creditScore; }
    public void setCreditScore(int score) { this.creditScore = score; }
    public AccountType getAccountType() { return accountType; }
    public void setPin(String newPin) { this.password = newPin; }
    public int getTransactionCount() { return transactionCount; }
    public void setTransactionCount(int count) { this.transactionCount = count; }
    public Date getLastInterestDate() { return lastInterestDate; }
    public void setLastInterestDate(Date date) { this.lastInterestDate = date; }

    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
        }
    }

    public boolean withdraw(double amount) {
        if (amount <= 0) {
            return false;
        }

        // Check minimum balance requirement
        if ((balance - amount) < accountType.minBalance) {
            return false;
        }

        // Check withdrawal limit
        if (amount > accountType.withdrawalLimit) {
            return false;
        }

        if (amount > balance) {
            return false;
        }

        // Check for transaction fee
        double fee = 0;
        if (accountType.freeTransactions > 0 && transactionCount >= accountType.freeTransactions) {
            fee = accountType.transactionFee;
        }

        balance -= (amount + fee);
        transactionCount++;
        return true;
    }

    public double calculateMonthlyInterest() {
        // Check if interest was already applied this month
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        int currentMonth = cal.get(Calendar.MONTH);
        int currentYear = cal.get(Calendar.YEAR);

        if (lastInterestDate != null) {
            cal.setTime(lastInterestDate);
            int lastMonth = cal.get(Calendar.MONTH);
            int lastYear = cal.get(Calendar.YEAR);

            if (currentMonth == lastMonth && currentYear == lastYear) {
                return 0; // Interest already applied this month
            }
        }

        // Calculate interest
        return balance * accountType.interestRate / 12 / 100;
    }

    public void applyMonthlyInterest() {
        double interest = calculateMonthlyInterest();
        if (interest > 0) {
            balance += interest;
            lastInterestDate = new Date();
        }
    }

    public boolean verifyPin(String inputPin) {
        return super.verifyCredentials(getAccountNumber(), inputPin);
    }

    public void showDetails() {
        System.out.println("\nAccount Details:");
        System.out.println("Account Number: " + accountNumber);
        System.out.println("Holder Name: " + holderName);
        System.out.println("Account Type: " + accountType.displayName);
        System.out.println("Address: " + address);
        System.out.println("Mobile Number: " + mobileNumber);
        System.out.printf("Balance: %.2f%n", balance);
        System.out.println("Credit Score: " + creditScore);
        System.out.printf("Interest Rate: %.2f%%%n", accountType.interestRate);
        System.out.printf("Minimum Balance: %.2f%n", accountType.minBalance);
        System.out.printf("Withdrawal Limit: %.2f%n", accountType.withdrawalLimit);
        System.out.println("Free Transactions: " + accountType.freeTransactions);
        System.out.println("Transactions This Month: " + transactionCount);
    }


}