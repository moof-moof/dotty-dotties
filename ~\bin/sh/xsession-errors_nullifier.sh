#!/bin/bash

echo "Quietly nullifying the ~/.xsession-errors file: [STARTS SCRIPT]"
echo "(Sleeping for 1 minute to make sure the spamming has commenced ...)"

rm -f ~/.xsession-errors ; rm -f ~/.xsession-errors.old ; ln -s /dev/null ~/.xsession-errors

echo "There, done nullifying for now: [STOPS SCRIPT]"
