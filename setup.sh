#!/bin/bash
CARRENT_DIR=`dirname $0`

if [ -e ${CARRENT_DIR}/.zsh ]; then
    echo "no proc"
else
    mkdir -p ${CARRENT_DIR}/.zsh
    git clone https://github.com/robbyrussell/oh-my-zsh.git ${CARRENT_DIR}/.zsh/.oh-my-zsh

    git clone https://github.com/zsh-users/zaw.git ${CARRENT_DIR}/.zsh/.zaw
    
    for i in ${CARRENT_DIR}/.* ; do
	[ -d "$i" ] || [ -f "$i"  ] || continue
	if test ${i/${CARRENT_DIR}\//""} != ".git" && test ${i/${CARRENT_DIR}\//""} !=  "." && test ${i/${CARRENT_DIR}\//""} != ".." && test ${i/${CARRENT_DIR}\//""} != ".gitignore" ; then 
	    ln -s "$i" ~/${i/${CARRENT_DIR}\//""}
	    echo ${i/${CARRENT_DIR}\//""}" -> created symbolic link"
	fi
    done
fi
