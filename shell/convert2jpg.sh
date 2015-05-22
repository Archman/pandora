#!/bin/bash
#
# convert eps/pdf... files to jpg format
# 
# Author: Tong Zhang
# Created: 13:46, Dec. 24th, 2012

for i #in `ls *.eps`
do
	echo $i
	gs -sDEVICE=jpeg -dNOPAUSE -r300 -dJPEGQ=100 -dBATCH -dSAFER -sOutputFile=${i%%.*}.jpg $i
	mogrify -trim -resize 1000x1000 ${i%%.*}.jpg
done
