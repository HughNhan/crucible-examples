#!/bin/bash
#
# Retag the blob
#
oldstr="run-std-0-"
newstr="run-tues-"
result=$(echo $1 | sed "s/$oldstr/$newstr/g")
echo "Original name :  $1"
echo "Replaced name :  $result"
mv $1 $result
