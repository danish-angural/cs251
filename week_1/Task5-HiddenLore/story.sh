#!/bin/bash
key=$2 
touch $3
while true 
	do { 
		k=false
		for file in $1/*
		do {
				if [[ $key = $(head -2 $file | tail -1) ]]
				then  {
					k=true
					echo $(head -1 $file | tail -1) >> $3
					key=$(head -3 $file | tail -1)
					break
				}
				fi
			}
		done
		if [[ $k = false ]] 
		then exit 0
		fi
	}
done
				
