package bankmanagement.model;

public enum AccountType {
    SAVINGS("Savings", 500, 0.04, 25000, 5, 0),
    BUSINESS("Business", 10000, 0.02, 100000, 20, 10),
    STUDENT("Student", 0, 0.05, 10000, 0, 0),
    SENIOR("Senior Citizen", 0, 0.06, 50000, 0, 0),
    CURRENT("Current", 1000, 0.01, 50000, 10, 5);

    public final String displayName;
    public final double minBalance;
    public final double interestRate;
    public final double withdrawalLimit;
    public final int freeTransactions;
    public final double transactionFee;

    AccountType(String displayName, double minBalance, double interestRate, double withdrawalLimit,
                int freeTransactions, double transactionFee) {
        this.displayName = displayName;
        this.minBalance = minBalance;
        this.interestRate = interestRate;
        this.withdrawalLimit = withdrawalLimit;
        this.freeTransactions = freeTransactions;
        this.transactionFee = transactionFee;
    }
}