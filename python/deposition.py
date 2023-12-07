from transaction import Transaction

class Deposition(Transaction):
    def __init__(self, amount):
        super().__init__(amount, "Deposition")