import 'transaction.dart';

class Deposition extends Transaction {
  Deposition(double amount) : super(amount, TransactionType.deposition);
}
