#!/bin/bash

arr=(./*)
d="${PWD##*/}"
nd=$d"_resized"

mkdir $nd

for ((i=0; i<${#arr[@]}; i++)); do

	y=$(identify -format "%w" "${arr[$i]}")

		if [[ $y -gt 1280 ]]

		then

			convert "${arr[$i]}" -resize 1280x1024 $nd/"${arr[$i]}"

		else

			cp "${arr[$i]}" $nd/"${arr[$i]}"

		fi


done
