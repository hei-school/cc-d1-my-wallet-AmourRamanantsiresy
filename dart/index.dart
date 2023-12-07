import 'WalletHandler.dart';
import 'input.dart';
import 'wallet.dart';

void main() {
  bool end = false;
  Wallet wallet = new Wallet(10000);
  WalletHandler walletHandler = new WalletHandler(wallet);

  while (!end) {
    walletHandler.getBanner();
    if (walletHandler.choice == 5) break;
    if (walletHandler.loginAttempt == 3) break;
    if (!walletHandler.isAuthenticated)
      walletHandler.login();
    else {
      walletHandler.handler();
      if (walletHandler.choice != 5) input("Type enter to continue");
    }
    ;
  }
}
