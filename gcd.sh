#!/usr/bin/bash

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
                exit 0
            elif test $large -lt $(($tmp+$small)); then
                euclid $small $(($large - $tmp))
            fi
        done
    fi
}

euclid $1 $2
export -f euclid
