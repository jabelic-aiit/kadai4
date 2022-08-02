#!/usr/bin/bash

# 同階層のgcd.hをimport
source gcd.sh

assert(){
    expected="$1"
    input_1="$2"
    input_2="$3"
    actual=`get_gcd "$input_1" "$input_2"`
    if [ "$actual" = "$expected" ]; then
        echo "$input_1, $input_2 => $actual"
    else
        echo "$input_1, $input_2 => $expected expected, but got $actual"
        # exit 1
    fi
}

assert 11 121 33
assert "ERROR: argument must be a natural number;" 12.1 3.3
assert "ERROR: argument must be a natural number;" 12.1 33
assert "ERROR: argument must be a natural number;" 121 3.3
assert 1 121 31
assert 6 12 18
assert 5 25 95
assert 1 25 "98"
assert "ERROR: argument must be type number;" "hoge" 98
assert "ERROR: argument must be type number;" 25 "huga"
assert "Usage: ARG1 ARG2" 100
assert 9 999 9999999
assert 9 999 99999999
echo "done."
