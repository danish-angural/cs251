a="100.C 90.XC 50.L 40.XL 10.X 9.IX 5.V 4.IV 1.I"
n=$1
s=""
while [[ $n > 0 ]]
do {
	for v in $a
		do {
			if [[ ${v%.*} -lt n ]] || [[ ${v%.*} -eq n ]] 
			then { s+=${v#*.}; (( n-=${v%.*} )); break; }
			fi
		}
	done
}
done	
echo $s;