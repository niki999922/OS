#!/bin/bash

# -a all process
# -u user

user="nikita"
ps -a -u $user -o pid,command | tail -n +2 | awk '{printf $1 ": " $2 "\n"}' > out1.txt
wc -l out1.txt >> out1.txt
cat out1.txt