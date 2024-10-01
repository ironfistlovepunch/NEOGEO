import sys
import os
import io

import binascii

#メイン処理
def main(sourcefile,outfile):
	print(sourcefile)
	crc32 = get_crc32(sourcefile)
	print(crc32)

	with open(sourcefile, mode='rb') as fi:
		
		filesize = os.path.getsize(sourcefile)
		with open(outfile, mode='wb') as fo:
			for i in range(int(filesize/2)) :
				data1 = fi.read(1)
				data2 = fi.read(1)
				outdata = data2 + data1
				fo.write(outdata)
				
	print(outfile)
	crc32 = get_crc32(outfile)
	print(crc32)

#ファイルCRC32返す
def get_crc32(sourcefile):
		with open(sourcefile, mode='rb') as fi:
			alldata = fi.read()
			crc32 = binascii.crc32(alldata)
			crc32 = '{:X}'.format(crc32)
			return crc32

#プログラム実行
if __name__ == "__main__":
	#ファイル入力
	if len(sys.argv) == 1:
		#指定がない場合
		print("入力がないよ")
		sourcefile = "samsho5.cslot1_maincpu.dec"
		outfile = "prom"

	else:
		sourcefile = sys.argv[1]
		outfile = sys.argv[2]

	main(sourcefile,outfile)
