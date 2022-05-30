#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <PathToSort>"
    exit 1
fi

MoveOneByOne() 
{
    for item in $(ls $1)
    do
        itemPath="`realpath $1`/$item"
        case "$(file -b --mime-type $itemPath)" in 
        "image/jpeg"|"image/png")
            mv $itemPath "$(realpath $1)/Afbeeldingen/`basename $item`"
        ;;
        esac
    done
}

MoveUsingFind() 
{
    find $1 -maxdepth 1 -exec sh -c 'case "$(file -b --mime-type $1)" in "image/jpeg"|"image/png") mv "$1" "`dirname $(realpath $1)`/Afbeeldingen/`basename $1`" ;; esac' _ {} \;
}

AfbeeldingenPath="`realpath $1`/Afbeeldingen"

if [[ ! -e $AfbeeldingenPath ]]; then
    mkdir $AfbeeldingenPath
fi

MoveOneByOne $1
