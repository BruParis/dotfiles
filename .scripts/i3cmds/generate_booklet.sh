#!/bin/bash

echo $1
echo $2

if [ "$#" -eq 1 ]; then
    INPUT_PATH=$PWD/$1
elif [ "$#" -eq 2 ] && [ "$1" = "-P" ]; then
    PRINT_OPTION=true
    INPUT_PATH=$PWD/$2
else
    echo "USAGE: generate_booklet.sh (-P) file_path"
    echo "    -P -> print booklet option"
    exit 0
fi

GENERIC_PATH=$(echo $INPUT_PATH | sed 's/.pdf//')

pdfbook $INPUT_PATH

BOOK_PATH=$GENERIC_PATH"-book.pdf"
FINAL_PATH=$GENERIC_PATH"-final.pdf"
pdftk A=$BOOK_PATH shuffle AoddNorth AevenSouth output $FINAL_PATH

if [ $PRINT_OPTION ]; then
    lpr -P ENVY_5010 -o fit-to-page -o sides=two-sided-short $FINAL_PATH
fi
