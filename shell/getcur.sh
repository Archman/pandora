#!/bin/bash
#==========================================================================
#
#          FILE:  getcur.sh
# 
#         USAGE:  ./getcur.sh 
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
#       CREATED:  02/28/2011 08:23:57 PM CST
#      REVISION:  12/09/2012 10:56:00 PM CST
#==========================================================================

function Get_Current()
{

#This function is used to get current data from TDP file.
#Usage: Get_Current OUTFILE
#	OUTFILE: name of TDP data file
#Return: current list in $(pwd)
infile=$1	
GREP=$(which grep)
sepe=$(${GREP} sepe ${infile} | awk '{print $1}')
awk '/current/' ${infile} | awk -v sepe=${sepe} '{print (NR-1)*sepe,$1}'
}

Get_Current $1
