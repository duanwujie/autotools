#!/bin/bash


find . -regex '.*/.*\.\(c\|cpp\|h\)$'  |
while read filename
do
	uncrustify -c uncrustify_c.cfg  -f ${filename}> ${filename}.format
	mv -f ${filename}.format ${filename}
done
