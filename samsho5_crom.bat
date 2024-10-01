REM CROM 
(
echo 0
echo 0
echo 800000
echo c1
echo 0
echo 1
echo 800000
echo c2
echo 800000
echo 0
echo 800000
echo c3
echo 800000
echo 1
echo 800000
echo c4
echo 1000000
echo 0
echo 800000
echo c5
echo 1000000
echo 1
echo 800000
echo c6
echo 1800000
echo 0
echo 800000
echo c7
echo 1800000
echo 1
echo 800000
echo c8
echo -1
)|tiles2crom.exe SamuraiShodown5_NGM_2.sprites.swizzled

copy /b c1+c3+c5+c7 odd
copy /b c2+c4+c6+c8 even
BSwap c B crom.bin oddeven.txt odd even
neo-cmc crom.bin 0 crom_encrypt.bin 1 270 C
BSwap d B crom_encrypt.bin oddeven.txt odd_enc even_enc

romcutter odd_enc 270-c1.c1 0 800000
romcutter odd_enc 270-c3.c3 800000 800000
romcutter odd_enc 270-c5.c5 1000000 800000
romcutter odd_enc 270-c7.c7 1800000 800000
romcutter even_enc 270-c2.c2 0 800000
romcutter even_enc 270-c4.c4 800000 800000
romcutter even_enc 270-c6.c6 1000000 800000
romcutter even_enc 270-c8.c8 1800000 800000

del c1,c2,c3,c4,c5,c6,c7,c8
del odd,even

del crom.bin
del crom_encrypt.bin
del odd_enc,even_enc
