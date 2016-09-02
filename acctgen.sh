#!/bin/sh
###############################################
#
# Project : CS172 Homework Assignment #3
# Filename : acctgen
# Purpose : The purpose of this script is to creates a block of accounts
# with the initial password of "foobar".
#
# Usage : # ~/acctgen aLetter aStartingNumber anEndingNumber
#
# Date created : Mar 7, 2012
# Date last modified : Mar 21, 2012
#
# Author : Yu Li
#
###############################################

PARAMETER1=$1	# A letter
PARAMETER2=$2	# A starting number  
PARAMETER3=$3	# An ending number



while [ ${PARAMETER2} -le ${PARAMETER3} ]
do
	LOGIN=${PARAMETER1}${PARAMETER2}
	echo "${LOGIN}:9N4pZ.DJePzys:${PARAMETER2}:10:${LOGIN}:/export/home/${LOGIN}:/bin/csh" >> /etc/passwd 
	pwconv
	mkdir /export/home/${LOGIN}
	cp /etc/skel/local.login /export/home/${LOGIN}/.login
	cp /etc/skel/local.cshrc /export/home/${LOGIN}/.cshrc
	cp /etc/skel/local.profile /export/home/${LOGIN}/.profile
	chown -R ${PARAMETER2}:10 /export/home/${LOGIN}
	PARAMETER2=`expr $PARAMETER2 + 1`
done



