import { Transaction } from "./Transaction.js";

export class Withdrawal extends Transaction {
  constructor(amount) {
    super(amount, "Withdrawal");
  }
}
