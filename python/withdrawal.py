from transaction import Transaction

class Withdrawal(Transaction):
    def __init__(self, amount):
        super().__init__(amount, "Withdrawal")