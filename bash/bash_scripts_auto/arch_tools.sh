#!/bin/bash

Z="compress" ; unZ="uncompress" ; Zlist=""
gz="gzip" ; ungz="gunzip" ; gzlist=""
bz="bzip2" ; unbz="bunzip2" ; bzlist=""

for arg
do
	if [ -f "$arg" ] ; then
		case "$arg" in
			*.Z)	$unZ "$arg"
				arg="$(echo $arg | sed 's/\.Z$//')"
				Zlist="$Zlist \"$arg\""
				;;
			*.gz)	$ungZ "$arg"
				arg="$(echo $arg | sed 's/\.gz$//')"
				gzlist="$gzlist \"$arg\""
				;;
			*.bz2)	$unbz "$arg"
				arg="$(echo $arg | sed 's/\.bz$//')"
				echo "arg:" $arg
				bzlist="$bzlist \"$arg\""
				echo "bzlist" $bzlist
				;;
		esac
	fi

	newarg="${newargs:-""} $arg"
	#echo "newargs:" $newargs
done

case $0 in
	*zcat* ) cat $newargs ;;
	*zmore* ) more $newargs ;;
	*zgrep* ) grep $newargs ;;
	* ) echo "$0: unknown options" >&2
		exit 1
esac

if [ -n "Zlist" ] ; then
	eval $Z $Zlist
fi

if [ ! -z "gzlist" ] ; then
	eval $gz $gzlist
fi

if [ ! -z "bzlist" ] ; then
	eval $bz $bzlist
fi
