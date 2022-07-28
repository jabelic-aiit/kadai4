#!/usr/bin/bash

# 同階層のgcd.hをimport
source gcd.sh

assert(){
    expected="$1"
    input1="$2"
    input2="$3"
    # actual=`zsh gcd.sh "$input1" "$input2"`
    actual=`euclid "$input1" "$input2"`
    if [ "$actual" = "$expected" ]; then
        echo "$input1, $input2 => $actual"
    else
        echo "$input1, $input2 => $expected expected, but got $actual"
        exit 1
    fi
}

assert 11 121 33
assert 1 121 31
assert 6 12 18
assert 5 25 95
echo "done."
