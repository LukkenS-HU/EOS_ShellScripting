#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <PathToConvert>"
    exit 1
fi

for item in $(ls $1)
do
    itemPath="`realpath $1`/$item"
    case "$(file -b --mime-type $itemPath)" in 
    image/png)
        # This image already is a PNG!
    ;;
    image/*)
        itemBaseName=`basename $itemPath`
        outputFileName="${itemBaseName%.*}.png"
        
        echo "Converting '$item'..."
        
        convert -size 128x128 -resize 128x128 $itemPath $outputFileName
    ;;
    *)
        # Not an image.
    ;;
    esac
done
