#!/bin/bash

file=$1

if [ ! -f $file ]; then
	echo "File Not Found"
	exit 1
fi

echo "Total lines:"
wc -l $file

echo "Error Count:"
grep -i "error" $file | wc -l


#exit 1 -> error code
#wc -l -> counts the no of lines
#grep -i  -> case in sensitive search
#|wc -l  -> counts the no of lines

