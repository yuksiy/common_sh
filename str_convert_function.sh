#!/bin/sh

# ==============================================================================
#   機能
#     ・第1引数に指定された文字列中の英大文字を小文字に変換する(LowerCase)
#     ・第1引数に指定された文字列中の英小文字を大文字に変換する(UpperCase)
#   構文
#     . str_convert_function.sh
#     LowerCase "STR"
#     UpperCase "STR"
#
#   Copyright (c) 2004-2017 Yukio Shiiya
#
#   This software is released under the MIT License.
#   https://opensource.org/licenses/MIT
# ==============================================================================

######################################################################
# 関数定義
######################################################################
# 文字列中の英大文字を小文字に変換する
LowerCase() {
	# 引数のチェック
	if [ $# -ne 1 ];then
		return 1
	fi
	str=$1

	echo "${str}" | tr '[A-Z]' '[a-z]'
}

# 文字列中の英小文字を大文字に変換する
UpperCase() {
	# 引数のチェック
	if [ $# -ne 1 ];then
		return 1
	fi
	str=$1

	echo "${str}" | tr '[a-z]' '[A-Z]'
}

