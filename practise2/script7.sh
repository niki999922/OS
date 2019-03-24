#!/bin/bash

#-i ignore regist
#-r reverse порядок
#-c count equal strings

man bash | grep -o -i  "[a-zA-Z]\{4,\}" | tr "[:upper:]" "[:lower:]" | sort | uniq -c | sort -R -r -n | head -3