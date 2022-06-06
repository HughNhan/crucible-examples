#!/bin/bash
exec 2> /dev/null
#exec 1> summary-$1.txt

exec > >(tee -ia summary-$1.txt)


#show $1 | grep -e "primary period" | awk -F ':' '{print $2}'
#show $1 | grep -e "mean" -e "primary period" 

show $1 | grep -e mean -e "primary period" > show-summary-$1.txt

#cat /tmp/uuu

function CC {
  crucible get metric --source mpstat --type Busy-CPU --period $1 --breakout cstype=worker < dev/null
}

Counter=0
set -o pipefail
while IFS='' read -r  LinefromFile || [[ -n "${LinefromFile}" ]]; do

    ((Counter++))
    #echo "Accessing line $Counter: ${LinefromFile}"
    if [[ "$LinefromFile" =~ .*"primary".* ]]; then
        #echo "HN ${LinefromFile}"
        PP=$(echo $LinefromFile | awk -F ':' '{print $2}')
    fi

    if [[ "$LinefromFile" =~ .*"mean".* ]]; then
        echo "${LinefromFile}"
        echo -n "worker CPU "
        crucible get metric --source mpstat --type Busy-CPU --period $PP --breakout cstype=worker < /dev/null | grep "value\""
    fi

done < show-summary-$1.txt

