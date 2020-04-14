#!/bin/bash -x

echo "enter a number to flip coin:"
read n

singletPossible=("H" "T")
doubletPossible=("HH" "HT" "TH" "TT")

declare -A singlet
declare -A doublet

for((i=0;i<n;i++))
do
	singletCheck=$((RANDOM%2))

	if [ $singletCheck -eq 1 ]
	then
		singlet[$i]="H"
	else
		singlet[$i]="T"
	fi

	doubletCheck=$((RANDOM%4))
	case $doubletCheck in
		0 )
			doublet[$i]="HH"
			;;
		1 )
			doublet[$i]="HT"
			;;
		2 )
			doublet[$i]="TH"
			;;
		3 )
			doublet[$i]="TT"
			;;
	esac

done

echo ${singlet[@]}
echo ${!singlet[@]}

echo ${doublet[@]}
echo ${!doublet[@]}

k=0
for i in ${singletPossible[@]}
do
	t=0
	for j in ${singlet[@]}
	do
		if [ $i = $j ]
		then
			((t++));
		fi
	done

	if [ $t -gt $k ]
	then
		max=$i
		k=$t
	fi
done

per=$(($k / $n * 100))
echo "Percentage: $per"

k=0
for i in ${doubletPossible[@]}
do
	t=0
	for j in ${doublet[@]}
	do
		if [ $i = $j ]
		then
			((t++));
		fi
	done

	if [ $t -gt $k ]
	then
		max=$i
		k=$t
	fi
done

per=$(($k / $n * 100))
echo "Percentage: $per"
