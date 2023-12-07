from deposition import Deposition
from withdrawal import Withdrawal

class Wallet:
    def __init__(self, current_amount):
        self.current_amount = current_amount
        self.transaction_history = []

    def deposit(self, amount):
        if amount > 0:
            self.current_amount += amount
            self.transaction_history.append(Deposition(amount))
        else:
            raise ValueError("The amount must be a number greater than zero.")

    def withdrawal(self, amount):
        if amount > self.current_amount or self.current_amount == 0:
            raise ValueError("You don't have enough money.")
        elif amount <= 0:
            raise ValueError("The amount must be a number greater than zero.")
        else:
            self.current_amount -= amount
            self.transaction_history.append(Withdrawal(amount))

    def balance(self):
        return f"{self.current_amount}Ar"

    def history(self):
        return "\n".join(str(transaction) for transaction in self.transaction_history)