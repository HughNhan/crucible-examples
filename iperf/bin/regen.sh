#!/bin/bash
#
# Usage: regen --l <label>
#  Re-generate summary by label
#

longopts="label:,help"
opts=$(getopt -q -o "" --longoptions "$longopts" -n "getopt.sh" -- "$@");
if [ $? -ne 0 ]; then
    echo "Unrecognized option specified"
    exit
fi

LABEL=""
eval set -- "$opts";
echo "opts after: $@"
while true; do
    case "$1" in
        --label)
            shift;
            LABEL=$1
            echo got tag=$TAG
            shift;
            ;;
        --)
            shift;
            break
            ;;
        --help)
            shift;
            echo $0 "[--label <tag_string>] "
            exit
            ;;
        *)
            echo "Invalid option: $1"
            exit
    esac
done

if [ "$LABEL" == "" ]; then
    echo $0 "[--label <tag_string>]"
    exit
fi

echo "LABEL=$LABEL"

NAMES=$(find . -name run-$LABEL\* -print)

for dir in $NAMES; do
    if [ -d $dir ]; then
        echo $dir
        pushd $dir
            pwd
            mkdir old
            mv sum* old/
            mv show* old/
            gen-summary
        popd
    fi
done

