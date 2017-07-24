#!/bin/sh

# ==============================================================================
#   機能
#     YES かNO かを問い合わせる
#   構文
#     . yesno_function.sh
#     YESNO
#
#   Copyright (c) 2004-2017 Yukio Shiiya
#
#   This software is released under the MIT License.
#   https://opensource.org/licenses/MIT
# ==============================================================================

######################################################################
# 関数定義
######################################################################
# 処理継続確認
YESNO() {
	printf "\007(y/n): "
	while :
	do
		read reply <&1
		case "${reply}" in
			[Yy])	return 0;;
			[Nn])	return 1;;
			*)
				printf "\007(y/n): "
				continue
				;;
		esac
	done
}

