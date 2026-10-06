#!/bin/bash

set -eu

cd "$(dirname "$0")"

for dotfile in dot_* ; do

	link=~/".${dotfile#dot_}"
	echo "symlink from \"$dotfile\" to \"$link\"."

	# リンク先ファイルは無い
	[ ! -e "$dotfile" ] && {
		ln -s "$dotfile" "$link"
		echo "success."
		continue
	}

	# リンク済み
	[ "$(readlink -f "$dotfile")" = "$(readlink -f "$link")" ] && {
		echo "already linked."
		continue
	}

	# 既存ファイルあり
	echo "there exists another \"$link\" file, skip."

done
