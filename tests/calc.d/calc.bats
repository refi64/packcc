#!/usr/bin/env bats

load $TESTDIR/utils.sh

@test "Testing calc.d - generation" {
    cp -f ../src/examples/calc.peg calc.d/parser.peg  ## NOTE: Copy is adopted instead of using a link, considering MinGW.
    test_generate calc.d parser.peg
}

@test "Testing calc.d - compilation" {
    "${CC:-cc}" calc.d/parser.c -o calc.d/parser
}

@test "Testing calc.d - run" {
    run_for_input calc.d/input.txt
}
