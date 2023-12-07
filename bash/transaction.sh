#!/bin/bash

get_current_datetime() {
    date +"%Y-%m-%dT%H:%M:%S"
}

create_transaction() {
    local amount=$1
    local type=$2
    date=$(get_current_datetime)

    echo "$date || $amount Ar || $type"
}

create_deposition() {
    local amount=$1
    value=$(create_transaction "$amount" "Deposition")
    echo "$value"
}

create_withdrawal() {
    local amount=$1
    value=$(create_transaction "$amount" "Withdrawal")
    echo "$value"
}
