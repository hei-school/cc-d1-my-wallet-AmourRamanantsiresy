from datetime import datetime

class Transaction:
    def __init__(self, amount, type):
        self.date = datetime.now()
        self.amount = amount
        self.type = type

    def __str__(self):
        return f'{self.date.isoformat()} || {self.amount}Ar || {self.type}'