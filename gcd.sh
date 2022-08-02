#!/usr/bin/bash

isFullFilledArguments(){
    # 引数は2つであること
    if test -z $2 || test -z $3 ;then
        echo "Usage: ARG1 ARG2";
        exit 1
    # 引数は数字であること
    elif ! [[ $2 =~ [0-9]+ ]] || ! [[ $3 =~ [0-9]+ ]] ;then
        echo "ERROR: argument must be type number;";
        exit 1
    # 引数は自然数であること
    elif [[ $2 =~ ^-?[1-9]*[0-9](\.[0-9]+)+$ ]] || [[ $3 =~ ^-?[1-9]*[0-9](\.[0-9]+)+$ ]] ;then
        echo "ERROR: argument must be a natural number;"
        exit 1
    fi
}

euclid(){
    # -lt は <
    if test $1 -lt $2 ;then
        large=$2
        small=$1
    else
        large=$1
        small=$2
    fi
    if [[ $large != 0 ]]; then
        loops=$((1+$large/$small))
        for ((i=1 ; i<$loops ; i++))
        do
            tmp=$(($small*i))
            # -lt は <
            if test $(($tmp+$small)) -eq $large || test $tmp -eq $large; then
                echo ${small}
                exit
            elif test $large -lt $(($tmp+$small)); then
                euclid $small $(($large - $tmp))
            fi
        done
    fi
}
get_gcd(){
    isFullFilledArguments $# $1 $2
    euclid $1 $2
}

export -f get_gcd
