rm orig.asm new.asm src/language/v10.asm src/language/v10.o test1 test2 test3
straps src/language/v10.v10 test1 -k || echo 'First build failed'
echo 'Build 1 complete'
mv src/language/v10.asm orig.asm
./test1 src/language/v10.v10 test2 -k || echo 'Second build failed'
echo 'Build 2 complete'
mv src/language/v10.asm new.asm
wc -l orig.asm new.asm
./test2 src/language/v10.v10 test3
echo 'Build 3 complete'
cmp test2 test3
#diff orig.asm new.asm | head
