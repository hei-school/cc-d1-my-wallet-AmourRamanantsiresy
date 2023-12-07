import { input } from "./input.js";

export class WalletHandler {
  isAuthenticated = false;
  loginAttempt = 0;
  choice = -1;

  constructor(wallet) {
    this.wallet = wallet;
  }

  getBanner() {
    const value = `
 __    __      _ _      _       
/ / /\\ \\ \\__ _| | | ___| |_  
\\ \\/  \\/ / _\` | | |/ _ \\ __|
 \\  /\\  / (_| | | |  __/ |_
  \\/  \\/ \\__,_|_|_|\\___|\\__|
`;
    console.log(value);
  }

  async login() {
    this.loginAttempt++;
    const username = await input("Username : ");
    const password = await input("Password : ");
    if (username === "admin" && password === "admin") {
      this.isAuthenticated = true;
    } else {
      throw Error("Verify your credentials.");
    }
  }

  getChoices() {
    const text = `Deposition : 1 \nWithdrawal : 2 \nBalance : 3 \nTransaction history : 4 \nExit : 5`;
    console.log(text);
  }

  async getChoice() {
    const choice = await input("==> ");
    if (!/[1-5]/.test(choice) || choice.length !== 1) {
      throw new Error("Bad choice !");
    }
    this.choice = +choice;
  }

  async deposition() {
    console.log("\n# Deposition #\n");
    const toDepose = await input("Amount => ");
    if (isNaN(toDepose)) throw new Error("Bad amount value.");
    const amount = parseFloat(toDepose);
    this.wallet.deposit(amount);
    console.log("Deposition done.");
  }

  async withdrawal() {
    console.log("\n# Withdrawal #\n");
    const toTake = await input("Amount => ");
    if (isNaN(toTake)) throw new Error("Bad amount value.");
    const amount = parseFloat(toTake);
    this.wallet.withdrawal(amount);
    console.log("Withdrawal done.");
  }

  balance() {
    console.log("\n# Balance #\n");
    console.log(this.wallet.balance());
  }

  transactionHistory() {
    console.log("\n# Transaction history #\n");
    console.log(this.wallet.history());
  }

  async enterBeforeNext(callback) {
    callback && (await callback());
    await input("\nType enter to continue");
  }

  async handler() {
    console.clear();
    this.getBanner();
    this.getChoices();
    await this.getChoice();

    switch (this.choice) {
      case 1:
        return await this.deposition();
      case 2:
        return await this.withdrawal();
      case 3:
        return this.balance();
      case 4:
        return this.transactionHistory();
      default:
        console.log("Goodbye !");
    }
  }
}
