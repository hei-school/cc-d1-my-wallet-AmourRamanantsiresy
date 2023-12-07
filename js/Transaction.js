export class Transaction {
  constructor(amount, type) {
    this.date = new Date();
    this.amount = amount;
    this.type = type;
  }

  toString() {
    return `${this.date.toISOString()} || ${this.amount}Ar || ${this.type}`;
  }
}
