#!/bin/bash
dr="/bin/"

for file in $(ls $dr) 
do
	if [[ -r "$dr/$file" && -x "$dr/$file" ]]
then
grep -Eos "^#!/bin/.*" "$dr/$file" | sed -E "s|^|$file |"
fi
done | sort -k 2 