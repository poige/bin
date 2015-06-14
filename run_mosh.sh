#!/bin/bash

sayHost () {
	while :; do
		myHost="$1"
		case $myHost in
			-*)	shift ;;
			*)	echo "$myHost"
				break ;;
		esac
	done
}

# It only has sense if we're on a terminal, let's make sure
tty -s || exit

# ok, now we're to distinguish between different terms

myHost=$(sayHost "$@")

[ -n "$myHost" ] && {
echo -en "\033]30;m:$myHost\007"
echo -en "\033]0;$myHost\007"
}

mosh "$@"
echo -en "\033]30;.\007"

