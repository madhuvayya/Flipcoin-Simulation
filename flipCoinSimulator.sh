#!/bin/bash

echo "enter a number to flip coin:"
read n

singletPossible=("H" "T")
doubletPossible=("HH" "HT" "TH" "TT")
tripletPossible=("HHH" "HHT" "HTH" "HTT" "THH" "THT" "TTH" "TTT")

declare -A singlet
declare -A doublet
declare -A triplet

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

	tripletCheck=$((RANDOM%8))
	case $doubletCheck in
		0 )
			triplet[$i]="HHH"
			;;
		1 )
			triplet[$i]="HHT"
			;;
		2 )
			triplet[$i]="HTH"
			;;
		3 )
			triplet[$i]="HTT"
			;;
		4 )
			triplet[$i]="THH"
			;;
		5 )
			triplet[$i]="THT"
			;;
		6 )
			triplet[$i]="TTH"
			;;
		7 )
			triplet[$i]="TTT"
			;;
	esac
done

echo ${singlet[@]}
echo ${!singlet[@]}

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
echo "Singlet percentage: $per"

echo ${doublet[@]}
echo ${!doublet[@]}

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
echo "Doublet percentage: $per"

echo ${triplet[@]}
echo ${!triplet[@]}

k=0
for i in ${tripletPossible[@]}
do
	t=0
	for j in ${triplet[@]}
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
echo "Triplet percentage: $per"
