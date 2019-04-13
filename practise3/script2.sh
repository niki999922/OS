#!/bin/bash

# -k key and number column

ps -o pid,time,stime | tail -n +2 | sort -r -k2 | head -n 1| awk '{print $1 ": " $3}'