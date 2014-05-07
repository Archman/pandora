#!/bin/bash
#
# convert .eps to .pdf
# Usage: epstopdfall.sh epsfiles
#   if no epsfiles given, then all epsfile in current dir will be converted.
#
# Author: Tong Zhang
# Date: 10:17, Apr. 9th, 2013
#

cnt=0
if [[ $# -eq 0 ]] 
then
	for i in `ls *.eps`
	do 
		cnt=$((cnt+1))
		echo -e "converting $i\t--->\t${i%%.eps}.pdf"
		epstopdf $i
	done
else
	for i
	do
		cnt=$((cnt+1))
		echo -e "converting $i\t--->\t${i%%.eps}.pdf"
		epstopdf $i
	done
fi
echo "${cnt} files converted."
