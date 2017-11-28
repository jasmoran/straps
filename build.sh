#!/usr/bin/env bash

./bin/v1010 src/language/v10.v10 asm_out/straps.asm &&
nasm -f elf64 -o bin/straps.o asm_out/straps.asm &&
ld -m elf_x86_64 -o bin/straps bin/straps.o &&
rm bin/straps.o &&
./run_test -q
