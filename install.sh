#!/bin/sh

# Make sure a bin folder on the home folder exists.
# This will be the home for the scripts.
# Note: This assumes $HOME/bin is already on PATH
if [ ! -d $HOME/bin ]; then
    mkdir $HOME/bin
fi

cp -ru scripts/* $HOME/bin