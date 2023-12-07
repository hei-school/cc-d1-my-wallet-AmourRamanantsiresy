#!/bin/bash

source wallet-handler.sh
source transaction.sh
source wallet.sh

echo 10000 >amount
echo "" >transactions

while true; do
    get_banner
    if [[ $(get_current_choice) == 5 ]]; then
        break
    fi
    if [[ $(get_login_attempt) == 3 ]]; then
        break
    fi
    if [[ $(get_is_authenticated) == false ]]; then
        login
    else
        handler
        if [[ $(get_current_choice) != 5 ]]; then
            echo ""
            echo "Type enter to continue"
            read
        fi
    fi
done
