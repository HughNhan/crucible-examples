#!/bin/bash

taken=1
function skip_bitrate_5_10 {
    while IFS='' read -r  LinefromFile || [[ -n "${LinefromFile}" ]]; do
        #echo "Accessing line $Counter: ${LinefromFile}"
        if [[ "$LinefromFile" =~ "10G"  || "$LinefromFile" =~ "5G" ]]; then
            taken=0
            continue
        else
            if [ $taken == 0  ]; then
                taken=1;
                continue
            fi
        fi

        echo "$LinefromFile"
    done < $1

}

skip_bitrate_5_10 $1
