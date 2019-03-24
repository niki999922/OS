#!/bin/bash

#exec 3> error.log
#exec 2> /dev/null 

#echo "" >&3
# -e use regular
# -r do recursive
# -s don't show error text
# -h don't print name file in result search

grep -E -s -r -h "ACPI.*" "/var/log/" > error.log
grep -E -r -h "^.*[[:alnum:]]\.[[:alpha:]]" error.log