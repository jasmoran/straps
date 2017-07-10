#!/usr/bin/env bash

nasm -f elf64 -o bin/v1.o src/v1.asm &&
ld -m elf_x86_64 -o bin/v1 bin/v1.o &&
rm bin/v1.o &&

./bin/v1 < src/v2.v1 > asm_out/v2.asm &&
nasm -f elf64 -o bin/v2.o asm_out/v2.asm &&
ld -m elf_x86_64 -o bin/v2 bin/v2.o &&
rm bin/v2.o &&

./bin/v2 < src/v3.v2 > asm_out/v3.asm &&
nasm -f elf64 -o bin/v3.o asm_out/v3.asm &&
ld -m elf_x86_64 -o bin/v3 bin/v3.o &&
rm bin/v3.o &&

./bin/v3 < src/v4.v3 > asm_out/v4.asm &&
nasm -f elf64 -o bin/v4.o asm_out/v4.asm &&
ld -m elf_x86_64 -o bin/v4 bin/v4.o &&
rm bin/v4.o &&

./bin/v4 < src/v5.v4 > asm_out/v5.asm &&
nasm -f elf64 -o bin/v5.o asm_out/v5.asm &&
ld -m elf_x86_64 -o bin/v5 bin/v5.o &&
rm bin/v5.o &&

./bin/v5 < src/v6.v5 > asm_out/v6.asm &&
nasm -f elf64 -o bin/v6.o asm_out/v6.asm &&
ld -m elf_x86_64 -o bin/v6 bin/v6.o &&
rm bin/v6.o &&

./bin/v6 < src/v7.v6 > asm_out/v7.asm &&
nasm -f elf64 -o bin/v7.o asm_out/v7.asm &&
ld -m elf_x86_64 -o bin/v7 bin/v7.o &&
rm bin/v7.o &&

# ./bin/v7 < src/v7.v7 > asm_out/v77.asm &&
# nasm -f elf64 -o bin/v77.o asm_out/v77.asm &&
# gcc -m64 -o bin/v77 bin/v77.o &&
# rm bin/v77.o

./bin/v7 < src/v8.v7 > asm_out/v8.asm &&
ruby fun_name.rb asm_out/v8.asm >> asm_out/v8.asm &&
nasm -f elf64 -o bin/v8.o asm_out/v8.asm &&
ld -m elf_x86_64 -o bin/v8 bin/v8.o &&
rm bin/v8.o &&

./bin/v8 src/v9.v8 asm_out/v9.asm &&
nasm -f elf64 -o bin/v9.o asm_out/v9.asm &&
ld -m elf_x86_64 -o bin/v9 bin/v9.o &&
rm bin/v9.o &&

./bin/v9 src/v9.v9 asm_out/v99.asm &&
nasm -f elf64 -o bin/v99.o asm_out/v99.asm &&
ld -m elf_x86_64 -o bin/v99 bin/v99.o &&
rm bin/v99.o

# ./bin/v99 src/v9.v9 asm_out/v99t.asm &&
# nasm -f elf64 -o bin/v99t.o asm_out/v99t.asm &&
# gcc -m64 -o bin/v99t bin/v99t.o &&
# rm bin/v99t.o &&
# diff asm_out/v99.asm asm_out/v99t.asm | head
