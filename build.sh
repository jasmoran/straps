#!/usr/bin/env bash

./bin/v9 src/v10.v9 asm_out/v10.asm &&
nasm -f elf64 -o bin/v10.o asm_out/v10.asm &&
ld -m elf_x86_64 -o bin/v10 bin/v10.o &&
rm bin/v10.o &&

./bin/v10 src/language/v10.v10 asm_out/v1010.asm &&
nasm -f elf64 -o bin/v1010.o asm_out/v1010.asm &&
ld -m elf_x86_64 -o bin/v1010 bin/v1010.o &&
rm bin/v1010.o &&
./run_test -q
