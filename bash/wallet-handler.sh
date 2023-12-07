#!/bin/bash

source wallet.sh

is_authenticated=false
login_attemps=0
choice=-1

get_current_choice() {
    echo "$choice"
}

get_is_authenticated() {
    echo $is_authenticated
}

get_login_attempt() {
    echo "$login_attemps"
}

get_banner() {
    value='
     __    __      _ _      _       
    / / /\ \ \__ _| | | ___| |_  
    \ \/  \/ / _` | | |/ _ \ __|
     \  /\  / (_| | | |  __/ |_
      \/  \/ \__,_|_|_|\___|\__|
      '
    echo "$value"
}

get_auth_status() {
    echo $is_authenticated
}

login() {
    (login_attemps+=1)
    echo "Username : "
    read -r username
    echo "Password : "
    read password

    expected='admin'
    if [[ "$username" == "$expected" && "$password" == "$expected" ]]; then
        is_authenticated=true
    else
        echo "Verify your credentials."
    fi
}

validate_choice_input() {
    choice=$1
    if [[ $choice =~ ^[1-5]+$ ]]; then
        echo true
    else
        echo false
    fi
}

get_choices() {
    text='
    
    Deposition : 1
    Withdrawal : 2
    Balance : 3
    Transaction history : 4
    Exit : 5

    '
    echo "$text"
}

get_choice() {
    echo "Chose :"
    read current_choice
    if [[ $(validate_choice_input "$current_choice") == true ]]; then
        choice=$current_choice
    else
        echo "Bad choice !"
    fi
}

is_number() {
    value=$1
    if [[ $value =~ ^[0-9]+$ ]]; then
        echo true
    else
        echo false
    fi
}

deposition() {
    echo "# Deposition #"
    echo 'Amount : '
    read -r amount
    if [[ $(is_number "$amount") ]]; then
        (deposit "$amount")
    else
        echo "Bad amount value."
    fi
}

withdrawal() {
    echo "# Withdrawal #"
    echo 'Amount : '
    read -r amount
    if [[ $(is_number "$amount") ]]; then
        (take "$amount")
    else
        echo "Bad amount value."
    fi
}

get_history() {
    echo "# Transaction history #"
    history
}

get_balance() {
    echo "# Balance #"
    echo ""
    balance
}

handler() {
    clear
    get_banner
    get_choices
    get_choice

    if [[ $choice == 1 ]]; then
        deposition
    fi
    if [[ $choice == 2 ]]; then
        withdrawal
    fi
    if [[ $choice == 3 ]]; then
        get_balance
    fi
    if [[ $choice == 4 ]]; then
        get_history
    fi
    if [[ $choice == 5 ]]; then
        echo "Goodbye !"
    fi
}
