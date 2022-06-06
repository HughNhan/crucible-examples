#!/bin/bash
while getopts "h:r" arg; do
  case $arg in
    h)
      echo "usage" 
      ;;
    r)
      get_result="true"
      echo $get_result
      ;;
  esac
done

if [ "$get_result" ==  "true" ];  then
    echo crucible get result --run $2
    crucible get result --run $2 > /tmp/xxxyyy
else
    if [ -f $1/run/result-summary.txt ]; then
        cp $1/run/result-summary.txt  /tmp/xxxyyy
    else
        echo "no $1/run/result-summary.txt"
        exit
    fi
fi

grep -e "common params" -e tag  -e param -e sample -e "primary period-id" -e result  /tmp/xxxyyy
