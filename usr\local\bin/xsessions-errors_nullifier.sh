#!/bin/bash

echo "Quietly diverting the spamming .xsession-errors file:"

rm -f ~/.xsession-errors ; rm -f ~/.xsession-errors.old ; ln -s /dev/null ~/.xsession-errors
