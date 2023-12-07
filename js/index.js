import { WalletHandler } from "./WalletHandler.js";
import { input } from "./input.js";
import { Wallet } from "./wallet.js";

const handleError = async (callback) => {
  try {
    await callback();
  } catch (err) {
    console.log(err.message);
  }
};

const main = async () => {
  let end = false;
  const wallet = new Wallet(10_000);
  const walletHandler = new WalletHandler(wallet);

  const app = async () => {
    await walletHandler.handler();
    if (walletHandler.choice !== 5) {
      await input("\nType enter to continue");
    }
  };

  while (!end) {
    walletHandler.getBanner();
    if (walletHandler.choice === 5) break;
    if (walletHandler.loginAttempt === 3) break;
    if (!walletHandler.isAuthenticated)
      await handleError(async () => await walletHandler.login());
    else await handleError(app);
  }
};
main();
