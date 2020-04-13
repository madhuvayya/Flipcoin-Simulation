#!/bin/bash

echo "enter a number to flip coin:"
read n

declare -A outComes

for((i=0;i<n;i++))
do
	random=$((RANDOM%2))

	if [ $random -eq 1 ]
	then
		outComes[$i]="H"
	else
		outComes[$i]="T"
	fi
done

echo ${outComes[@]}
echo ${!outComes[@]}
