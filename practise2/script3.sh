#!/bin/bash

mail="[a-zA-Z0-9_.]+@[a-zA-Z0-9_]+(\\.[a-zA-Z]+)+"

#-w word with  _haha_
#-o only matching part of string eqauls with expression

grep -E -h -s -r -o -w $mail "/etc/" | awk '{printf("%s, ",$1)}' > emails.lst
cat emails.lst