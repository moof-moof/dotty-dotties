#!/bin/bash

echo "Quietly nullifying the ~/.xsession-errors file: [STARTS SCRIPT]"

echo "(Sleeping for 30 secs to make sure the spamming has commenced ...)"

/bin/sleep 30

if [ ~/.xsession-errors.old ]; then
    rm -f ~/.xsession-errors.old ;
fi;

rm -f ~/.xsession-errors;  ln -s /dev/null ~/.xsession-errors

echo "There, done nullifying for now: [STOPS SCRIPT]"
