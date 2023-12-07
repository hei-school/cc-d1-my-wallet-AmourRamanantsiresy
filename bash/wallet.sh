#!/bin/bash

source transaction.sh

deposit() {
    current_amount=$(cat amount)
    if [[ $1 -gt 0 ]]; then
        ((current_amount += $1))
        echo $current_amount >amount
        transaction=$(create_deposition "$amount")
        echo "$transaction" >>transactions
        echo "Deposition done.
        "
    else
        echo "The amount must be a number greater than zero."
    fi
}

take() {
    current_amount=$(cat amount)
    amount=$1
    if [[ amount -gt current_amount ]]; then
        echo "You don't have enough money."
    fi
    if ((amount < 0)); then
        echo "The amount must be a number greater than zero."
    else
        ((current_amount -= amount))
        echo $current_amount >amount
        transaction=$(create_withdrawal "$amount")
        echo "$transaction" >>transactions
        echo "Withdrawal done.
        "
    fi
}

balance() {
    cat amount
}

history() {
    cat transactions
}
