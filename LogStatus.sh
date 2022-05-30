#!/bin/sh

if [[ $# -lt 3 ]]; then
    echo "Usage: $0 <DirectoryPath> <LogFile> <Command> [Parameters]"
    exit 1
fi

if [[ -e $2 ]]; then
    rm $2
fi

for item in $(ls $1)
do
    ${*:3} "$1/$item"
    echo "Result of '${*:3} $1/$item': $?" >> $2
done
