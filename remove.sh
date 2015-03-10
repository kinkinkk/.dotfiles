#!/bin/bash
CARRENT_DIR=`dirname $0`

if [ -e ${CARRENT_DIR}/.zsh ]; then
    
    for i in ${CARRENT_DIR}/.* ; do
	[ -d "$i" ] || [ -f "$i"  ] || continue
	if test ${i/${CARRENT_DIR}\//""} != ".git" && test ${i/${CARRENT_DIR}\//""} !=  "." && test ${i/${CARRENT_DIR}\//""} != ".." && test ${i/${CARRENT_DIR}\//""} != ".gitignore" ; then 
	    rm ~/${i/${CARRENT_DIR}\//""}
	    echo ${i/${CARRENT_DIR}\//""}" -> removed symbolic link"
	fi
    done
    rm -rf ${CARRENT_DIR}/.zsh
    
else
    echo "no proc"
fi
