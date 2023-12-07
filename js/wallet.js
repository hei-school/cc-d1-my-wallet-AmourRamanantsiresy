import { Deposition } from "./Deposition.js";
import { Withdrawal } from "./Withdrawal.js";

export class Wallet {
  transactionHistory = [];

  constructor(currentAmount) {
    this.currentAmount = currentAmount;
  }

  deposit(amount) {
    if (amount > 0) {
      this.currentAmount += amount;
      this.transactionHistory.push(new Deposition(amount));
    } else {
      throw new Error("The amount must be a number greater than zero.");
    }
  }

  withdrawal(amount) {
    if (amount > this.currentAmount || this.currentAmount === 0) {
      throw new Error("You don't have enough money.");
    } else if (amount <= 0) {
      throw new Error("The amount must be a number greater than zero.");
    } else {
      this.currentAmount -= amount;
      this.transactionHistory.push(new Withdrawal(amount));
    }
  }

  balance() {
    return `${this.currentAmount}Ar`;
  }

  history() {
    return this.transactionHistory?.map((e) => e.toString())?.join("\n");
  }
}
