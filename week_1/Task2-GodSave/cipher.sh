#!/bin/bash
url=$1
if [ "$url" == "" ] 
then echo 'Usage: ./cipher.sh <url>'
exit 1
fi

wget -q "$url"
mv "$(basename $url)" encrypted.txt
set=aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZaAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ
l=$(tail -n 1 ./encrypted.txt)
for i in {1..26}
do
l=$(echo "$l" | tr  "${set:0:52}" "${set:2:54}")
if echo "$l" | grep -q -i -e "Queen" -e "Majesty" -e "Mary"
then
break
fi
done
(( i*=2 ))
tr "${set:0:52}" "${set:${i}:52+${i}}" < encrypted.txt > deciphered.txt

ans="PS. Give me the names."
ans=$(echo "$ans" | tr  "${set:${i}:52+${i}}" "${set:0:52}")
echo "$ans" >> "./encrypted.txt"
