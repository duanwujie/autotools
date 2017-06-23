#!/bin/bash

function formatSinglefile {
	uncrustify -c uncrustify_c.cfg  -f $1> $1.format
	if [ $? -ne 0 ]; then
		rm -f ${1}.format
		echo -e "\x1B[1;31mFormat file $1 failed.\x1B[m"
	else
		mv -f $1.format $1
	fi
}

function formatDirFiles {
	find $1 -regex '.*/.*\.\(c\|cpp\|h\)$'  |
	while read filename
	do
		formatSinglefile $filename
	done
}



if [ $# = 1 ]; then
	if [ -f "$1" ]; then
		formatSingleFile "$1"
	elif [ -d "$1" ]; then
		echo "aaa"
		formatDirFiles "$1"
	fi
else
	formatDirFiles .
fi
