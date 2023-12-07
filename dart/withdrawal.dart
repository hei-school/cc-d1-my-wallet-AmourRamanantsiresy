import 'transaction.dart';

class Withdrawal extends Transaction {
  Withdrawal(double amount) : super(amount, TransactionType.withdrawal);
}
