#!/bin/bash
#==========================================================================
#
#          FILE:  creat_temp.sh
# 
#         USAGE:  ./creat_temp.sh path
# 
#   DESCRIPTION:  create tempfile 
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Tong Zhang (), tzhang@sinap.ac.cn
#       COMPANY:  FEL physics Group, SINAP
#       VERSION:  1.0
#       CREATED:  03/04/2011 09:34:15 PM CST
#      REVISION:  ---
#==========================================================================

temppath=${1:-/tmp/${0##*/}.$$}
mkdir.sh ${temppath}
