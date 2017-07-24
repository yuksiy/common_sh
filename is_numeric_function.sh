#!/bin/sh

# ==============================================================================
#   機能
#     第1引数に指定された文字列が数値か否かをチェックする
#   構文
#     . is_numeric_function.sh
#     IS_NUMERIC "STR"
#
#   Copyright (c) 2004-2017 Yukio Shiiya
#
#   This software is released under the MIT License.
#   https://opensource.org/licenses/MIT
# ==============================================================================

######################################################################
# 関数定義
######################################################################
# 指定された文字列が数値か否かのチェック
IS_NUMERIC() {
	# 引数のチェック
	if [ $# -ne 1 ];then
		return 1
	fi
	str=$1

	# 指定された文字列が数値か否かのチェック
	expr "${str}" + 1 > /dev/null 2>&1
	if [ $? -lt 2 ];then
		return 0
	else
		return 1
	fi
}
