#!/bin/bash
<<<<<<< HEAD
key=$2 
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
				
=======
>>>>>>> 51200249dd910caa0b1f14818b7d223f9f2cd5d0
