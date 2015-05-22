#!/bin/bash
#==========================================================================
#
#          FILE:  testmkdir.sh
# 
#         USAGE:  ./testmkdir.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Tong Zhang (), tzhang@sinap.ac.cn
#       COMPANY:  FEL physics Group, SINAP
#       VERSION:  1.0
#       CREATED:  03/02/2011 10:33:42 AM CST
#      REVISION:  ---
#==========================================================================
j=0
while [ $# -gt 0 ]
do
	let j++
	newdir=$1
	i=1
	while [ -e ${newdir} ]
	do
		newdir=$1_${i}
		let i++
	done
	mkdir -p ${newdir}
	echo "mkdir ${newdir} succeed."
	shift
done
#echo "Total: $j directories created."
