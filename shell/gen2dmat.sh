#!/bin/bash
#
# generate slices from *.tdp.out file
#
# Author: Tong ZHANG
# Time: 16:25, Mar. 17th, 2013
#
#
outfile=${1:-rad.tdp.out}

pwdir=$(pwd)
GREP=$(which grep)
zentri=$(${GREP} -m1 entri ${outfile} | awk '{print $1}')
stotal=$(${GREP} -m1 histo ${outfile} | awk '{print $1}')
slicedir="${pwdir}/slices/"

[ ! -e ${slicedir} ] && mkdir ${slicedir}

for ((islice=1;islice<=${stotal};islice++))
do
	getdp_s ${outfile} ${slicedir}/slice${islice} ${islice}
done
