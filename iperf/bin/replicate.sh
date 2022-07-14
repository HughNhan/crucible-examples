#!/bin/bash
#
# Replicate SRC dir to under DST dir for a number of depth level
# For example: replicate --src MY_DIR --dst TO_DIR  --depth 2
#
#           TO_DIR\
#               MY_DIR
#                   level_1 file
#                   level_1_dir/
#                       level_2_files
#
#
#
longopts="src:,dst:,depth:,help"
opts=$(getopt -q -o "" --longoptions "$longopts" -n "getopt.sh" -- "$@");
if [ $? -ne 0 ]; then
    echo "Unrecognized option specified"
    exit
fi

src=""
dst=""
depth=1
LABEL=""

eval set -- "$opts";
while true; do
    case "$1" in
        --src)
            shift;
            src=$1
            shift;
            ;;
        --dst)
            shift;
            dst=$1
            shift;
            ;;
        --depth)
            shift;
            depth=$1
            shift;
            ;;
        --)
            shift;
            break
            ;;
        --help)
            shift;
            echo $0 "[--label <tag_string>]  <--topo TOPO>"
            exit
            ;;
        *)
            echo "Invalid option: $1"
            exit
    esac
done

echo $src $dst

if [ "$src"  == "" ] || [ "$dst" == "" ]; then
    echo $0 "[--src <src> --dst <dst>  --depth <n>"
    exit
fi

find $src/ -maxdepth $depth -type d -exec mkdir -p $dst/{} \;
find $src/ -maxdepth $depth -type f -exec cp {} $dst/{} \;

