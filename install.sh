#!/bin/bash

set -eu

cd "$(dirname "$0")"

basedir="$(git rev-parse --show-toplevel)"

for dotfile in dot_* ; do

	link=~/".${dotfile#dot_}"
	echo "symlink from \"$dotfile\" to \"$link\"."

	# リンク作成を試みる
	ln -s "$basedir/$dotfile" "$link" 2> /dev/null \
		&& echo "success." \
		&& continue

	# リンク済み
	[ "$basedir/$dotfile" -ef "$link" ] && {
		echo "already linked."
		continue
	}

	# 既存ファイルあり
	echo "there exists another \"$link\" file, skip."

done
