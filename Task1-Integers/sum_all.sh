#!/bin/bash
if [[ $# = 0 ]] 
then  { echo "No numbers given"; exit 1; }
else {
s=0
for i in "$@"
	do s=$(./sum.sh $s "$i";) 
done
echo "$s"
}
fi


