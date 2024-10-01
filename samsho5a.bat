REM P ROM
pswap.py  samsho5a.cslot1_maincpu.dec prom
fsplit.py prom 524288

copy /b prom.01+prom.02+prom.13+prom.06+prom.07+prom.12+prom.09+prom.16 p1.bin
copy /b prom.15+prom.08+prom.05+prom.14+prom.11+prom.04+prom.03+prom.10 p2.bin

del prom.*

powershell Compress-Archive p1.bin,p2.bin -DestinationPath  samsho5a.zip

del p1.bin p2.bin
