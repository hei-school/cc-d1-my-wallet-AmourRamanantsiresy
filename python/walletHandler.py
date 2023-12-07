import re
from clear_console import clear_console

class Wallet_Handler:
  def __init__(self, wallet):
    self.wallet = wallet
    self.isAuthenticated = False;
    self.loginAttempt = 0;
    self.choice = -1;

  def get_banner(self):
    value = "\n __    __      _ _      _       \n/ / /\\ \\ \\__ _| | | ___| |_  \n\\ \\/  \\/ / _` | | |/ _ \\ __|\n \\  /\\  / (_| | | |  __/ |_\n  \\/  \\/ \\__,_|_|_|\\___|\\__|\n"
    print(value)

  def login(self):
    self.loginAttempt += 1
    username = input("Username : ")
    password = input("Password : ")
    if username == "admin" and password == "admin":
      self.isAuthenticated = True
    else :
      raise ValueError("Verify your credentials.")

  def get_choices(self):
    text = "Deposition : 1 \nWithdrawal : 2 \nBalance : 3 \nTransaction history : 4 \nExit : 5\n"
    print(text)

  def get_choice(self):
    choice = input("==> ")
    pattern = r"^[1-5]$"
    match = re.match(pattern, choice)
    if not match:
      raise ValueError("Bad choice !")
    self.choice = int(choice)

 

  def deposition(self):
    print("\n# Deposition #\n");
    toDepose = input("Amount => ");
    if not toDepose.isnumeric():
      raise ValueError("Bad amount value.");
    amount = float(toDepose);
    self.wallet.deposit(amount);
    print("Deposition done.");

  def withdrawal(self):
    print("\n# Withdrawal #\n");
    toTake = input("Amount => ");
    if not toTake.isnumeric():
      raise ValueError("Bad amount value.");
    amount = float(toTake);
    self.wallet.withdrawal(amount);
    print("Withdrawal done.");

  def balance(self):
    print("\n# Balance #\n");
    print(self.wallet.balance());

  def transactionHistory(self):
    print("\n# Transaction history #\n");
    print(self.wallet.history());

  def handler(self):
    clear_console()
    self.get_banner()
    self.get_choices()
    self.get_choice()
    
    if self.choice == 1:
      self.deposition()
    if self.choice == 2:
      self.withdrawal()
    if self.choice == 3:
      self.balance()
    if self.choice == 4:
      self.transactionHistory()
    if self.choice == 5:
      print("Goodbye !")