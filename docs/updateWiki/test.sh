#!/bin/bash

PATH_FILE='/docs/diagram'
FILES_PUML=$(ls .$PATH_FILE -t -U | grep .puml$)

function getAndSaveImg() {
    echo $1
}

for i in $FILES_PUML; do
    getAndSaveImg i
done

for i in $thefile; do
    name=`expr match "$i" '\([a-z_]*\)'` #
    name=${name//_/ }
    name=${name^}
    echo $name
done

removeAllSvg