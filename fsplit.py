import sys
import os
import io

import math
import binascii

#メイン処理
def main(sourcefile,splitsize,outfile):
	print(sourcefile)
	crc32 = get_crc32(sourcefile)
	print(crc32)

	#入力ファイル
	with open(sourcefile, mode='rb') as fi:
		
		filesize = os.path.getsize(sourcefile)
		
		basename = os.path.basename(outfile)
		split_max = math.ceil(filesize / splitsize)

		for i in range(split_max):
			outfile_name = basename + "." + str(i+1).zfill(2)
			print(outfile_name)
			split_file = outfile_name

			with open(split_file, mode='wb') as fo:
				data = fi.read(splitsize)
				fo.write(data)

			crc32 = get_crc32(split_file)
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
		sourcefile = "prom"
		splitsize = int("524288")
		outfile = "prom"

	else:
		sourcefile = sys.argv[1]
		splitsize = int(sys.argv[2])
		#outfile = sys.argv[3]
		outfile = sourcefile

	main(sourcefile,splitsize,outfile)
