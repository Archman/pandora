#!/bin/bash -
#Usage: getssdata outfile
#for steady state genesis output file data extration
#
tempdir=$(creat_temp /tmp/${0##*/}.$$ | awk '{print $2}')
trap "rm -rf ${tempdir}" EXIT
outfile=${1:-rad.out}
awk '/z\[m\]/,/current/' ${outfile} | tr -d '\r' | sed "/^$/d;/[*,=,cur]/d;s/^[ ,\t]*//;1s/^/#/" >${tempdir}/zaq
awk '/current/,/\$/' ${outfile} | tr -d '\r' | sed "1d;/^$/d;s/^[ ,\t]*//" > ${tempdir}/outdata
paste ${tempdir}/zaq ${tempdir}/outdata
