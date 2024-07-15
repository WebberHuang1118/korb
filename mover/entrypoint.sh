#!/bin/bash -xe
if [[ $1 == "sync" ]]; then
    rsync -I --copy-devices --write-devices --no-whole-file --inplace -v --progress /source /dest
elif [[ $1 == "sleep" ]]; then
    cat
else
    echo "No command given. Make sure to use the correct mover image for your korb version."
    exit 1
fi
