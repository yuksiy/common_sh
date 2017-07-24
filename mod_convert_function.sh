#!/bin/sh

# ==============================================================================
#   機能
#     ・第1引数に指定されたファイルモードの文字列表記を数値表記(8進数)に変換する(MOD_STR2OCT)
#   構文
#     . mod_convert_function.sh
#     MOD_STR2OCT "STR"
#
#   Copyright (c) 2004-2017 Yukio Shiiya
#
#   This software is released under the MIT License.
#   https://opensource.org/licenses/MIT
# ==============================================================================

######################################################################
# 関数定義
######################################################################
# ファイルモードの文字列表記を数値表記(8進数)に変換
MOD_STR2OCT() {
	# 引数のチェック
	if [ $# -ne 1 ];then
		return 1
	fi

	# ファイルモード文字列表記の形式チェック (「-rwxrwxrwx」形式になっているか?)
	expr "$1" : ".[r\-][w\-][Ssx\-][r\-][w\-][Ssx\-][r\-][w\-][Ttx\-]" > /dev/null
	if [ $? -ne 0 ];then
		return 1
	fi

	# 「ファイルモードの文字列表記」を一旦、
	#                                           1
	#             1   2  3  4   5  6  7   8  9  0
	#           +---+---------+---------+---------+
	#           | - | r  w  x | r  w  x | r  w  x |  4文字目のS|s … set-uid ビット
	#           | d |       s |       s |       t |  7文字目のS|s … set-gid ビット
	#           | l |       S |       S |       T |  10文字目のT|t … sticky ビット
	#           | : | (user)  | (group) | (other) |
	#           +---+---------+---------+---------+
	#            <------------- $1 -------------->
	#
	# 「ファイルモードの数値表記(2進数)」に変換する。
	#     1   1   1
	#     2   1   0   9  8  7   6  5  4   3  2  1
	#   +---+---+---+---------+---------+---------+
	#   | s | s | t | r  w  x | r  w  x | r  w  x |  12ビット目 … set-uid ビット
	#   |   |   |   | (user)  | (group) | (other) |  11ビット目 … set-gid ビット
	#   +---+---+---+---------+---------+---------+  10ビット目 … sticky ビット
	#    <---------> <--------------------------->
	#      set_id              permission
	#
	# そのためにまず、「set_id」「permission」を個々に取得する。
	# そして得られた結果を合わせて2進数としたものを8進数に変換する。
	#

	# 「set_id」の取得
	#   第1引数に指定されたファイルモードの文字列表記の4,7,10文字目だけを取り出し、
	#   「S|s|T|t」を「1」、それ以外「x|-」を「0」に変換することで取得。
	set_id=`echo $1 | cut -c 4,7,10 | sed -e "s/[SsTt]/1/g" -e "s/[x\-]/0/g"`

	# 「permission」の取得
	#   第1引数に指定されたファイルモードの文字列表記の2-10文字目だけを取り出し、
	#   「r|w|x|s|t」を「1」、それ以外「S|T|-」を「0」に変換することで取得。
	permission=`echo $1 | cut -c 2-10 | sed -e "s/[rwxst]/1/g" -e "s/[ST\-]/0/g"`

	# 得られた結果(2進数)を8進数に変換
	mod_oct=`echo "2i 8o ${set_id}${permission} p" | dc`

	# 得られた結果(8進数)を4桁の0左詰めされた8進数として出力
	echo "0000${mod_oct}" | tail -c5
}
