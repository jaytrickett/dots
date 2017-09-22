#!/bin/bash

cpy=33
arr=(./*)
d="${PWD##*/}"
nd=$d"_dup"

mkdir $nd

main_loop=1

while [ $main_loop -le $cpy ]; do

	cnt=$(( $main_loop*1000 ))

		for ((i=0; i<${#arr[@]}; i++)); do
				
			fname=$(( $cnt + $i ))
			
			cp "${arr[$i]}" $nd/$fname".jpg" 

		done

	let main_loop=main_loop+1

done

