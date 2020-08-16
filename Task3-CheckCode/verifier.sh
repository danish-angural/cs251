#!/bin/bash
wget -q -r -np -nH --cut-dirs=$3 $2
dir=0
for file in *
	do {
		if [ -d $file ] 
		then dir=$file
		fi
	}
done
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
if [[ $(wc -l ../../feedback.txt) = 1 ]]
then echo "All testcases passed!"
fi
