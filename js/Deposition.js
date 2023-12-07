import { Transaction } from "./Transaction.js";

export class Deposition extends Transaction {
  constructor(amount) {
    super(amount, "Deposition");
  }
}
