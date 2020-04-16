#!/bin/bash

echo "How many coins to be flipped:"
read n

echo "How many times to be flipped:"
read t

str=""
numOfPossibilities=0

declare -A events

flip(){
	str=""
	check=$((RANDOM%2))

	if [ $check -eq 1 ]
	then
		str=H
	else
		str=T
	fi
}

outComes(){

	for((i=0;i<$t;i++))
	do
		for((j=0;j<$n;j++))
		do
			#Invoking flip function
			flip
			event=$event$str
		done

		eventsDictionary[$i]=$event

		event=""
	done

	echo "Total out comes:" ${eventsDictionary[@]}
}

sortOutcomes(){
	printf '%s\n' "${eventsDictionary[@]}" | sort -n
}

findMaxOccuredPercent(){

	numOfTimes=0

	for((i=0;i<${#eventsDictionary[@]};i++))
	do
		temp=0
		for((j=1;j<${#eventsDictionary[@]};j++))
		do
			if [ "${eventsDictionary[$i]}" = "${eventsDictionary[$j]}" ]
			then
				((temp++))
			fi

			if [ $temp -gt $numOfTimes ]
			then
				maxOccured=${eventsDictionary[$i]}
				numOfTimes=$temp
			fi
		done
	done

	percent=$(( $numOfTimes * 100  / $t  ))
	echo $maxOccured "is occured " $numOfTimes "times"
	echo "Winning combination $maxOccured percentage is $percent"
}

outComes

sortOutcomes

findMaxOccuredPercent
