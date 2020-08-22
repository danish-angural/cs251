#!/bin/bash
if [[ $# -ne 3 ]]
then { echo 'Usage: ./verifier.sh <source file> <testcases url> <cut-dirs arg>'; exit 1; } 
fi
wget -q -r -np -nH --cut-dirs=$3 $2
dir=$(basename $2)
rm -f a.out
g++ $1
cp $1 ${1##*/}
cd $dir
mkdir my_outputs
cd inputs
for name in *
	do {
		if [[ ${name#*.} == in ]] 
		then {
			./../../a.out < $name > ../my_outputs/${name%.*}.out;
		}
		fi
	}
done
cd ../outputs
echo "The failed testcases are: " >> ../../feedback.txt
for myfile in ../my_outputs/* 
	do {
		for file in * 
			do {
				if [[ ${myfile##*/} = $file ]]  
				then {
					if ! diff $myfile $file > /dev/null
					then echo ${file%.*} >> ../../feedback.txt
					fi
				}
				fi
			}
		done
	}
done
if [[ $(wc -l ../../feedback.txt) = "1 ../../feedback.txt" ]]
then echo "All testcases passed!"
fi
