#!/bin/sh

# ==============================================================================
#   機能
#     第1引数に指定された文字列がIPアドレスの規則に従っているか否かをチェックする
#   構文
#     . is_ipaddr_function.sh
#     IS_IPADDR "STR"
#
#   Copyright (c) 2004-2017 Yukio Shiiya
#
#   This software is released under the MIT License.
#   https://opensource.org/licenses/MIT
# ==============================================================================

######################################################################
# 関数定義
######################################################################
. is_numeric_function.sh

# 指定された文字列がIPアドレスか否かのチェック
IS_IPADDR() {
	# 引数のチェック
	if [ $# -ne 1 ];then
		return 1
	fi
	str=$1

	# 指定された文字列がIPアドレスか否かのチェック
	#octet1=`echo ${str} | awk -F'.' '{print $1}'`
	#octet2=`echo ${str} | awk -F'.' '{print $2}'`
	#octet3=`echo ${str} | awk -F'.' '{print $3}'`
	#octet4=`echo ${str} | awk -F'.' '{print $4}'`
	set -- `echo ${str} | sed 's/\./ /g'`
	if [ $# -ne 4 ];then
		return 1
	fi

	for i in $*
	do
		IS_NUMERIC "${i}"
		if [ $? -ne 0 ];then
			return 1
		fi
		if [ \( ${i} -lt 0 \) -o \( ${i} -gt 255 \) ];then
			return 1
		fi
	done

	return 0
}

