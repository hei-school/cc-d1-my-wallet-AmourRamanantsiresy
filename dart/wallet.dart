import 'deposition.dart';
import 'transaction.dart';
import 'withdrawal.dart';

class Wallet {
  List<Transaction> transactionHistory = [];
  double currentAmount;

  Wallet(this.currentAmount);

  void deposit(double amount) {
    if (amount > 0) {
      currentAmount += amount;
      transactionHistory.add(Deposition(amount));
    } else {
      throw Exception('The amount must be a number greater than zero.');
    }
  }

  void withdrawal(double amount) {
    if (amount > currentAmount || currentAmount == 0) {
      throw Exception("You don't have enough money.");
    } else if (amount <= 0) {
      throw Exception('The amount must be a number greater than zero.');
    } else {
      currentAmount -= amount;
      transactionHistory.add(Withdrawal(amount));
    }
  }

  String balance() {
    return '${currentAmount}Ar';
  }

  String history() {
    return transactionHistory.map((e) => e.toString()).join('\n');
  }
}
