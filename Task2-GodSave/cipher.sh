#!/bin/bash
url=$1
wget $url
set=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
set2=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ
key=0
l=$(tail -n 1 ./letter.txt)
for i in {1..26}
do
l=$(echo $l | tr  "${set:0:26}" "${set:1:27}")
l=$(echo $l | tr  "${set2:0:26}" "${set2:1:27}")
echo $l
if echo $l | grep -q -i -e "Queen" -e "Majesty" -e "Mary"
then key=$i
break
fi
done
$(tr "${set:0:26}" "${set:${i}:26+${i}}" < ./letter.txt > decrypted.txt && mv decrypted.txt letter.txt)
$(tr "${set2:0:26}" "${set2:${i}:26+${i}}" <letter.txt >decrypted.txt)


ans="PS. Give me the names."
ans=$(echo $ans | tr  "${set:${i}:26+${i}}" "${set:0:26}")
ans=$(echo $ans | tr  "${set2:${i}:26+${i}}" "${set2:0:26}")
echo "$ans" >> "./encrypted.txt"
$(rm letter.txt)