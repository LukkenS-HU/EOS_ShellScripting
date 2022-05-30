#!/bin/sh

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <ProgramPath> [Parameters]"
    exit 1
fi

if [[ ! -e $1 ]]; then
    echo "File '$1' does not exist!"
    exit 2
fi

fileBaseName=`basename $1`

# Deze 'shell parameter expansion' zoekt vanaf het einde van de bestandsnaam naar het eerste '.' karakter.
fileExtension="${fileBaseName##*.}"

case $fileExtension in
    "py")
        python3 $*
    ;;
    "sh")
        bash $*
    ;;
    "cc")
        cat $*
    ;;
    *)
        echo "Unsupported file extension '$fileExtension'."
        exit 3
    ;;
esac
