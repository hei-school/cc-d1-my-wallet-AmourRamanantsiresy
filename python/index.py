from wallet import Wallet
from walletHandler import Wallet_Handler

def main():
    wallet = Wallet(10000)
    wallet_Handler = Wallet_Handler(wallet)
    
    while True:
        wallet_Handler.get_banner()
        if wallet_Handler.choice == 5:
            break
        if wallet_Handler.loginAttempt == 3:
            break
        if not wallet_Handler.isAuthenticated:
            wallet_Handler.login()
        else :
            wallet_Handler.handler()
            if wallet_Handler.choice != 5:
                input("\nType enter to continue")

main()