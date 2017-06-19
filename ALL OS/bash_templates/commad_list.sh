#!/bin/bash

commands="$@"
RESULT=0
number_re='^[0-9]+$'

function space {
	echo
	echo "------------=========------------"
	echo
}

function communicatemessage {
	open -a BlinkScreen

	if [ "$#" -eq 2 ]; then
		echo -e $1
		echo
	fi

	if [ "$#" -eq 2 ]; then
		say "Script: " $2
	fi
}


declare -a FUNCTIONS_NAMES
declare -a FUNCTIONS_COMMANDS

FUNCTIONS_NAMES[${#FUNCTIONS_NAMES[@]}]='ant'
FUNCTIONS_COMMANDS[${#FUNCTIONS_COMMANDS[@]}]='FUNCTION.ANT'

FUNCTIONS_NAMES[${#FUNCTIONS_NAMES[@]}]='ant all'
FUNCTIONS_COMMANDS[${#FUNCTIONS_COMMANDS[@]}]='FUNCTION.ANT_ALL'

FUNCTIONS_NAMES[${#FUNCTIONS_NAMES[@]}]='ant clean all'
FUNCTIONS_COMMANDS[${#FUNCTIONS_COMMANDS[@]}]='FUNCTION.ANT_CLEAN_ALL'

FUNCTIONS_NAMES[${#FUNCTIONS_NAMES[@]}]='grunt build'
FUNCTIONS_COMMANDS[${#FUNCTIONS_COMMANDS[@]}]='FUNCTION.GRUND_BUILD'

FUNCTIONS_NAMES[${#FUNCTIONS_NAMES[@]}]='grunt build && ant all'
FUNCTIONS_COMMANDS[${#FUNCTIONS_COMMANDS[@]}]='FUNCTION.GRUND_BUILD_AND_ANT_ALL'

FUNCTIONS_NAMES[${#FUNCTIONS_NAMES[@]}]='grunt build && ant clean all'
FUNCTIONS_COMMANDS[${#FUNCTIONS_COMMANDS[@]}]='FUNCTION.GRUND_BUILD_AND_ANT_CLEAN_ALL'


function FUNCTION.ANT {
	echo "ant"

	# always fail
	return 1

	# return result
	# return $?
}

function FUNCTION.ANT_ALL {
	echo "ant all"
	return $?
}

function FUNCTION.ANT_CLEAN_ALL {
	echo "ant clean all"
	return $?
}

function FUNCTION.GRUND_BUILD {
	echo "grunt build"
	return $?
}

function FUNCTION.GRUND_BUILD_AND_ANT_ALL {
	echo "grunt build && ant all"
	return $?
}

function FUNCTION.GRUND_BUILD_AND_ANT_CLEAN_ALL {
	echo "grunt build && ant clean all"
	return $?
}


ARRAY_LENGTH=${#FUNCTIONS_NAMES[@]}


echo
echo "Commands: "
echo
echo "   : exit"

for i in "${!FUNCTIONS_NAMES[@]}"; do
	command_name=${FUNCTIONS_NAMES[$i]}
	echo "  $i: $command_name"
done


echo
echo -n "Your choise: "
if [ -z "$commands" ]; then
	read commands
else
	echo $commands
fi
echo

if [ -z "$commands" ]; then
	communicatemessage "No command provided\nEXIT!" "No command provided! Exit!"
	exit 0
fi

RESULT=0
for command in $commands
do
	if ! [[ $command =~ $number_re ]]; then
		communicatemessage "No valid command provided\nEXIT!" "No valid command provided! Exit!"
		exit 1
	fi

	if ! [ "${command}" -lt "${ARRAY_LENGTH}" ]; then
		communicatemessage "No valid command provided - to big number\nEXIT!" "No valid command provided! To big number! Exit!"
		echo
		exit 1
	fi


	echo ${FUNCTIONS_NAMES[$command]}
	space
	${FUNCTIONS_COMMANDS[$command]}
	RESULT=$?


	echo "$RESULT"
	if [ $RESULT -ne 0 ]; then
		communicatemessage "Script:\nFailed! Failed! Failed!" "Failed! Failed!"
		exit $RESULT
	fi
done


communicatemessage "Script:\nsuccessful!" "successful!"
exit $RESULT
