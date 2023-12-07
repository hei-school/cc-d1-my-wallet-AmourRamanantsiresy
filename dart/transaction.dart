enum TransactionType { deposition, withdrawal }

class Transaction {
  late DateTime date;
  late TransactionType type;
  late double amount;

  Transaction(this.amount, this.type) {
    this.date = DateTime.now();
  }

  @override
  toString() {
    return "${date.toIso8601String()} || $amount Ar || $type";
  }
}
