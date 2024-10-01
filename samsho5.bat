REM M ROM
neo-cmc samsho5.cslot1_audiocrypt.dec 0 270-m1.m1 1 270 M

REM P ROM
pswap.py  samsho5.cslot1_maincpu.dec prom
fsplit.py prom 524288

copy /b /y prom.01+prom.02+prom.13+prom.06+prom.07+prom.12+prom.09+prom.16 270-p1.p1
copy /b /y prom.15+prom.08+prom.05+prom.14+prom.11+prom.04+prom.03+prom.10 270-p2.sp2

del prom.*

REM S ROM
REM neo-cmc samsho5.cslot1_fixed.dec 0 270-s1.s1 1 270 S

REM V ROM
neo-cmc samsho5.cslot1_ymsnd.dec 0 vrom 1 270 V
romcutter.exe vrom 270-v1.v1 0 800000
romcutter.exe vrom 270-v2.v2 800000 800000

del vrom
