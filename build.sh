#!/usr/bin/env bash

./bin/v9 src/v10.v9 asm_out/v10.asm &&
nasm -f elf64 -o bin/v10.o asm_out/v10.asm &&
gcc -m64 -o bin/v10 bin/v10.o &&
rm bin/v10.o
rm bin/v10.o &&

./run_test -q test/**/*
