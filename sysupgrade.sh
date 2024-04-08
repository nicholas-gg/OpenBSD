#!/usr/bin/env ksh

if [ $1 ]
then
	printf '\nToo many parameters!\n\n'
	exit 1
fi

/usr/sbin/sysupgrade -ns

__PATH='/home/_sysupgrade'
set -A __FILES "$__PATH/comp??.tgz" \
	"$__PATH/game??.tgz" \
	"$__PATH/xbase??.tgz" \
	"$__PATH/xfont??.tgz" \
	"$__PATH/xserv??.tgz" \
	"$__PATH/xshare??.tgz" 

for __file in `printf '%s\n' "${__FILES[@]}"`
do 
	if [ -f $__file ]
	then
		rm -f $__file
		printf "$__file: Removed.\n"
	else
		printf "$__file: Non-existent.\n"
	fi
done

exit 0
