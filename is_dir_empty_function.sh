#!/bin/sh

# ==============================================================================
#   機能
#     第1引数に指定されたディレクトリが空か否かをチェックする
#   構文
#     . is_dir_empty_function.sh
#     IS_DIR_EMPTY "DIR"
#
#   Copyright (c) 2004-2017 Yukio Shiiya
#
#   This software is released under the MIT License.
#   https://opensource.org/licenses/MIT
# ==============================================================================

######################################################################
# 関数定義
######################################################################
# 指定されたディレクトリが空か否かのチェック
IS_DIR_EMPTY() {
	# 引数のチェック
	if [ $# -ne 1 ];then
		return 1
	fi
	dir="$1"

	# 指定されたディレクトリのチェック
	if [ ! -d "${dir}" ];then
		return 1
	fi

	# 指定されたディレクトリが空か否かのチェック
	contents_count=`ls -a -1 "${dir}" | grep -v -e "^\.$" -e "^\.\.$" | wc -l`
	if [ ${contents_count} -eq 0 ];then
		return 0
	else
		return 1
	fi
}

