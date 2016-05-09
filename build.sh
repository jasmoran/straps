#!/usr/bin/env bash

./bin/v9 src/v9.v9 asm_out/v99.asm &&
nasm -f elf64 -o bin/v99.o asm_out/v99.asm &&
gcc -m64 -o bin/v99 bin/v99.o &&
rm bin/v99.o

# ./bin/v99 src/v9.v9 asm_out/v99t.asm &&
# nasm -f elf64 -o bin/v99t.o asm_out/v99t.asm &&
# gcc -m64 -o bin/v99t bin/v99t.o &&
# rm bin/v99t.o &&
# diff asm_out/v99.asm asm_out/v99t.asm | head
