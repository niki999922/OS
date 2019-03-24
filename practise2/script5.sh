#!/bin/bash

#-n sort of number
#-k show specific 
# "FS = символ разделитель полей"

awk -F ":" '{ print $3, $1;}' /etc/passwd | sort -n -k 1