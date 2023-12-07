import 'clear_console.dart';
import 'input.dart';
import 'is_number.dart';
import 'wallet.dart';

class WalletHandler {
  bool isAuthenticated = false;
  int loginAttempt = 0;
  int choice = -1;
  late Wallet wallet;

  WalletHandler(this.wallet);

  getBanner() {
    String value =
        "\n __    __      _ _      _       \n/ / /\\ \\ \\__ _| | | ___| |_  \n\\ \\/  \\/ / _ | | |/ _ \\ __|\n \\  /\\  / (_| | | |  __/ |_\n  \\/  \\/ \\__,_|_|_|\\___|\\__|\n";
    print(value);
  }

  login() {
    loginAttempt++;
    String username = input("Username : ");
    String password = input("Password : ");
    if (username == "admin" && password == "admin") {
      this.isAuthenticated = true;
    } else {
      throw Exception("Verify your credentials.");
    }
  }

  getChoices() {
    String text =
        "Deposition : 1 \nWithdrawal : 2 \nBalance : 3 \nTransaction history : 4 \nExit : 5\n";
    print(text);
  }

  getChoice() {
    String choice = input("==> ");
    RegExp pattern = RegExp(r"^[1-5]$");
    bool isMatch = pattern.hasMatch(choice);
    if (!isMatch) {
      throw Exception("Bad choice !");
    }
    this.choice = int.parse(choice);
  }

  deposition() {
    print("\n# Deposition #\n");
    String toDepose = input("Amount => ");
    if (!isNumber(toDepose)) throw Exception("Bad amount value.");
    double amount = double.parse(toDepose);
    this.wallet.deposit(amount);
    print("Deposition done.");
  }

  withdrawal() {
    print("\n# Withdrawal #\n");
    String toTake = input("Amount => ");
    if (!isNumber(toTake)) throw Exception("Bad amount value.");
    double amount = double.parse(toTake);
    this.wallet.withdrawal(amount);
    print("Withdrawal done.");
  }

  balance() {
    print("\n# Balance #\n");
    print(this.wallet.balance());
  }

  transactionHistory() {
    print("\n# Transaction history #\n");
    print(this.wallet.history());
  }

  enterBeforeNext(callback) {
    callback && (callback());
    input("\nType enter to continue");
  }

  handler() {
    clearConsole();
    getBanner();
    getChoices();
    getChoice();

    switch (choice) {
      case 1:
        return deposition();
      case 2:
        return withdrawal();
      case 3:
        return balance();
      case 4:
        return transactionHistory();
      default:
        print("Goodbye !");
    }
  }
}
