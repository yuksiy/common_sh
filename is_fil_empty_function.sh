#!/bin/sh

# ==============================================================================
#   機能
#     第1引数に指定されたファイルが空か否かをチェックする
#   構文
#     . is_fil_empty_function.sh
#     IS_FIL_EMPTY "FILE"
#
#   Copyright (c) 2011-2017 Yukio Shiiya
#
#   This software is released under the MIT License.
#   https://opensource.org/licenses/MIT
# ==============================================================================

######################################################################
# 関数定義
######################################################################
# 指定されたファイルが空か否かのチェック
IS_FIL_EMPTY() {
	# 引数のチェック
	if [ $# -ne 1 ];then
		return 1
	fi
	file="$1"

	# 指定されたファイルのチェック
	if [ ! -f "${file}" ];then
		return 1
	fi

	# 指定されたファイルが空か否かのチェック
	file_size=`wc -c "${file}" | awk '{print $1}'`
	if [ ${file_size} -eq 0 ];then
		return 0
	else
		return 1
	fi
}

